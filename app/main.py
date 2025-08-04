from fastapi import FastAPI
from app.routes.authRoutes import router as auth_router
from app.routes.taskRoutes import router as task_router

app = FastAPI()

app.include_router(auth_router, prefix="/auth")
app.include_router(task_router, prefix="/task")