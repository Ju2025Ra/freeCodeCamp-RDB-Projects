# Periodic Table Database Project

This project is part of the **freeCodeCamp Relational Database Certification**. It involves fixing an existing PostgreSQL database, normalizing its structure, and creating a Bash script that retrieves information about chemical elements from the database.

---

## 📌 Project Overview

The project is divided into three main parts:

- Fixing and normalizing the database

- Creating a Git-controlled project repository

- Building a Bash script (`element.sh`) to query the database

The final result allows users to query chemical elements by atomic number, symbol, or name directly from the command line.

## 🛠 Technologies Used

- PostgreSQL

- Bash

- Git

- Linux shell (VM provided by freeCodeCamp)

## 🗄 Database Setup & Fixes

The project starts with a pre-existing PostgreSQL database named `periodic_table`. The following changes were made:

### Table & Column Fixes

- Renamed:

 - `weight` → `atomic_mass`

 - `melting_point` → `melting_point_celsius`

 - `boiling_point` → `boiling_point_celsius`

- Added `NOT NULL` constraints to:

 - `melting_point_celsius`

 - `boiling_point_celsius`

 - `symbol`

 - `name`

- Added `UNIQUE` constraints to:

 - `symbol`

 - `name`

- Removed the invalid element with `atomic_number = 1000`

### Relationships & Normalization

- Created a new `types` table:

 - `type_id` (INT, PRIMARY KEY)

 - `type` (VARCHAR, NOT NULL)

- Inserted three element types:

 - metal

 - nonmetal

 - metalloid

- Updated the properties table:

 - Removed the type column

 - Added a type_id column (INT, NOT NULL)

 - Linked type_id to the types table

 - Set atomic_number as a foreign key referencing elements(atomic_number)

### Data Corrections

- Capitalized the first letter of all element symbols

- Removed trailing zeros from atomic_mass

- Adjusted column data types as needed

- Added missing elements:

 - Fluorine (F) — atomic number 9

 - Neon (Ne) — atomic number 10

## 📂 Repository Structure
```pgsql

periodic_table/
├── element.sh
├── periodic_table.sql
└── README.md

## 📜 Bash Script: element.sh

The element.sh script allows querying the database using:

Atomic number

Element symbol

Element name

Permissions

The script is executable:

chmod +x element.sh

Usage Examples
./element.sh 1
./element.sh H
./element.sh Hydrogen

Expected Output Format
The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.

Error Handling

No argument provided:

Please provide an element as an argument.

Element not found:

I could not find that element in the database.

## 🧪 Database Backup & Restore

To back up the database:

pg_dump -cC --inserts -U freecodecamp periodic_table > periodic_table.sql

To restore the database:

psql -U postgres < periodic_table.sql

## 🌱 Git Requirements

Repository initialized with git init

Uses the main branch

At least five commits

First commit message:

Initial commit

Subsequent commits prefixed with:

fix:

feat:

refactor:

chore:

test:

Working tree clean on final submission
