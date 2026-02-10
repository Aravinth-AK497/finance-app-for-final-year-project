from datetime import datetime, timedelta
import pandas as pd
import numpy as np
# from statsmodels.tsa.arima.model import ARIMA 
# Statsmodels is heavy, using a simple heuristic for demo unless requested specific implementation.
# Mocking ARIMA for now to ensure stability without checking user's C compiler deps for complex stats libs, 
# but showing where it goes.

class ForecastingService:
    def predict_next_month(self, user_id: str, current_month_expenses: float):
        # Simple moving average or linear projection if no historical data
        # For a real implementation, we would fetch last 6 months data.
        
        # Placeholder logic:
        # projected = current * 1.05 (Assuming 5% inflation/increase)
        projected = current_month_expenses * 1.05
        return projected

    def get_category_trends(self, user_id: str):
        # Mock trend data
        return {
            "Food": "Increasing",
            "Travel": "Stable",
            "Shopping": "Decreasing"
        }

forecasting_service = ForecastingService()
