import pytesseract
from PIL import Image
import io
import re
from app.core.config import settings

# Set tesseract cmd if needed, though usually valid in PATH or config
if settings.TESSERACT_CMD:
    pytesseract.pytesseract.tesseract_cmd = settings.TESSERACT_CMD

class OCRService:
    @staticmethod
    def extract_text(image_bytes: bytes) -> str:
        try:
            image = Image.open(io.BytesIO(image_bytes))
            text = pytesseract.image_to_string(image)
            return text
        except Exception as e:
            print(f"OCR Error: {e}")
            return ""

    @staticmethod
    def parse_receipt(text: str) -> dict:
        """
        Heuristic parsing for Total/Date/Merchant
        """
        lines = text.split('\n')
        merchant = lines[0].strip() if lines else "Unknown Merchant"
        
        # Try to find Total Amount
        amount_pattern = r"(?:Total|Amount|NET).{0,10}?(?P<amount>[\d,]+\.\d{2})"
        amount_match = re.search(amount_pattern, text, re.IGNORECASE)
        amount = 0.0
        if amount_match:
            try:
                amount = float(amount_match.group("amount").replace(",", ""))
            except:
                pass
        
        return {
            "merchant": merchant,
            "amount": amount,
            "raw_text": text
        }

ocr_service = OCRService()
