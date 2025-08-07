 # 📌 Capstone Project 2025 – FastAPI Task Manager

A secure, containerized backend application for managing tasks using *FastAPI, **PostgreSQL, and **JWT authentication. Easily runnable with **Docker Compose*.

---

## 🚀 Getting Started

### 🔁 1. Clone & Checkout the Correct Branch

bash
git clone https://github.com/Muteeba4626/final-Capston-project2025.git
cd final-Capston-project2025
git checkout Backup


---

### 🛠️ 2. Create Environment Variables

Inside the fastapi/ folder, create a file named .env with the following structure:


JWT_SECRET=your_secret_key
JWT_EXPIRATION_SECONDS=86400

POSTGRES_USER=your_postgres_user
POSTGRES_PASSWORD=your_postgres_password
POSTGRES_DB=fastapi
POSTGRES_PORT=5432
POSTGRES_HOST=db

USERNAME_GITHUB=your_github_username
TOKEN_GITHUB=your_github_token
EMAIL_GIT=your_email@example.com


⚠️ *Important:* Never commit this file. It contains sensitive configuration.

---

### 🐳 3. Build and Run with Docker

Make sure you have Docker installed. Then run:

bash
docker-compose up --build


This will spin up the backend and database containers.

---

## 🌐 API Usage

### 📍 Base URL


http://localhost:8002


---

## 🔑 Authentication

### 👤 Signup – Create a User

http
POST /auth/signup


#### Request Body:

json
{
  "firstName": "sldnsln",
  "lastName": "nkshbd",
  "email": "adbdkhsbd@gmail.com",
  "password": "password123"
}


✅ You will receive a *JWT token*. Use this token in the Authorization header as:


Authorization: <your_token>


---

## 🧾 Task API (Protected Routes)

All task operations require JWT authentication.  
Use /task as the base path.

| Method | Endpoint                      | Description         |
|--------|-------------------------------|---------------------|
| POST   | /task/createTask            | Create a new task   |
| PUT    | /task/updateTask/{task_id}  | Update an existing task |
| DELETE | /task/deleteTask/{task_id}  | Delete a task       |
| GET    | /task/fetchTask/{task_id}   | Fetch a task by ID  |

---

### 📌 Create Task Example

http
POST /task/createTask


#### Request Body:

json
{
  "title": "Finish homework",
  "description": "Math and Science",
  "time": "18:00"
}


---

---

## ⚙️ CI/CD Pipeline (Test Only)

To test the CI pipeline:

1. Checkout the final branch:
bash
git checkout final


2. Push any commit to the final branch. This will automatically trigger *CI testing* via GitHub Actions using the deploy.yaml workflow.

✅ The pipeline will *run all backend tests on CI* before moving to any deployment steps.


> Made with 💡 using FastAPI, PostgreSQL, and Docker.
