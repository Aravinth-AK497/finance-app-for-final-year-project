from fastapi import APIRouter, UploadFile, File, Depends, HTTPException
from app.services.ocr_service import ocr_service
from app.models.transaction import TransactionCreate, TransactionResponse
from app.models.user import UserResponse
from app.services.transaction_service import transaction_service
from app.api import deps
from datetime import datetime

router = APIRouter()

@router.post("/upload", response_model=TransactionResponse)
async def upload_receipt(
    file: UploadFile = File(...),
    current_user: UserResponse = Depends(deps.get_current_user)
):
    if file.content_type not in ["image/jpeg", "image/png"]:
        raise HTTPException(status_code=400, detail="Invalid file type")
    
    content = await file.read()
    text = ocr_service.extract_text(content)
    parsed_data = ocr_service.parse_receipt(text)
    
    if parsed_data["amount"] == 0:
        # Fallback if no amount found, or just return partial data
        # Ideally we might return a draft generic object for user confirmation
        pass

    txn_create = TransactionCreate(
        amount=parsed_data["amount"],
        merchant=parsed_data["merchant"],
        description=f"OCR Receipt: {parsed_data['merchant']}",
        source="OCR",
        date=datetime.utcnow(),
        category="Uncategorized" # Let service handle or auto-categorize
    )
    
    return transaction_service.create(txn_create, current_user.id)
