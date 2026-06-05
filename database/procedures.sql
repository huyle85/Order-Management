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

-- list customer who place order in year 2026
GO
CREATE PROCEDURE get_customer_2026
AS
Begin
	Select a.CustomerID, CustomerName, CustomerAdress, OrderDate
	From Customer a join [Order] b on a.CustomerID = b.CustomerID
	Where YEAR(b.OrderDate) = 2026
End
GO
ALTER PROCEDURE get_customer_2026
AS
Begin
	Select a.CustomerID, CustomerName, CustomerAdress, OrderDate
	From Customer a join [Order] b on a.CustomerID = b.CustomerID
	Where YEAR(b.OrderDate) = 2026
End

Select* from Customer

go
Create Procedure get_information_orderid
@ID_input INT
as 
begin
	Select a.OrderDate, b.ProductID,c.ProductName, c.UnitPrice, a.CustomerID, x.CustomerName
	From [Order] a 
	join OrderDetail b on a.OrderID = b.OrderID 
	join Product c on b.ProductID = c.ProductID
	join Customer x on a.CustomerID = x.CustomerID
	where a.OrderID = @ID_input
end

--update price
go
Create Procedure UpdateUnitPrice
@ProductID INT,
@NewPrice INT
as
begin
	begin try
		begin transaction;
		update Product
		Set UnitPrice = @NewPrice
		Where ProductID = @ProductID
		Commit transaction
		print 'Update sucsses!';
	end try
	begin catch
		rollback transaction;
		print ERROR_MESSAGE();
	end catch
end

-- Giả sử cập nhật sản phẩm có ID là 1 thành giá mới là 250
EXEC UpdateUnitPrice @ProductID = 1, @NewPrice = 250;
select*
from Product
where ProductID = 1