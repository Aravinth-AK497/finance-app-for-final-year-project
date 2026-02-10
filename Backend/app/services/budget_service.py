from app.core.database import db
from app.models.budget import BudgetCreate, BudgetInDB
from app.services.transaction_service import transaction_service
from datetime import datetime
from bson import ObjectId

class BudgetService:
    collection_name = "budgets"

    def __init__(self):
        self.collection = db.get_db()[self.collection_name]

    def create_or_update(self, budget_in: BudgetCreate, user_id: str):
        # Check if budget exists for category in current month/year
        existing = self.collection.find_one({
            "user_id": user_id,
            "category": budget_in.category,
            "month": budget_in.month,
            "year": budget_in.year
        })

        if existing:
            self.collection.update_one(
                {"_id": existing["_id"]},
                {"$set": {"amount_limit": budget_in.amount_limit}}
            )
            return self.get_by_id(existing["_id"])
        else:
            budget_db = BudgetInDB(**budget_in.model_dump(), user_id=user_id)
            res = self.collection.insert_one(budget_db.model_dump(by_alias=True))
            return self.get_by_id(res.inserted_id)

    def get_by_id(self, budget_id: ObjectId):
        return self.collection.find_one({"_id": budget_id})

    def check_status(self, user_id: str, month: int, year: int):
        # 1. Get all budgets for the month
        budgets = list(self.collection.find({"user_id": user_id, "month": month, "year": year}))
        
        results = []
        for b in budgets:
            # 2. Calculate spent amount for category
            # Pipeline to aggregate expenses for this category
            pipeline = [
                {
                    "$match": {
                        "user_id": user_id,
                        "category": b["category"],
                        "date": {
                            "$gte": datetime(year, month, 1),
                            "$lt": datetime(year, month + 1, 1) if month < 12 else datetime(year + 1, 1, 1)
                        }
                    }
                },
                {
                    "$group": {"_id": None, "total": {"$sum": "$amount"}}
                }
            ]
            
            # Using transaction service collection (direct access or via method)
            # Accessing db directly here for aggregation
            tx_coll = db.get_db()["transactions"]
            agg = list(tx_coll.aggregate(pipeline))
            spent = agg[0]["total"] if agg else 0.0
            
            remaining = b["amount_limit"] - spent
            results.append({
                "category": b["category"],
                "limit": b["amount_limit"],
                "spent": spent,
                "remaining": remaining,
                "over_budget": spent > b["amount_limit"]
            })
            
        return results

budget_service = BudgetService()
