# Celestial Bodies Database

This project is part of the **freeCodeCamp Relational Database Certification**.  
It consists of a PostgreSQL database that models celestial objects in the universe.

## Project Description

The database stores information about:
- Galaxies
- Stars
- Planets
- Moons

Relationships are defined using primary and foreign keys to represent how celestial bodies are connected.

## Files

- `celestial_bodies.sql` — SQL script that creates the database schema and inserts data

## Database Structure

The database includes the following tables:
- `galaxy`
- `star`
- `planet`
- `moon`

Each table uses:
- Primary keys for unique identification
- Foreign keys to establish relationships
- Appropriate data types and constraints

## How to Run

1. Open a terminal
2. Import the database using PostgreSQL:
   ```bash
   psql -U postgres < celestial_bodies.sql
