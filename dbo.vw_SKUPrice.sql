-- Создано представление dbo.vw_SKUPrice
-- Возвращает все атрибуты продуктов из таблицы dbo.SKU и расчетный атрибут со стоимостью одного продукта (используя функцию dbo.udf_GetSKUPrice)

CREATE VIEW dbo.vw_SKUPrice AS
SELECT 
	ID, 
	Code, 
	Name,
	dbo.udf_GetSKUPrice(ID) AS Price
FROM dbo.SKU;