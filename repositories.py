from database import DatabaseConnection

class Product:
    def __init__(self):
        self.db = DatabaseConnection()
    def get_all(self):
        conn = self.db.get_connection()
        cursor = conn.cursor()
        query = "EXEC sp_GetAllProductsSortedByPrice"
        cursor.execute(query)
        rows = cursor.fetchall()
        products_list = []
        for row in rows:
            product_dict = {
                "product_id": row.ProductID,
                "product_name": row.ProductName,
                "unit_price": float(row.UnitPrice),
                "category_id": row.CategoryID
            }
            products_list.append(product_dict)
        cursor.close()
        conn.close()
        return products_list
