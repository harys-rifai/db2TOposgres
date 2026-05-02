#!/bin/bash
# Script to merge or rebase a feature branch into main

# Usage:
#   ./git-merge-rebase.sh <branch-name> <mode>
# Example:
#   ./git-merge-rebase.sh cleanup merge
#   ./git-merge-rebase.sh cleanup rebase

BRANCH=$1
MODE=$2

if [ -z "$BRANCH" ] || [ -z "$MODE" ]; then
  echo "Usage: $0 <branch-name> <merge|rebase>"
  exit 1
fi

# Step 1: Ensure we’re in the repo
cd ~/Documents/db2_PG || exit

# Step 2: Fetch latest remote changes
echo "Fetching latest changes from origin..."
git fetch origin

# Step 3: Checkout main
echo "Switching to main branch..."
git checkout main

# Step 4: Pull latest main
echo "Updating local main..."
git pull origin main

# Step 5: Merge or rebase
if [ "$MODE" = "merge" ]; then
  echo "Merging branch $BRANCH into main..."
  git merge "$BRANCH"
elif [ "$MODE" = "rebase" ]; then
  echo "Rebasing branch $BRANCH onto main..."
  git rebase "$BRANCH"
else
  echo "Invalid mode: $MODE. Use merge or rebase."
  exit 1
fi

# Step 6: Push updated main
echo "Pushing changes to origin/main..."
git push origin main

echo "✅ Done! Branch $BRANCH has been integrated into main using $MODE."
