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



