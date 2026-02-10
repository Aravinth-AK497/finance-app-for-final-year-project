from app.core.database import db
from app.models.user import UserCreate, UserInDB
from app.core.security import get_password_hash
from bson import ObjectId

class UserService:
    collection_name = "users"

    def __init__(self):
        self.collection = db.get_db()[self.collection_name]

    def get_by_email(self, email: str):
        return self.collection.find_one({"email": email})

    def create(self, user: UserCreate):
        user_in_db = UserInDB(
            email=user.email,
            full_name=user.full_name,
            hashed_password=get_password_hash(user.password)
        )
        result = self.collection.insert_one(user_in_db.model_dump())
        return self.get_by_id(result.inserted_id)

    def get_by_id(self, user_id: ObjectId):
        return self.collection.find_one({"_id": user_id})

user_service = UserService()
