from datetime import datetime
from typing import Optional
from pydantic import BaseModel, Field
from app.models.user import PyObjectId

class BudgetBase(BaseModel):
    category: str
    amount_limit: float
    period: str = "MONTHLY" # MONTHLY, WEEKLY
    month: int = datetime.utcnow().month
    year: int = datetime.utcnow().year

class BudgetCreate(BudgetBase):
    pass

class BudgetInDB(BudgetBase):
    id: Optional[PyObjectId] = Field(alias="_id", default=None)
    user_id: str
    spent: float = 0.0

    class Config:
        populate_by_name = True
        json_encoders = {PyObjectId: str}
