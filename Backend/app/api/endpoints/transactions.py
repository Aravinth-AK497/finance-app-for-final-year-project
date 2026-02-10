from typing import List
from fastapi import APIRouter, Depends, HTTPException
from app.models.transaction import TransactionCreate, TransactionResponse
from app.models.user import UserResponse
from app.services.transaction_service import transaction_service
from app.api import deps
from pydantic import BaseModel

router = APIRouter()

class SMSPayload(BaseModel):
    text: str
    sender: str

@router.post("/", response_model=TransactionResponse)
def create_transaction(
    txn: TransactionCreate,
    current_user: UserResponse = Depends(deps.get_current_user)
):
    return transaction_service.create(txn, current_user.id)

@router.get("/", response_model=List[TransactionResponse])
def read_transactions(
    skip: int = 0,
    limit: int = 100,
    current_user: UserResponse = Depends(deps.get_current_user)
):
    txns = transaction_service.get_user_transactions(current_user.id, skip, limit)
    # Convert _id to id for response
    for txn in txns:
        txn["id"] = str(txn["_id"])
    return txns

@router.post("/sms", response_model=TransactionResponse)
def parse_sms(
    payload: SMSPayload,
    current_user: UserResponse = Depends(deps.get_current_user)
):
    txn = transaction_service.process_sms(payload.text, payload.sender, current_user.id)
    if not txn:
        raise HTTPException(status_code=400, detail="Could not extract transaction from SMS")
    txn["id"] = str(txn["_id"])
    return txn
