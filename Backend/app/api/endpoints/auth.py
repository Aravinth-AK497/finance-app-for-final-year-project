from datetime import timedelta
from fastapi import APIRouter, Depends, HTTPException, status
from fastapi.security import OAuth2PasswordRequestForm
from app.core.security import create_access_token, verify_password
from app.services.user_service import user_service
from app.models.user import UserCreate, UserResponse, UserInDB
from app.core.config import settings
from app.api import deps

router = APIRouter()

@router.post("/register", response_model=UserResponse)
def register_user(user_in: UserCreate):
    user = user_service.get_by_email(user_in.email)
    if user:
        raise HTTPException(
            status_code=400,
            detail="The user with this username already exists in the system.",
        )
    created_user = user_service.create(user_in)
    created_user["id"] = str(created_user["_id"])
    return created_user

@router.post("/login", response_model=dict)
def login_access_token(form_data: OAuth2PasswordRequestForm = Depends()):
    user = user_service.get_by_email(form_data.username)
    if not user or not verify_password(form_data.password, user["hashed_password"]):
        raise HTTPException(status_code=400, detail="Incorrect email or password")
    
    access_token_expires = timedelta(minutes=settings.ACCESS_TOKEN_EXPIRE_MINUTES)
    access_token = create_access_token(
        subject=user["email"], expires_delta=access_token_expires
    )
    return {"access_token": access_token, "token_type": "bearer"}

@router.get("/me", response_model=UserResponse)
def read_users_me(current_user: UserResponse = Depends(deps.get_current_user)):
    return current_user
