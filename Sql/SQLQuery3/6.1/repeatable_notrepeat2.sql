USE[BD]
GO

--������ ��������, ������ ���  ������� ������ ���������� 
--�� ����� �������� ������, �������� ������� �����������,
-- ���� �� �� ��������.

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ
BEGIN TRANSACTION 
UPDATE car_brand SET brand_name = '�������' 
WHERE volume = 70
COMMIT