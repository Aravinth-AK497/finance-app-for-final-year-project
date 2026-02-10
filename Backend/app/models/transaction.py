from datetime import datetime
from typing import Optional, List
from pydantic import BaseModel, Field
from app.models.user import PyObjectId

class TransactionBase(BaseModel):
    amount: float
    merchant: str
    category: Optional[str] = "Uncategorized"
    payment_method: str = "Unknown"  # UPI, Card, Cash
    transaction_type: str = "DEBIT"  # DEBIT, CREDIT
    date: datetime = Field(default_factory=datetime.utcnow)
    description: Optional[str] = None
    source: str = "MANUAL" # MANUAL, SMS, OCR
    is_recurring: bool = False

class TransactionCreate(TransactionBase):
    pass

class TransactionInDB(TransactionBase):
    id: Optional[PyObjectId] = Field(alias="_id", default=None)
    user_id: str

    class Config:
        populate_by_name = True
        json_encoders = {PyObjectId: str}

class TransactionResponse(TransactionBase):
    id: str
    user_id: str

    class Config:
        from_attributes = True

class SMSLog(BaseModel):
    user_id: str
    raw_text: str
    sender: str
    received_at: datetime = Field(default_factory=datetime.utcnow)
    processed: bool = False
    transaction_id: Optional[str] = None
