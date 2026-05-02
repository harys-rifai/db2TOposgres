#!/bin/bash
# Auto sync: pull remote changes, add local changes, commit, push

BRANCH=${1:-main}   # default branch = main, bisa diganti saat run

echo "🔄 Fetching latest changes from origin/$BRANCH..."
git fetch origin $BRANCH

echo "📥 Pulling remote changes..."
git pull origin $BRANCH --rebase

echo "📂 Adding all local changes..."
git add .

# Commit dengan pesan otomatis + timestamp
COMMIT_MSG="Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"
echo "📝 Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "🚀 Pushing to origin/$BRANCH..."
git push origin $BRANCH

echo "✅ Sync complete! Local and remote are up to date."
