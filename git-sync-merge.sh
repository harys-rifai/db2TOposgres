#!/bin/bash
# Sync local changes with remote (handles new files on remote)

BRANCH=${1:-main}

echo "🔄 Staging local changes..."
git add .

COMMIT_MSG="Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"
git commit -m "$COMMIT_MSG" || echo "ℹ️ No local changes to commit."

echo "📥 Rebasing onto origin/$BRANCH..."
git pull origin $BRANCH --rebase

if [ $? -ne 0 ]; then
  echo "⚠️ Rebase conflict detected. Resolve manually:"
  echo "   git status"
  echo "   git add <fixed-files>"
  echo "   git rebase --continue"
  exit 1
fi

echo "🚀 Pushing to origin/$BRANCH..."
git push origin $BRANCH

echo "✅ Sync complete!"
