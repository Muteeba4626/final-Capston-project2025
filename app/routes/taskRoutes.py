from fastapi import APIRouter
from app.controllers.taskControllers import createTask,updateTask,deleteTask,fetchTask

router = APIRouter()

router.post("/createTask")(createTask)
router.post("/updateTask")(updateTask)
router.post("/deleteTask")(deleteTask)
router.post("/fetchTask")(fetchTask)
