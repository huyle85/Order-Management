# main.py
from fastapi import FastAPI
from repositories import Product

app = FastAPI(title="Học OOP lấy toàn bộ sản phẩm")
product_repo = Product()

@app.get("/all-products")
def get_all():
    data = product_repo.get_all()
    return data