#include <algorithm>
#include <cmath>
#include <iostream>
#include <vector>
#include <chrono>
#include <omp.h>
#include<fstream> 
using namespace std;
using namespace std::chrono;


ofstream output("output_PS4_ex2d.txt", std::ofstream::app); //we will save the results of the computations in the text file //output_PS4_ex2d.txt

double gaussian_box_muller() {
  double x = 0.0;
  double y = 0.0;
  double euclid_sq = 0.0;

  do {
    x = 2.0 * rand() / static_cast<double>(RAND_MAX)-1;
    y = 2.0 * rand() / static_cast<double>(RAND_MAX)-1;
    euclid_sq = x*x + y*y;
  } while (euclid_sq >= 1.0);

  return x*sqrt(-2*log(euclid_sq)/euclid_sq);
}

double monte_carlo_asian_call_price(const int& num_sims, const int& m, const double& S, const double& K,
		const double& r, const double& v, const double& T) {

  int tid;
  double payoff_sum = 0.0;
  double h = T/m;
  //generate a vector of random numbers
  //if you do it later already having the thread then all of them will use the same random numbers --> have exactly the same path of prices
  //for this reason we need to generate random numbers before the #pragma
  vector<double> random = {};
  for(int k = 0; k < m*num_sims; k++){
	  random.push_back(gaussian_box_muller());
  }

#pragma omp parallel private(tid) shared(random) reduction(+:payoff_sum)//Can't use collapse here since the loops are dependent
{
  tid = omp_get_thread_num();

#pragma omp for
  for (int i = 0; i < num_sims; i++) {
	  vector<double> random_tid = {}; // we must update this vector of random numbers each iteration!!!

	//now having the array of random numbers (random) lets fill the array of random numbers for each simulation
	#pragma omp critical // we must use critical because of it could be a conflict with .back() and .pop_back()
	 {
	  for(int q = 0; q < m; q++){
		  random_tid.push_back(random.back());
		  random.pop_back();
	  }
	}

	  vector<double> S_asset = {}; // for each simulation it will be a new vector of prices
	  S_asset.push_back(S);

	  double S_bar = S; // later on we will sum it with the prices (at other days) in the path
	  for(int j = 0; j < m; j++){
		// compute the price on the next step
		  double s = S_asset.back() * exp(h*(r-0.5*v*v)) * exp(sqrt(v*v*h)*random_tid[j]);
		  S_asset.push_back(s);
		  S_bar += s;
	  }
	// Now lets calculate the average price for 1 simulation (S_bar)
	S_bar = S_bar/(static_cast<double>(m+1));
	payoff_sum += max(S_bar - K, 0.0);

  }

}// close pragma parallel

  return (payoff_sum / static_cast<double>(num_sims)) * exp(-r*T);
}

double monte_carlo_asian_put_price(const int& num_sims, const int& m, const double& S, const double& K,
		const double& r, const double& v, const double& T) {

  int tid;
  double payoff_sum = 0.0;
  double h = T/m;
  // generate a vector of random numbers
  //if you do it later already having the thread then all of them will use the same random numbers --> have exactly the same path of prices
  //for this reason we need to generate random numbers before the #pragma
  vector<double> random = {};
  for(int k = 0; k < m*num_sims; k++){
	  random.push_back(gaussian_box_muller());
  }

#pragma omp parallel private(tid) shared(random) reduction(+:payoff_sum)//Can't use collapse here since the loops are dependent
{
  tid = omp_get_thread_num();

#pragma omp for
  for (int i = 0; i < num_sims; i++) {
	  vector<double> random_tid = {}; // we must update this vector of random numbers each iteration!!!

	//now having the array of random numbers (random) lets fill the array of random numbers for each simulation
	#pragma omp critical // we must use critical because of it could be a conflict with .back() and .pop_back()
	 {
	  for(int q = 0; q < m; q++){
		  random_tid.push_back(random.back());
		  random.pop_back();
	  }
	}

	  vector<double> S_asset = {}; // for each simulation it will be a new vector of prices
	  S_asset.push_back(S);

	  double S_bar = S; // later on we will sum it with the prices (at other days) in the path
	  for(int j = 0; j < m; j++){
		// compute the price on the next step
		  double s = S_asset.back() * exp(h*(r-0.5*v*v)) * exp(sqrt(v*v*h)*random_tid[j]);
		  S_asset.push_back(s);
		  S_bar += s;
	  }
	// Now lets calculate the average price for 1 simulation (S_bar)
	S_bar = S_bar/(static_cast<double>(m+1));
	payoff_sum += max(K - S_bar, 0.0);

  }

}// close pragma parallel

  return (payoff_sum / static_cast<double>(num_sims)) * exp(-r*T);
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

int main() {

  auto start = steady_clock::now();

  // Parameters
  int num_sims = 10000;   // Number of simulated asset paths
  int m = 100;
  double S = 100.0;  // Option price
  double K = 100.0;  // Strike price
  double r = 0.05;   // Risk-free rate (5%)
  double v = 0.2;    // Volatility of the underlying (20%)
  double T = 1.0;    // One year until expiry


  // Then we calculate the call/put values via Monte Carlo
  double call = monte_carlo_asian_call_price(num_sims, m, S, K, r, v, T);
  auto inter = steady_clock::now();
  double put = monte_carlo_asian_put_price(num_sims, m, S, K, r, v, T);

  // Finally we output the parameters and prices
  std::cout << "Number of Paths: " << num_sims << std::endl;
  std::cout << "Underlying:      " << S << std::endl;
  std::cout << "Strike:          " << K << std::endl;
  std::cout << "Risk-Free Rate:  " << r << std::endl;
  std::cout << "Volatility:      " << v << std::endl;
  std::cout << "Maturity:        " << T << std::endl;
  cout << "-----------------------" << endl;
  std::cout << "Call Price:      " << call << std::endl;
  std::cout << "Put Price:       " << put << std::endl;
  cout << "-----------------------" << endl;

  auto finish = steady_clock::now();
    auto a = duration_cast<milliseconds>(finish - start).count();
  cout << "Runtime of the program: " << a << " milliseconds" << endl;
  cout << "Runtime of the Call: " << duration_cast<milliseconds>(inter - start).count() << " milliseconds" << endl;
  cout << "Runtime of the Put: " << duration_cast<milliseconds>(finish - inter).count() << " milliseconds" << endl;
    
    // Put the information into the text file with the results:
    // runtime : Call : Put
    output << a << " : " << call << " : " << put << endl;
  return 0;
}
