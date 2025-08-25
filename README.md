# 🚀 Capston Project

A **backend service** built with **FastAPI**, **PostgreSQL**, and an integrated **Backup Service**, orchestrated using **Docker Compose**.

---

## 🛠 Containers

Running this project with Docker Compose will start:

* **Backend** – FastAPI service
* **Database** – PostgreSQL
* **Backup Service**

---

## 📥 1. Clone the Repository

```bash
git clone https://github.com/Muteeba4626/final-Capston-project2025.git
```

---

## 📂 2. Navigate to the Project Folder

```bash
cd final-Capston-project2025
```

---

## 🔑 3. Configure Environment Variables

Create a `.env` file in the project root and add the following values:

```env
# 🔐 JWT Config
JWT_SECRET=my_strong_secret_key
JWT_EXPIRATION_SECONDS=<your_value_here>

# 🗄 Database Config
POSTGRES_USER=<your_value_here>
POSTGRES_PASSWORD=<your_value_here>
POSTGRES_DB=<your_value_here>
POSTGRES_PORT=<your_value_here>
POSTGRES_HOST=<your_value_here>

# 🔗 GitHub Config
USERNAME_GITHUB=<your_value_here>
TOKEN_GITHUB=<your_value_here>
EMAIL_GIT=<your_value_here>
```

💡 **Tip:** Keep `.env` private — never commit it to GitHub.

---

## ▶️ 4. Run the Application

To build and start all services, run:

```bash
docker compose up --build
```

This will start:

* **FastAPI backend** → available at port `8003`
* **PostgreSQL database**
* **Backup service**

---

## 🔐 GitHub Actions Secrets

In your repository, go to:
**GitHub → Settings → Secrets and variables → Actions**
and add the following secrets (with exact names):

* `EC2_HOST`
* `EC2_SSH_KEY`
* `EC2_USER`
* `EMAIL_GIT`
* `JWT_EXPIRATION_SECONDS`
* `JWT_SECRET`
* `POSTGRES_DB`
* `POSTGRES_HOST`
* `POSTGRES_PASSWORD`
* `POSTGRES_PORT`
* `POSTGRES_USER`
* `TOKEN_GITHUB`
* `USERNAME_GITHUB`

---

## 📜 Access API Docs

Once containers are running, open:

👉 [http://localhost:8003/docs](http://localhost:8003/docs)

to explore the **Swagger UI** and test all available API endpoints.
