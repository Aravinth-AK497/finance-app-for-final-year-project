from app.workers.celery_app import celery_app
from app.services.ocr_service import ocr_service
from app.services.transaction_service import transaction_service
from app.services.forecasting_service import forecasting_service
from app.models.transaction import TransactionCreate
import base64

@celery_app.task
def process_ocr_receipt(image_b64: str, user_id: str):
    # Decode image
    image_bytes = base64.b64decode(image_b64)
    text = ocr_service.extract_text(image_bytes)
    parsed = ocr_service.parse_receipt(text)
    
    # Save Transaction
    if parsed["amount"] > 0:
        txn = TransactionCreate(
            amount=parsed["amount"],
            merchant=parsed["merchant"],
            category="Uncategorized", 
            source="OCR_ASYNC",
            description="Processed in background"
        )
        # Note: We need a way to inject DB session or ensure service handles new connection in worker
        # `transaction_service` initializes DB on import, so strictly speaking it shares the global `db` which might need reconnection in fork.
        # For simplicity, assuming standard fork safety or solo worker. 
        # In prod, re-init db in task.
        transaction_service.create(txn, user_id)
    
    return parsed

@celery_app.task
def generate_weekly_report(user_id: str):
    # Logic to fetch last week transactions, summarize, and potentially email
    # For now just returning a summary string
    return f"Weekly report generated for {user_id}"

@celery_app.task
def check_budget_alerts(user_id: str):
    # Logic to check all budgets and send alert if crossed
    pass
