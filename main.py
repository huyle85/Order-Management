from fastapi import FastAPI
from repositories import Product, Category, Customer, Order

app = FastAPI(title="Học OOP lấy toàn bộ sản phẩm")
product_service = Product()  
category_service = Category()
customer_2026 = Customer() 
Order = Order()

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

@app.get("/get_information_orderid/{id}")
def get_information_orderid(id: int):
    data = Order.get_information_id(id = id)
    return data