from pydantic import BaseModel

class ProductCreate(BaseModel):
    # ProductID: int
    ProductName: str
    UnitPrice: int
    CategoryID: int