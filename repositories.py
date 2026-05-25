from database import DatabaseConnection

class BaseRepo:
    def __init__(self):
        self.db = DatabaseConnection()
    def execute_query(self, function_name: str, params: tuple = None):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        try:
            query = f"EXEC {function_name}"
            if params:
                cursor.execute(query, params)
            else:
                cursor.execute(query)
            rows = cursor.fetchall()
            return rows
        except Exception as ex:
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
