import pyodbc
from fastapi import HTTPException

class DatabaseConnection:
    def __init__(self):
        self.conn_str = (
            "DRIVER={ODBC Driver 17 for SQL Server};"
            "SERVER=DESKTOP-OMNGU7K;"
            "DATABASE=Marketplace;"
            "Trusted_Connection=yes;"
        )
    def get_connection(self):
        try:
            return pyodbc.connect(self.conn_str)
        except Exception as ex:
            raise HTTPException(status_code=500, detail="Erorr connect database")