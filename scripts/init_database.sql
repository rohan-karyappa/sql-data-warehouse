/*
=============================================================
Create Database and Schemas (PostgreSQL)
=============================================================
Script Purpose:
    This script creates a new database named 'DataWarehouse' after checking if it already exists.
    If the database exists, it is dropped and recreated. Additionally, the script sets up three schemas
    within the database: 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'DataWarehouse' database if it exists.
    All data in the database will be permanently deleted. Proceed with caution
    and ensure you have proper backups before running this script.

Execution Note:
    In PostgreSQL, databases cannot be dropped/created and switched inside a single standard 
    SQL query window without client-side meta-commands (\c). 
    - Run this entire file directly via psql (`psql -U postgres -f init_database.sql`), OR
    - Run Step 1 connected to the 'postgres' database, then switch connection to 'DataWarehouse' 
      and run Step 2 in pgAdmin / DBeaver / VS Code.
*/

-- ==========================================================
-- STEP 1: Drop and Recreate Database (Run on 'postgres' DB)
-- ==========================================================

-- Terminate active connections and drop the database if it exists (PostgreSQL 13+)
DROP DATABASE IF EXISTS "DataWarehouse" WITH (FORCE);

-- Create the 'DataWarehouse' database
CREATE DATABASE "DataWarehouse";

-- Connect to the newly created database (psql CLI meta-command)
\c "DataWarehouse"

-- ==========================================================
-- STEP 2: Create Medallion Schemas (Run on 'DataWarehouse' DB)
-- ==========================================================

CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
