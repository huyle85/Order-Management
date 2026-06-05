from pydantic import BaseModel
from typing import Optional

class ProductCreate(BaseModel): #post
    # ProductID: int
    ProductName: str
    UnitPrice: int
    CategoryID: int

class Product_update(BaseModel): #put
    ProductID: int
    ProductName: Optional[str] = None
    UnitPrice: Optional[int] = None
    CategoryID: Optional[int] = None