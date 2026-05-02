#!/bin/bash
# migrate_db2_to_postgres.sh
# Script to migrate DB2 database to PostgreSQL 17 using db2topg

set -e

# === CONFIGURATION ===
DB2_HOST="127.0.0.1"
DB2_PORT="50000"
DB2_USER="db2user"
DB2_PASS="db2password"
DB2_DB="sampledb"

PG_HOST="127.0.0.1"
PG_PORT="5432"
PG_USER="postgres"
PG_PASS="postgrespassword"
PG_DB="sampledb_pg"

# === ENVIRONMENT ===
export PGPASSWORD="$PG_PASS"

# === STEP 1: Clone db2topg ===
if [ ! -d "db2topg" ]; then
  git clone https://github.com/dalibo/db2topg.git
fi

cd db2topg

# === STEP 2: Install dependencies ===
# Requires Python 3.9+, psycopg2, ibm_db
pip install -r requirements.txt

# === STEP 3: Run db2topg migration ===
python3 -m db2topg \
  --db2-dsn "DATABASE=$DB2_DB;HOSTNAME=$DB2_HOST;PORT=$DB2_PORT;UID=$DB2_USER;PWD=$DB2_PASS;" \
  --pg-dsn "host=$PG_HOST port=$PG_PORT dbname=$PG_DB user=$PG_USER password=$PG_PASS" \
  --schema-only \
  --data

# === STEP 4: Vacuum & Analyze Postgres ===
psql -h $PG_HOST -U $PG_USER -d $PG_DB -c "VACUUM ANALYZE;"

echo "✅ Migration from DB2 ($DB2_DB) to PostgreSQL 17 ($PG_DB) completed."
