#!/bin/bash
# Number Guessing Game

PSQL="psql -X --username=freecodecamp --dbname=number_guessing_game -t --no-align -c" 
SECRET_NUMBER=$(( RANDOM % 1000 +1))
NUMBER_OF_TRIES=0

# functions
# main guess
MAIN_GUESS() {

read GUESS

if [[ $GUESS =~ ^[0-9]+$ ]]
then

GAME_LOOP $GUESS

else
echo "That is not an integer, guess again:"
MAIN_GUESS
fi
}

# loop function
GAME_LOOP() {
  GUESS=$1
  
  ((NUMBER_OF_TRIES++))
  
  # correct pass
  if [[ $GUESS == $SECRET_NUMBER ]]
  then

  GAMES_PLAYED=$($PSQL "SELECT game_id FROM guessing_game WHERE username = '$USERNAME' ORDER BY game_id DESC LIMIT 1")
  BEST_GAME=$($PSQL "SELECT score FROM guessing_game WHERE username = '$USERNAME' ORDER BY score DESC LIMIT 1")
  ADD_NEW_PLAYER_RESULT=$($PSQL "INSERT INTO guessing_game(username, score) VALUES('$USERNAME', $NUMBER_OF_TRIES)")
  echo "You guessed it in $NUMBER_OF_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
  
  else
  if [[ $GUESS > $SECRET_NUMBER ]]
  then
  echo "It's lower than that, guess again:"
  MAIN_GUESS $GUESS $SECRET_NUMBER $NUMBER_OF_TRIES

  else
  if [[ $GUESS < $SECRET_NUMBER ]]
  then
  echo "It's higher than that, guess again:"
  MAIN_GUESS $GUESS
  fi
  fi
  fi
}

# get username
echo "Enter your username:"
read USERNAME

USERNAME_RESULT=$($PSQL "SELECT username FROM guessing_game WHERE username = '$USERNAME'")

# if no username in database
if [[ -z $USERNAME_RESULT ]]
then

# welcome message
echo "Welcome, $USERNAME! It looks like this is your first time here."

else
GAMES_PLAYED=$($PSQL "SELECT COUNT(username) FROM guessing_game WHERE username = '$USERNAME'")
BEST_GAME=$($PSQL "SELECT score FROM guessing_game WHERE username = '$USERNAME' ORDER BY score DESC LIMIT 1")
    
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

MAIN_GUESS