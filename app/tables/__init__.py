from sqlalchemy.orm import DeclarativeBase
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from app.config.settings import settings
class Base(DeclarativeBase):
    pass

<<<<<<< HEAD
from .user import User
from .task import Task

=======

from .user import User
from .task import Task


>>>>>>> main
DATABASE_URL = settings.DATABASE_URL

engine = create_engine(DATABASE_URL)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
