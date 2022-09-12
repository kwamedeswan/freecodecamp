#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c" 

if [[ -z $1 ]]
  then
  echo -e "Please provide an element as an argument."

# if atomic_number
elif [[ $1 =~ [0-9] ]]
  then

  # get element name
  ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")

  # if no atomic_number
  if [[ -z $ELEMENT_NAME ]]
    then
    echo "I could not find that element in the database."
      
    else
      
    # get symbol
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")

    # get atomic_mass
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$1")

    # get melting_point_celsius
    MPC=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$1")

    # get boiling_point_celsius 
    BPC=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$1")

    # get type
    TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) WHERE atomic_number=$1")

    echo "The element with atomic number $(echo $1 | sed -r 's/^ *| *$//g') is $(echo $ELEMENT_NAME | sed -r 's/^ *| *$//g') ($(echo $SYMBOL | sed -r 's/^ *| *$//g')). It's a $(echo $TYPE | sed -r 's/^ *| *$//g'), with a mass of $(echo $ATOMIC_MASS | sed -r 's/^ *| *$//g') amu. $(echo $ELEMENT_NAME | sed -r 's/^ *| *$//g') has a melting point of $(echo $MPC | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $BPC | sed -r 's/^ *| *$//g') celsius."
  fi
    
  # if symbol
  elif [[ $1 =~ [a-zA-Z] && ${#1} < {3} ]]
    then

    # get atomic_number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")      

    # if no element
    if [[ -z $ATOMIC_NUMBER || ${#1} > {3} ]]
      then
      echo "I could not find that element in the database."
        
      else
      # get element name
      ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE symbol='$1'")
				
		  # get symbol
      SYMBOL=$1

      # get atomic_mass
      ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

      # get melting_point_celsius
      MPC=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

      # get boiling_point_celsius 
      BPC=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

      # get type
      TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")

      echo "The element with atomic number $(echo $ATOMIC_NUMBER | sed -r 's/^ *| *$//g') is $(echo $ELEMENT_NAME | sed -r 's/^ *| *$//g') ($(echo $SYMBOL | sed -r 's/^ *| *$//g')). It's a $(echo $TYPE | sed -r 's/^ *| *$//g'), with a mass of $(echo $ATOMIC_MASS | sed -r 's/^ *| *$//g') amu. $(echo $ELEMENT_NAME | sed -r 's/^ *| *$//g') has a melting point of $(echo $MPC | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $BPC | sed -r 's/^ *| *$//g') celsius."
    fi

    
  # if element_name
  elif [[ $1 == "Hydrogen" || $1 == "Beryllium" || $1 == "Carbon" || $1 == "Lithium" || $1 == "Nitrogen" || $1 == "Fluorine" || $1 == "Helium" || $1 == "Oxygen" || $1 == "Neon" || $1 == "Boron" ]]
    then
		  
    # get element_name
	  ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name = '$1'")

    # get symbol
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$1'")
        
    # get atomic_number
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")

    # get atomic_mass
    ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

    # get melting_point_celsius
    MPC=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

    # get boiling_point_celsius 
    BPC=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")

    # get type
    TYPE=$($PSQL "SELECT type FROM types INNER JOIN properties USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER")
        
    #echo -e "\nAtomic Number: $ATOMIC_NUMBER\nType: $TYPE\nName: $ELEMENT_NAME\nAtomic Mass: $ATOMIC_MASS\n"
    echo "The element with atomic number $(echo $ATOMIC_NUMBER | sed -r 's/^ *| *$//g') is $(echo $ELEMENT_NAME | sed -r 's/^ *| *$//g') ($(echo $SYMBOL | sed -r 's/^ *| *$//g')). It's a $(echo $TYPE | sed -r 's/^ *| *$//g'), with a mass of $(echo $ATOMIC_MASS | sed -r 's/^ *| *$//g') amu. $(echo $ELEMENT_NAME | sed -r 's/^ *| *$//g') has a melting point of $(echo $MPC | sed -r 's/^ *| *$//g') celsius and a boiling point of $(echo $BPC | sed -r 's/^ *| *$//g') celsius."
    
    # if no element
      else [[ -z $ELEMENT_NAME ]]
      echo "I could not find that element in the database."
    fi