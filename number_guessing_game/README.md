# Number Guessing Game 🎯

This is a Bash-based Number Guessing Game built as part of the **freeCodeCamp Relational Database Certification**.  
The game generates a random number between **1 and 1000**, stores user data in a **PostgreSQL database**, and tracks gameplay statistics.

---

## 📌 Project Requirements

- Bash script with `#!/bin/bash` shebang
- PostgreSQL database named `number_guess`
- Store users and game results
- Prompt for username and guesses only
- Output must match freeCodeCamp user stories exactly
- At least **five Git commits**
- Final code committed on the `main` branch

---

## 🗂️ Project Structure

number_guessing_game/
├── number_guess.sh
├── README.md
└── number_guess.sql (optional database dump)

---

## 🛠️ Technologies Used

- **Bash**
- **PostgreSQL**
- **psql CLI**
- **Git**

---

## 🧱 Database Schema

### `users` table
| Column   | Type    | Description              |
|--------|---------|--------------------------|
| user_id | SERIAL  | Primary key              |
| username | VARCHAR(22) | Unique username |

### `games` table
| Column | Type | Description |
|------|------|-------------|
| game_id | SERIAL | Primary key |
| user_id | INT | Foreign key to users |
| number_of_guesses | INT | Attempts taken |


