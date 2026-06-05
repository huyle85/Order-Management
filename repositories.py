from database import DatabaseConnection
from schemas import ProductCreate, Product_update

class BaseRepo:
    def __init__(self):
        self.db = DatabaseConnection()
    def execute_query(self, function_name: str, params: tuple = None, is_select: bool = True):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        try:
            query = f"EXEC {function_name}"
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
            
            if is_select:
                rows = cursor.fetchall()
                return rows
            else:
                conn.commit()
                return True

        except Exception as ex:
            if not is_select:
                conn.rollback()
            raise ex
        finally:
            cursor.close()
            conn.close()

    
class Product(BaseRepo):
    def get_all(self):
        rows = self.execute_query("sp_GetAllProductsSortedByPrice")
        return [
            {
                "product_id": row.ProductID,
                "product_name": row.ProductName,
                "unit_price": float(row.UnitPrice),
                "category_id": row.CategoryID
            }
            for row in rows
        ]
    
    def add_product(self, p: ProductCreate):
        return self.execute_query(
            "sp_InsertProduct ?, ?, ?",
            (p.ProductName, p.UnitPrice, p.CategoryID),
            is_select=False
        )
    def update_product(self, p: Product_update):
        return self.execute_query(
            "update_Product ?, ?, ?, ?",
            (p.ProductID, p.ProductName, p.UnitPrice, p.CategoryID),
            is_select= False
        )
    
class Category(BaseRepo):
    def get_category(self, id: int):
        rows = self.execute_query("get_categoryID ?", (id,))
        return[
            {
                "category_id": row.CategoryID,
                "category_name": row.CategoryName
            }
            for row in rows
        ]

#list customer who place orders in year 2026
class Customer(BaseRepo):
    def get_customer_2026(self):
        rows = self.execute_query("get_customer_2026")
        return[
            {
                "customer_id": row.CustomerID,
                "customer_name": row.CustomerName,
                "customer_adress": row.CustomerAdress,
                "order_date": row.OrderDate.strftime("%Y-%m-%d")
            }
            for row in rows
        ]
    

#list all product for order id 15
class Order(BaseRepo):
    def get_information_id(self, id: int):
        rows =self.execute_query("get_information_orderid ?", (id,))
        return [
            {
                "Order Date": row.OrderDate,
                "Product ID": row.ProductID,
                "Product Name": row.ProductName,
                "Unit Price": row.UnitPrice,
                "CustomerID": row.CustomerID,
                "Customer Name": row.CustomerName
            }
            for row in rows
        ]