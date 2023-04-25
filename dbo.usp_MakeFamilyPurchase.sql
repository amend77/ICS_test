-- Создание процедуры dbo.usp_MakeFamilyPurchase 
-- Входной параметр (@FamilySurName varchar(255)) одно из значений атрибута SurName таблицы dbo.Family
-- Процедура при вызове обновляет данные в таблице dbo.Family в поле BudgetValue по логике
-- dbo.Family.BudgetValue - sum(dbo.Basket.Value), где dbo.Basket.Value покупки для переданной в процедуру семьи
-- При передаче несуществующего dbo.Family.SurName пользователю выдается ошибка, что такой семьи нет

CREATE PROC usp_MakeFamilyPurchase
	@FamilySurName AS VARCHAR(255)
AS
UPDATE dbo.Family 
SET BudgetValue = dbo.Family.BudgetValue - 
	(
	SELECT SUM(Value) 
	FROM dbo.Basket t1
	INNER JOIN dbo.Family t2
	ON t1.ID_Family = t2.ID
	WHERE t2.SurName = @FamilySurName
	)
WHERE dbo.Family.SurName = @FamilySurName;
IF @FamilySurName NOT IN (SELECT SurName FROM dbo.Family)
BEGIN 
	PRINT 'Такой семьи нет'
END;