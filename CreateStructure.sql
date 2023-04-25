-- Создание таблицы dbo.SKU (ID identity, Code, Name)
-- Ограничение на уникальность поля Code
-- Поле Code вычисляемое: "s" + ID

CREATE TABLE dbo.SKU (
	ID INT IDENTITY,
	Code AS 's' + CAST(ID AS VARCHAR) UNIQUE,
	Name VARCHAR(255),
	PRIMARY KEY(ID)
);

-- Создание таблицы Family (ID identity, SurName, BudgetValue)

CREATE TABLE dbo.Family (
	ID INT IDENTITY,
	SurName VARCHAR(255),
	BudgetValue DECIMAL(18, 2),
	PRIMARY KEY(ID)
);