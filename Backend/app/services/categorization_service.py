class CategorizationService:
    """
    Simple rule-based categorization.
    Can be replaced with ML model (BERT/XGBoost) later.
    """
    CATEGORIES = {
        "Food": ["swiggy", "zomato", "restaurant", "cafe", "pizza", "burger", "coffee"],
        "Travel": ["uber", "ola", "metro", "fuel", "petrol", "irctc", "flight"],
        "Shopping": ["amazon", "flipkart", "myntra", "mall", "clothing"],
        "Bills": ["electricity", "water", "broadband", "mobile", "recharge", "bescom"],
        "Entertainment": ["bookmyshow", "netflix", "prime", "cinema", "movie"],
    }

    @staticmethod
    def predict_category(merchant: str, description: str = "") -> str:
        text = (merchant + " " + description).lower()
        for category, keywords in CategorizationService.CATEGORIES.items():
            for keyword in keywords:
                if keyword in text:
                    return category
        return "Others"

categorization_service = CategorizationService()
