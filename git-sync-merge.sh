#!/bin/bash
# Auto sync script: pull remote changes, merge with local, commit, push

BRANCH=${1:-main}   # default branch = main, bisa diganti saat run

echo "🔄 Fetching latest changes from origin/$BRANCH..."
git fetch origin $BRANCH

echo "📥 Pulling remote changes..."
git pull origin $BRANCH --rebase

# Jika ada konflik, Git akan berhenti di sini.
# Kamu harus resolve manual, lalu lanjutkan dengan:
#   git add .
#   git rebase --continue

echo "📂 Adding all local changes..."
git add .

# Commit otomatis dengan timestamp
COMMIT_MSG="Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"
echo "📝 Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "🚀 Pushing to origin/$BRANCH..."
git push origin $BRANCH

echo "✅ Sync complete! Local and remote are merged."
