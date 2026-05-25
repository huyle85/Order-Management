Go
CREATE PROCEDURE sp_GetAllProductsSortedByPrice
AS
BEGIN
    SELECT 
        p.ProductID, 
        p.ProductName, 
        p.UnitPrice, 
        p.CategoryID, 
        c.CategoryName
    FROM Product p
    INNER JOIN Category c ON p.CategoryID = c.CategoryID
    ORDER BY p.UnitPrice ASC;
END;
GO


CREATE PROCEDURE get_categoryID
	@IDInput INT
AS
Begin 
	SELECT*
	From Category
	Where CategoryID = @IDInput
End
EXEC get_categoryID 6;

DROP PROCEDURE get_categoryID;
GO

