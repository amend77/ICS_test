-- Создание таблицы dbo.SKU (ID identity, Code, Name)
-- Ограничение на уникальность поля Code
-- Поле Code вычисляемое: "s" + ID

CREATE TABLE dbo.SKU (
	ID INT IDENTITY,
	Code AS 's' + CAST(ID AS VARCHAR) UNIQUE,
	Name VARCHAR(255),
	PRIMARY KEY(ID)
);