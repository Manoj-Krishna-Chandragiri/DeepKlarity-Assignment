from sqlalchemy import Column, Integer, String, Text, DateTime
from sqlalchemy.sql import func
from .db import Base

class Quiz(Base):
    __tablename__ = "quizzes"

    id = Column(Integer, primary_key=True, index=True)
    url = Column(String, unique=True, index=True)
    title = Column(String)
    summary = Column(Text)
    scraped_content = Column(Text)
    full_quiz_data = Column(Text)
    created_at = Column(DateTime(timezone=True), server_default=func.now())