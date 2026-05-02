#!/bin/bash
# Simple Git sync script: pull, commit, push

# 1. Pull latest changes from remote
echo "🔄 Pulling latest changes..."
git pull origin main --rebase

# 2. Stage all changes
echo "📂 Adding all changes..."
git add .

# 3. Commit with timestamp
COMMIT_MSG="Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"
echo "📝 Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# 4. Push to remote
echo "🚀 Pushing to origin/main..."
git push origin main

echo "✅ Sync complete!"
