from fastapi import FastAPI
from repositories import Product, Category, Customer

app = FastAPI(title="Học OOP lấy toàn bộ sản phẩm")
product_service = Product()  
category_service = Category()
customer_2026 = Customer() 

@app.get("/all-products")
def get_all():
    data = product_service.get_all()
    return data
@app.get("/getID/{id}")
def get_id(id: int):
    data = category_service.get_category(id = id)
    return data

@app.get("/get_customer_2026")
def get_customer():
    data = customer_2026.get_customer_2026()
    return data