# Phase 1: Multi-Container App & Database Migration

Welcome to Phase 1! We're going to build a simple task management API with a database that we can actually change and update over time.

## What We're Building

A FastAPI app that lets you manage tasks, backed by a PostgreSQL database. Think of it like a super simple to-do list API.

## Getting Started

### 1. Set Up Your Project

```bash
# Create your repo and clone it
git clone <your-team-capstone-repo-url>
cd team-capstone
```

### 2. Project Structure

Your folder should look like this:
```
team-capstone/
├── app/
│   └── main.py          # Your FastAPI app
├── database/
│   ├── schema.sql       # Initial database setup
│   └── migrate.sql      # Database changes
├── docker-compose.yml   # All services together
└── README.md           # This file!
```

### 3. Quick Start

Fire up everything with:
```bash
docker-compose up --build
```

### 4. Test It Out

Once everything is running:

```bash
# Check if your API is alive
curl http://localhost:8000/tasks

# Add a task (optional - if you implemented POST)
curl -X POST http://localhost:8000/tasks \
  -H "Content-Type: application/json" \
  -d '{"title": "Learn Docker", "completed": false}'
```

## What's Happening Under the Hood

- **FastAPI App**: Serves your API on port 8000
- **PostgreSQL Database**: Stores your tasks
- **Backup Service**: Ready for Phase 2 (just sits there for now)

The cool part? When the database starts up, it automatically runs your SQL scripts to create tables and apply any changes.

## Files You Need to Create

1. **`app/main.py`** - Your FastAPI application
2. **`database/schema.sql`** - Creates the tasks table
3. **`database/migrate.sql`** - Adds/modifies the table structure
4. **`docker-compose.yml`** - Ties everything together

## Checking Your Migration Works

1. Start with `docker-compose up --build`
2. Hit `/tasks` endpoint - see the original structure
3. The migration should run automatically
4. Hit `/tasks` again - you should see any new fields or changes

That's it for Phase 1! You've got a working API with database migrations. Pretty neat, right?

## Next Steps

Phase 2 will add automated backups and scheduling. But first, make sure this works smoothly!
