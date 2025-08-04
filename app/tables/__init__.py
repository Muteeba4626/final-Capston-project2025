from sqlalchemy.orm import DeclarativeBase
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

class Base(DeclarativeBase):
    pass

# Make sure to import all models here
from .user import User
from .task import Task

# Add these lines ↓↓↓
DATABASE_URL = "postgresql://postgres:1436577@localhost/postgres"

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)