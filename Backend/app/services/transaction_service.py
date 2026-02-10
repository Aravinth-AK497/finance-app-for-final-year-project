from app.core.database import db
from app.models.transaction import TransactionCreate, TransactionInDB, SMSLog
from app.services.sms_parser import sms_parser
from app.services.categorization_service import categorization_service
from typing import List, Optional
from bson import ObjectId

class TransactionService:
    collection_name = "transactions"
    sms_collection_name = "sms_logs"

    def __init__(self):
        self.collection = db.get_db()[self.collection_name]
        self.sms_collection = db.get_db()[self.sms_collection_name]

    def create(self, txn: TransactionCreate, user_id: str):
        # Auto-categorize if not provided or unknown
        if txn.category == "Uncategorized" or not txn.category:
            txn.category = categorization_service.predict_category(txn.merchant, txn.description or "")

        txn_in_db = TransactionInDB(**txn.model_dump(), user_id=user_id)
        result = self.collection.insert_one(txn_in_db.model_dump(by_alias=True))
        return self.get_by_id(result.inserted_id)

    def get_by_id(self, txn_id: ObjectId):
        return self.collection.find_one({"_id": txn_id})

    def get_user_transactions(self, user_id: str, skip: int = 0, limit: int = 100):
        cursor = self.collection.find({"user_id": user_id}).skip(skip).limit(limit).sort("date", -1)
        return list(cursor)

    def process_sms(self, raw_sms: str, sender: str, user_id: str):
        # Log SMS
        sms_log = SMSLog(user_id=user_id, raw_text=raw_sms, sender=sender)
        self.sms_collection.insert_one(sms_log.model_dump())

        # Parse
        parsed_data = sms_parser.parse(raw_sms)
        if parsed_data:
            # Create Transaction
            txn_create = TransactionCreate(
                **parsed_data,
                description=f"Parsed from SMS: {sender}"
            )
            return self.create(txn_create, user_id)
        return None

transaction_service = TransactionService()
