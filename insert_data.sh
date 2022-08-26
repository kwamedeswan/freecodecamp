#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
TRUNCATE_TABLE_RESULT="$($PSQL "TRUNCATE teams, games")"
if [[ $TRUNCATE_TABLE_RESULT == "TRUNCATE TABLE" ]]
  then
  echo -e "\nTables have been cleaned\n"
fi

cat games.csv | while IFS="," read YEAR ROUND WIN OPP WIN_GS OPP_GS
do
  if [[ $WIN != "winner" ]]
  then
  
  # get winner_id 
  WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")
	
	# if not found
	  if [[ -z $WIN_ID ]]
	  then
	
    # insert winner into Teams Table 
	INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WIN')")
		  if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
      then
		  echo Inserted into Teams, $WIN
		
		  #get new winner_id
		  WIN_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WIN'")
      fi
    fi

	if [[ $OPP != "opponent" ]]
  then
            
	#get opponent_id
	OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")
				
		# if not found
		if [[ -z $OPP_ID ]]
    then
                
		# insert opponent into Teams Table
		INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPP')")
		  if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
      then
      echo Inserted into Teams, $OPP
					
			#get new opponent_id
			OPP_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPP'")

      # Teams info
      echo -e "\n$WIN VS $OPP"
      	
      fi
    fi
  fi
fi
if [[ $YEAR != "year" ]]
  then
	if [[ $ROUND != "round" ]]
     then
		if [[ $WIN_GS != "winner_goals" ]]
        then
			if [[ $OPP_GS != "opponent_goals" ]]
            then
				INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WIN_ID, $OPP_ID, $WIN_GS, $OPP_GS)")
					if [[ $INSERT_GAMES_RESULT == "INSERT 0 1" ]]
					then
					echo Inserted Games results for $WIN VS $OPP into Games Table
                    fi
            fi
    fi
  fi 
fi  
done