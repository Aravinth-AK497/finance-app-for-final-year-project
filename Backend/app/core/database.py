from pymongo import MongoClient
from app.core.config import settings

class Database:
    client: MongoClient = None
    db = None

    def connect(self):
        self.client = MongoClient(settings.MONGODB_URL)
        self.db = self.client[settings.DATABASE_NAME]
        print("Connected to MongoDB")

    def disconnect(self):
        if self.client:
            self.client.close()

    def get_db(self):
        return self.db

db = Database()
db.connect()  # Connect immediately for simplicity, usually done in startup event
