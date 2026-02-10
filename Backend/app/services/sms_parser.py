import re
from datetime import datetime
from typing import Optional, Dict, Any
import dateutil.parser

class SMSParser:
    """
    Parses SMS text to extract transaction details.
    Supports UPI, Debit Card, Credit Card for major Indian banks.
    """
    
    PATTERNS = [
        # UPI Debited
        {
            "type": "UPI",
            "regex": r"Rs\.?\s?(?P<amount>[\d,.]+)\s?debited\s?from\s?.*?\s?to\s?(?P<merchant>.*?)\s?on\s?(?P<date>.*?)\..*?Ref",
            "txn_type": "DEBIT"
        },
        # HDFC Spent
        {
            "type": "HDFC_CARD",
            "regex": r"Rs\.?\s?(?P<amount>[\d,.]+)\s?was\s?spent\s?on\s?.*?\s?at\s?(?P<merchant>.*?)\s?on\s?(?P<date>.*?)\.",
            "txn_type": "DEBIT"
        },
        # SBI Credited
        {
            "type": "SBI_CREDIT",
            "regex": r"Rs\.?\s?(?P<amount>[\d,.]+)\s?credited\s?to\s?.*?\s?on\s?(?P<date>.*?)\s?by\s?(?P<merchant>.*?)",
            "txn_type": "CREDIT"
        },
        # Generic Sent
        {
            "type": "GENERIC_SENT",
            "regex": r"Sent\s?Rs\.?\s?(?P<amount>[\d,.]+)\s?to\s?(?P<merchant>.*?)\s?on\s?(?P<date>.*?)",
            "txn_type": "DEBIT"
        }
    ]

    @staticmethod
    def parse(sms_text: str) -> Optional[Dict[str, Any]]:
        for pattern in SMSParser.PATTERNS:
            match = re.search(pattern["regex"], sms_text, re.IGNORECASE)
            if match:
                data = match.groupdict()
                amount = float(data.get("amount", "0").replace(",", ""))
                merchant = data.get("merchant", "Unknown").strip()
                date_str = data.get("date", "").strip()
                
                # Basic date parsing
                try:
                    date = dateutil.parser.parse(date_str, fuzzy=True)
                except:
                    date = datetime.utcnow()

                return {
                    "amount": amount,
                    "merchant": merchant,
                    "transaction_type": pattern["txn_type"],
                    "date": date,
                    "payment_method": pattern["type"],
                    "source": "SMS"
                }
        return None

sms_parser = SMSParser()
