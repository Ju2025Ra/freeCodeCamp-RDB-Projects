# World Cup Database Project

This project is part of the **freeCodeCamp Relational Database Certification**. It uses PostgreSQL and Bash scripting to create, populate, and query a database containing World Cup match results from the final three rounds of tournaments since 2014.

The project demonstrates database design, data insertion from CSV files, and SQL querying via shell scripts.

---

## 📁 Project Structure

---

## 📊 Dataset

The `games.csv` file contains match data from the World Cup final rounds, including:

- Year
- Round
- Winning team
- Opponent team
- Goals scored by each team

The first row contains column headers and is ignored during insertion.

---

## 🧩 Project Requirements

### Part 1: Create the Database

- Create a PostgreSQL database named **`worldcup`**
- Create two tables:
  - **teams**
    - `team_id` (SERIAL, PRIMARY KEY)
    - `name` (VARCHAR, UNIQUE, NOT NULL)
  - **games**
    - `game_id` (SERIAL, PRIMARY KEY)
    - `year` (INT, NOT NULL)
    - `round` (VARCHAR, NOT NULL)
    - `winner_id` (INT, FOREIGN KEY → teams.team_id, NOT NULL)
    - `opponent_id` (INT, FOREIGN KEY → teams.team_id, NOT NULL)
    - `winner_goals` (INT, NOT NULL)
    - `opponent_goals` (INT, NOT NULL)

---

### Part 2: Insert the Data

- Complete `insert_data.sh` to:
  - Read from `games.csv`
  - Insert **24 unique teams** into the `teams` table
  - Insert **32 games** into the `games` table
- Team IDs must be dynamically retrieved from the database (no hardcoding)
- The script must run efficiently within the test time limit
- Tables can be reset using:
  ```sql
  TRUNCATE TABLE games, teams;
