#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t -A -c"

GET_ELEMENT() {
  if [[ $1 =~ ^[0-9]+$ ]]; then
    ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number = $1")
    echo "$ELEMENT_RESULT" 
  elif [[ $1 =~ ^[a-zA-Z]+$ ]]; then
    if [[ ${#1} -le 2 ]]; then
    ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE symbol = '$1'")
    echo "$ELEMENT_RESULT"
    else 
    ELEMENT_RESULT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE name = '$1'")
    echo "$ELEMENT_RESULT"
    fi
  else
    echo ""
  fi
}

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
else

  ELEMENT_RESULT=$(GET_ELEMENT "$1")

  if [[ -z $ELEMENT_RESULT ]]; then
    echo "I could not find that element in the database."
  else
    echo $ELEMENT_RESULT | while IFS="|" read AN SYMBOL NAME AM MPC BPC TYPE
    do
      echo "The element with atomic number $AN is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AM amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius." 
    done
  fi
fi
