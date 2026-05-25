# main.py
from fastapi import FastAPI
from repositories import Product, Category

app = FastAPI(title="Học OOP lấy toàn bộ sản phẩm")
product_service = Product()  
category_service = Category() 

@app.get("/all-products")
def get_all():
    data = product_service.get_all()
    return data
@app.get("/getID/{id}")
def get_id(id: int):
    data = category_service.get_category(id = id)
    return data