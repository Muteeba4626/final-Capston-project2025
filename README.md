# Phase 2: Automated Backups & Scheduling

Time to level up! Now we're adding smart backups that run automatically and keep track of everything using Git. Think of it as giving your database a safety net.

## What We're Adding

We're taking your backup script from earlier and making it work with your containerized app. Plus, we're scheduling it to run automatically and using Git to track all backup history like a pro.

## Getting Started

### 1. Build on Phase 1

Make sure Phase 1 is working first:
```bash
docker-compose up --build
# Test your /tasks endpoint
curl http://localhost:8000/tasks
```

### 2. New Project Structure

Your folder now looks like:
```
team-capstone/
├── app/
│   └── main.py
├── database/
│   ├── schema.sql
│   └── migrate.sql
├── backup/
│   ├── Dockerfile           # Makes your backup script into a container
│   └── search_backup.sh     # Your enhanced backup script
├── backups/                 # Where backups will live
├── docker-compose.yml       # Updated with backup service
├── cronjob.txt             # Cron schedule for automation
└── README.md
```

### 3. Quick Start

```bash
# Build everything (including the new backup service)
docker-compose up --build

# Test a manual backup
docker exec team-capstone-backup-1 /scripts/search_backup.sh -d /data -i -r
```

## What's New

### Backup Service
Your backup script is now a Docker container that can access your database files. It's like having a dedicated backup robot.

### Smart Flags
- `-d /data`: Points to your database files
- `-i`: Creates incremental backups (saves space!)
- `-r`: Generates reports on what was backed up

### Auto-Scheduling
Set up a cron job that runs your backup every night at 1 AM:
```bash
# Install the cron job
crontab cronjob.txt

# Check it's there
crontab -l
```

### Git Magic
After each backup, the system automatically:
1. Creates a new Git branch called `enhanced-backup`
2. Commits all the backup files
3. Tags it with today's date
4. Pushes everything to GitHub

So you get a complete history of all your backups!

## Testing Your Setup

### 1. Manual Backup Test
```bash
# Run a backup manually
docker exec team-capstone-backup-1 /scripts/search_backup.sh -d /data -i -r

# Check if files were created
ls -la backups/
```

### 2. Check Git Integration
```bash
# See if Git tracking worked
git log --oneline
git tag
```

### 3. Cron Test (Optional)
```bash
# Test that your cron syntax is valid
crontab -l
```

## How the Backup Works

1. **Container Access**: The backup container can see your database files
2. **Incremental Backups**: Only backs up what changed (smart!)
3. **Reports**: Creates `report.txt` with backup details
4. **Git Versioning**: Every backup becomes a Git commit with a timestamp
5. **Tagging**: Easy to find backups by date

## Files You Need to Create

1. **`backup/Dockerfile`** - Containerizes your backup script
2. **`backup/search_backup.sh`** - Your enhanced backup script
3. **`cronjob.txt`** - Cron schedule (daily at 1 AM)
4. Update **`docker-compose.yml`** - Add the backup service

## Troubleshooting

**Backup not running?** Check container logs:
```bash
docker logs team-capstone-backup-1
```

**Cron not working?** Make sure the container names match:
```bash
docker ps  # Check actual container names
```

**Git issues?** Ensure you have Git configured in the backup script.

