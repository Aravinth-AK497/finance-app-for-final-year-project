from app.services.transaction_service import transaction_service

class LLMService:
    def ask_question(self, user_id: str, question: str):
        # 1. Retrieve Context (Recent transactions)
        txns = transaction_service.get_user_transactions(user_id, limit=10)
        
        # 2. Construct Prompt (Mock)
        context_str = "\n".join([f"{t['date'].date()}: {t['merchant']} - {t['amount']} ({t['category']})" for t in txns])
        
        # 3. Call LLM (Mocking here as I don't have an API key for OpenAI/Gemini in this env)
        # response = openai.ChatCompletion.create(...)
        
        # Mock Response Logic based on keywords
        if "spend" in question.lower() and "week" in question.lower():
            total = sum([t['amount'] for t in txns])
            return f"Based on your last few transactions, you have spent approx Rs. {total}. Major expenses were on Food and Travel."
        
        if "food" in question.lower():
            return "Your food expenses are higher than usual this week due to multiple swiggy orders."
            
        return f"I analyzed your recent data. You have {len(txns)} recent transactions. " \
               "I can help you budget better if you reduce eating out."

llm_service = LLMService()
