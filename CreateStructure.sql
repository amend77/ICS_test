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

-- Создание таблицы Basket 
	-- (ID identity, 
	-- ID_SKU (внешний ключ на таблицу dbo.SKU), 
	-- ID_Family (Внешний ключ на таблицу dbo.Family),
	-- Quantity, 
	-- Value, 
	-- PurchaseDate, 
	-- DiscountValue)
-- Ограничение, что поле Quantity и Value не могут быть меньше 0
-- Добавить значение по умолчанию для поля PurchaseDate: дата добавления записи (текущая дата)

CREATE TABLE dbo.Basket (
	ID INT IDENTITY,
	ID_SKU INT,
	ID_Family INT,
	Quantity DECIMAL(18, 0) CHECK(Quantity >= 0),
	Value DECIMAL(18, 2) CHECK(Value >= 0),
	PurchaseDate DATE NOT NULL
		CONSTRAINT DFT_orderdate DEFAULT(SYSDATETIME()),
	DiscountValue DECIMAL(18, 2),
	CONSTRAINT ID_SKU FOREIGN KEY(ID_SKU) REFERENCES dbo.SKU (ID),
	CONSTRAINT ID_Family FOREIGN KEY(ID_Family) REFERENCES dbo.Family (ID)
);