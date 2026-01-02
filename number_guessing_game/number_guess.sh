#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -A -t -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1))
COUNT=0

echo -e "\nEnter your username:"
read USERNAME

while [[ ! $USERNAME =~ ^[a-zA-Z0-9]{1,22}$ ]]; do
  echo "Invalid username. Use only letters or numbers (max 22 chars):"
  read USERNAME
done

USER_STATS=$($PSQL "SELECT u.user_id, COUNT(g.user_id) AS games_played, MIN(g.number_of_guesses) AS best_game FROM users u LEFT JOIN games g ON u.user_id = g.user_id WHERE username = '$USERNAME' GROUP BY u.user_id")

if [[ -z $USER_STATS ]]; then
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  IFS='|' read -r USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_STATS"
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo -e "\nGuess the secret number between 1 and 1000:"

while true; do
  read -r GUESS

  while [[ ! $GUESS =~ ^[[:digit:]]+$ ]]; do
    echo "That is not an integer, guess again:"
    read -r GUESS
  done

  ((COUNT++))

  if [[ $GUESS -gt $SECRET_NUMBER ]]; then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    INSERT_GAME=$($PSQL "INSERT INTO games(number_of_guesses, user_id) VALUES($COUNT, $USER_ID)")
    break
  fi
done


