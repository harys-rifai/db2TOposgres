<<<<<<< Updated upstream
#!/bin/bash
# Git safe sync script: handle local changes, remote updates, conflicts
BRANCH=${1:-main}   # default branch = main, bisa diganti saat run
echo "🔄 Checking repo status..."
git status
# 1. Stash jika ada perubahan belum di-commit
if ! git diff --quiet || ! git diff --cached --quiet; then
  echo "📦 Stashing local changes..."
  git stash save "Auto stash on $(date '+%Y-%m-%d %H:%M:%S')"
fi
# 2. Fetch & pull remote
echo "📥 Fetching and pulling origin/$BRANCH..."
git fetch origin $BRANCH
git pull origin $BRANCH --rebase
if [ $? -ne 0 ]; then
  echo "⚠️ Rebase conflict detected. Resolve manually:"
  echo "   git status"
  echo "   git add <fixed-files>"
  echo "   git rebase --continue"
  exit 1
fi
# 3. Apply stash kembali jika ada
if git stash list | grep -q "Auto stash"; then
  echo "📦 Applying stashed changes..."
  git stash pop
fi
# 4. Stage semua perubahan
echo "📂 Adding all changes..."
git add .
# 5. Commit dengan timestamp
COMMIT_MSG="Auto commit on $(date '+%Y-%m-%d %H:%M:%S')"
echo "📝 Committing with message: $COMMIT_MSG"
git commit -m "$COMMIT_MSG" || echo "ℹ️ No local changes to commit."
# 6. Push ke remote
echo "🚀 Pushing to origin/$BRANCH..."
git push origin $BRANCH
echo "✅ Sync complete! Local and remote are up to date."
<<<<<<< Updated upstream
=======
   
>>>>>>> Stashed changes
=======
 #ssss
>>>>>>> Stashed changes
