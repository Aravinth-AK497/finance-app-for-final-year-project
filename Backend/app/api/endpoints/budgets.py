from fastapi import APIRouter, Depends, Query
from typing import List
from app.models.budget import BudgetCreate
from app.api import deps
from app.models.user import UserResponse
from app.services.budget_service import budget_service
from datetime import datetime

router = APIRouter()

@router.post("/", response_model=dict)
def set_budget(
    budget: BudgetCreate,
    current_user: UserResponse = Depends(deps.get_current_user)
):
    res = budget_service.create_or_update(budget, current_user.id)
    return {"status": "success", "id": str(res["_id"])}

@router.get("/status")
def get_budget_status(
    month: int = Query(default=datetime.utcnow().month),
    year: int = Query(default=datetime.utcnow().year),
    current_user: UserResponse = Depends(deps.get_current_user)
):
    return budget_service.check_status(current_user.id, month, year)
