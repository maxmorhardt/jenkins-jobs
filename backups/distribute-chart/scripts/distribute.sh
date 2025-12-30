#!/bin/bash
set -e

SERVICE_NAME="$1"
BACKUP_FILE="$2"
RETENTION_DAYS="${3:-7}"

BACKUP_DIR="/node-backups/${SERVICE_NAME}"

echo "=== Backup Distribution for ${SERVICE_NAME} ==="
echo "Node: $(hostname)"
echo "File: ${BACKUP_FILE}"
echo "Retention: ${RETENTION_DAYS} days"

echo "Creating backup directory on node..."
mkdir -p "$BACKUP_DIR"

echo "Copying backup to node..."
if [ -f "/backup-source/${BACKUP_FILE}" ]; then
    cp "/backup-source/${BACKUP_FILE}" "$BACKUP_DIR/"
    echo "✓ Backup copied successfully"
else
    echo "✗ Backup file not found: /backup-source/${BACKUP_FILE}"
    exit 1
fi

echo "Cleaning up old backups (older than ${RETENTION_DAYS} days)..."
DELETED_COUNT=$(find "$BACKUP_DIR" -name "${SERVICE_NAME}-backup-*.sql" -o -name "${SERVICE_NAME}-backup-*.tar.gz" -type f -mtime +${RETENTION_DAYS} -delete -print | wc -l)
echo "✓ Deleted ${DELETED_COUNT} old backup(s)"

echo "Current backups on this node:"
ls -lh "$BACKUP_DIR" | tail -n +2

BACKUP_COUNT=$(ls -1 "$BACKUP_DIR" | wc -l)
DISK_USAGE=$(du -sh "$BACKUP_DIR" | cut -f1)

echo ""
echo "=== Summary ==="
echo "Total backups: ${BACKUP_COUNT}"
echo "Disk usage: ${DISK_USAGE}"
echo "✓ Distribution complete"
