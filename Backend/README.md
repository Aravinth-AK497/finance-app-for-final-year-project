# AI Finance Manager Backend

Backend for an AI-Powered Personal Finance Management System.

## Stack
- **Framework**: FastAPI
- **Database**: MongoDB
- **Task Queue**: Celery + Redis
- **ML/OCR**: Scikit-Learn, Tesseract

## Installation

1.  Create Virtual Env: `python -m venv venv`
2.  Activate: `.\venv\Scripts\Activate` (Windows)
3.  Install: `pip install -r requirements.txt`

## Configuration
Update `app/core/config.py` or use `.env` file for:
- `MONGODB_URL`
- `SECRET_KEY`
- `TESSERACT_CMD` (Path to tesseract.exe)

## Running

```bash
uvicorn app.main:app --reload
```

## Background Workers

```bash
celery -A app.workers.celery_app worker --loglevel=info
```
