from fastapi import APIRouter, Depends
from app.api import deps
from app.models.user import UserResponse
from app.services.forecasting_service import forecasting_service
from app.services.llm_service import llm_service
from pydantic import BaseModel

router = APIRouter()

class QuestionRequest(BaseModel):
    question: str

@router.get("/forecast")
def get_forecast(
    current_user: UserResponse = Depends(deps.get_current_user)
):
    # Mock current expense total for demo
    current = 15000.0 # Fetch real total from transaction service
    prediction = forecasting_service.predict_next_month(current_user.id, current)
    trends = forecasting_service.get_category_trends(current_user.id)
    return {
        "next_month_prediction": prediction,
        "trends": trends
    }

@router.post("/assistant")
def ask_assistant(
    req: QuestionRequest,
    current_user: UserResponse = Depends(deps.get_current_user)
):
    answer = llm_service.ask_question(current_user.id, req.question)
    return {"answer": answer}
