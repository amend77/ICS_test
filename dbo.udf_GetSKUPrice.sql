-- Создание функции dbo.udf_GetSKUPrice.sql в ветке Functions)
-- Входной параметр @ID_SKU
-- Рассчитывает стоимость передаваемого продукта из таблицы dbo.Basket по формуле: сумма Value по переданному SKU / сумма Quantity по переданному SKU
-- На выходе значение типа decimal(18, 2)

CREATE FUNCTION dbo.udf_GetSKUPrice (@ID_SKU AS INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
	DECLARE @price DECIMAL(18, 2);
	SELECT @price = SUM(t.Value) / SUM(t.Quantity)
	FROM dbo.Basket t
	WHERE t.ID_SKU = @ID_SKU
	RETURN @price
END;