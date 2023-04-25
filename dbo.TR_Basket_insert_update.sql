-- Создание триггера dbo.TR_Basket_insert_update
-- Если в таблицу dbo.Basket за раз добавляются 2 и более записей одного ID_SKU, 
-- то значение в поле DiscountValue, для этого ID_SKU рассчитывается по формуле Value * 5%, иначе DiscountValue = 0

CREATE TRIGGER TR_Basket_insert_update ON dbo.Basket AFTER INSERT
AS
UPDATE dbo.Basket
SET DiscountValue = Value * 0.05
WHERE dbo.Basket.ID_SKU IN
	(
	SELECT ID_SKU
	FROM inserted
	GROUP BY ID_SKU
	HAVING COUNT(ID_SKU) >= 2
	)
UPDATE dbo.Basket
SET DiscountValue = 0
WHERE dbo.Basket.ID_SKU IN
	(
	SELECT ID_SKU
	FROM inserted
	GROUP BY ID_SKU
	HAVING COUNT(ID_SKU) < 2
	);