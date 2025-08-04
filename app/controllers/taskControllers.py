from fastapi import Depends, HTTPException
from sqlalchemy.orm import Session
from app.schemas.tasks import CreateTask, UpdateTask, DeleteTask, TaskOut
from app.tables import Task, SessionLocal
from app.middleware.auth import get_db


# ✅ Create Task
def createTask(task_data: CreateTask, db: Session = Depends(get_db)):
    task = Task(
        title=task_data.title,
        description=task_data.description,
        time=task_data.time,
        user_id=task_data.user_id
    )
    db.add(task)
    db.commit()
    db.refresh(task)
    return {"message": "Task created", "task": TaskOut.from_orm(task)}


# 🔄 Update Task
def updateTask(task_data: UpdateTask, task_id: int, db: Session = Depends(get_db)):
    task = db.query(Task).filter(Task.id == task_id).first()
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")

    for attr, value in task_data.dict(exclude_unset=True).items():
        setattr(task, attr, value)

    db.commit()
    db.refresh(task)
    return {"message": "Task updated", "task": TaskOut.from_orm(task)}


# ❌ Delete Task
def deleteTask(task_data: DeleteTask, db: Session = Depends(get_db)):
    task = db.query(Task).filter(Task.id == task_data.id).first()
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")

    db.delete(task)
    db.commit()
    return {"message": "Task deleted"}


# 🔍 Fetch Task by ID
def fetchTask(task_id: int, db: Session = Depends(get_db)):
    task = db.query(Task).filter(Task.id == task_id).first()
    if not task:
        raise HTTPException(status_code=404, detail="Task not found")

    return TaskOut.from_orm(task)
