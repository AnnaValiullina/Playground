USE [BD]GO--�.�. READ COMMITTED �������� �� �������� � ��������� ������, �� ��� ��������SET TRANSACTION ISOLATION LEVEL READ COMMITTEDBEGIN TRANSACTIONSELECT * FROM car_brand
WHERE volume = 70
COMMIT