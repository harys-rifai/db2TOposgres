# 1. Initialize git if not already done
git init

# 2. Add your remote repository
git remote add origin https://github.com/harys-rifai/db2TOposgres.git

# 3. Rename your branch to main (if not already)
git branch -M main

# 4. Stage all files
git add .

# 5. Commit your changes
git commit -m "Initial commit"

# 6. Push to GitHub
git push -u origin main


rm -rf MigrationDB-DB2PG/.git
rm -rf dispatcher_pg/.git
rm -rf mig-db2topg/.git

git rm --cached MigrationDB-DB2PG
git rm --cached dispatcher_pg
git rm --cached mig-db2topg


git add MigrationDB-DB2PG/*
git add dispatcher_pg/*
git add mig-db2topg/*
git commit -m "Add actual contents instead of submodules"
git push
