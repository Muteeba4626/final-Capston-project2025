from pydantic import BaseModel, Field

class CreateTask(BaseModel):
    title: str = Field(..., example="Finish homework")
    description: str | None = Field(None, example="Math and Science")
    time: str = Field(..., example="18:00")
    user_id: int = Field(..., example=1)

class UpdateTask(BaseModel):
    title: str | None = None
    description: str | None = None
    time: str | None = None

class TaskOut(BaseModel):
    id: int
    title: str
    description: str | None
    time: str
    user_id: int

    class Config:
     from_attributes = True


class DeleteTask(BaseModel):
    id: int
