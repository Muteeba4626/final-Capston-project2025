#!/bin/sh
echo "Backup ran at $(date)"

set -e  
set -u  


TARGET_DIR=""
DO_INCREMENTAL=false
DO_REPORT=false


while getopts ":d:ir" opt; do
  case $opt in
    d) TARGET_DIR="$OPTARG" ;;
    i) DO_INCREMENTAL=true ;;  
    r) DO_REPORT=true ;;
    \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
    :) echo "Option -$OPTARG requires an argument." >&2; exit 1 ;;
  esac
done


if [ -z "$TARGET_DIR" ]; then
  echo "❌ ERROR: Target directory (-d) is required."
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "❌ ERROR: Target directory '$TARGET_DIR' does not exist."
  exit 2
fi


DATE=$(date +"%Y%m%d")
TIME=$(date +"%H:%M:%S")
BASE_DIR=/app
BACKUP_DIR="$BASE_DIR/backups/incremental-$DATE"
LOG_FILE="$BASE_DIR/logs/backup-$DATE.log"
REPORT_FILE="$BASE_DIR/reports/report-$DATE.txt"
ARCHIVE_FILE="$BACKUP_DIR/backup_$(basename "$TARGET_DIR")_$DATE.tar.gz"


mkdir -p "$BACKUP_DIR" "$BASE_DIR/logs" "$BASE_DIR/reports"


{
  echo "--------------------------------------------------"
  echo "[${DATE} ${TIME}] Starting Backup"
  echo "--------------------------------------------------"
  echo "📂 Target Directory : $TARGET_DIR"
  echo "📦 Backup Destination: $ARCHIVE_FILE"
  echo ""
} >> "$LOG_FILE"


echo "[${DATE} ${TIME}]  Archiving $TARGET_DIR..." >> "$LOG_FILE"
tar -czf "$ARCHIVE_FILE" -C "$(dirname "$TARGET_DIR")" "$(basename "$TARGET_DIR")" >> "$LOG_FILE" 2>&1
echo "[${DATE} ${TIME}] Backup completed." >> "$LOG_FILE"


if $DO_REPORT; then
  {
    echo "--------------------------------------------------"
    echo "[${DATE} ${TIME}]  Backup Report"
    echo "--------------------------------------------------"
    echo " Timestamp        : $DATE $TIME"
    echo " Backed Up Dir    : $TARGET_DIR"
    echo " Archive File     : $ARCHIVE_FILE"
    echo "Archive Size     : $(du -sh "$ARCHIVE_FILE" | cut -f1)"
    echo ""
  } >> "$REPORT_FILE"
fi


echo "[${DATE} ${TIME}]  Backup script completed successfully." >> "$LOG_FILE"

## === GIT BACKUP PUSH ===


eval "$(ssh-agent -s)"
ssh-add /root/.ssh/id_backup_ed25519


mkdir -p ~/.ssh
ssh-keyscan github.com >> ~/.ssh/known_hosts

git config --global user.name "BackupBot"
git config --global user.email "muteeba.shahzad26@gmail.com"


rm -rf /tmp/repo
git clone --depth=1 git@github.com:Muteeba4626/final-Capston-project2025.git /tmp/repo
cd /tmp/repo


TAG_NAME="backup-$DATE-$(echo $TIME | tr ':' '-')"
git tag -a "$TAG_NAME" -m "Backup taken on $DATE at $TIME"
git push origin "$TAG_NAME"
