#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Shaha's Salon ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "How may we help you?\n.\n." 
  echo -e "\n1) Wash and Twist\n2) Manicure\n3) Pedicure\n4) Eyebrow Shaping\n6) Hair Cut\n7) Exit"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) WASH ;;
    2) MANI ;;
    3) PEDI ;;
    4) BROWS ;;
    6) CUT ;;
    7) EXIT ;;
    *) MAIN_MENU "That is not an option. Please try again."
  esac
}

WASH() {
#get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

# get phone number
echo -e "\nWhat is your phone number?\ni.e: 555-5555\n"
read CUSTOMER_PHONE

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
echo "$CUSTOMER_ID"

# if customer is not in table
  if [[ -z $CUSTOMER_ID ]]
    then
    
    # get name
    echo -e "\nWelcome to Shaha's Salon, what is your first name?"
    read CUSTOMER_NAME

    # insert into customers table
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
    fi  

# get customer name
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# get time of service
echo -e "\nHi $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g'), What time should we expect you for your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')?" 
read SERVICE_TIME

# insert into appointments
INSERT_SERVICE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# confirmation message
echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}

MANI() {
#get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

# get phone number
echo -e "\nWhat is your phone number?\ni.e: 555-5555\n"
read CUSTOMER_PHONE

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
echo "$CUSTOMER_ID"

# if customer is not in table
  if [[ -z $CUSTOMER_ID ]]
    then
    
    # get name
    echo -e "\nWelcome to Shaha's Salon, what is your first name?"
    read CUSTOMER_NAME

    # insert into customers table
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
    fi  

# get customer name
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# get time of service
echo -e "\nHi $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g'), What time should we expect you for your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')?" 
read SERVICE_TIME

# insert into appointments
INSERT_SERVICE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# confirmation message
echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}
PEDI() {
#get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

# get phone number
echo -e "\nWhat is your phone number?\ni.e: 555-5555\n"
read CUSTOMER_PHONE

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
echo "$CUSTOMER_ID"

# if customer is not in table
  if [[ -z $CUSTOMER_ID ]]
    then
    
    # get name
    echo -e "\nWelcome to Shaha's Salon, what is your first name?"
    read CUSTOMER_NAME

    # insert into customers table
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
    fi  

# get customer name
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# get time of service
echo -e "\nHi $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g'), What time should we expect you for your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')?" 
read SERVICE_TIME

# insert into appointments
INSERT_SERVICE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# confirmation message
echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}
BROWS() {
#get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

# get phone number
echo -e "\nWhat is your phone number?\ni.e: 555-5555\n"
read CUSTOMER_PHONE

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
echo "$CUSTOMER_ID"

# if customer is not in table
  if [[ -z $CUSTOMER_ID ]]
    then
    
    # get name
    echo -e "\nWelcome to Shaha's Salon, what is your first name?"
    read CUSTOMER_NAME

    # insert into customers table
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
    fi  

# get customer name
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# get time of service
echo -e "\nHi $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g'), What time should we expect you for your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')?" 
read SERVICE_TIME

# insert into appointments
INSERT_SERVICE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# confirmation message
echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}
CUT() {
#get service name
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")

# get phone number
echo -e "\nWhat is your phone number?\ni.e: 555-5555\n"
read CUSTOMER_PHONE

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
echo "$CUSTOMER_ID"

# if customer is not in table
  if [[ -z $CUSTOMER_ID ]]
    then
    
    # get name
    echo -e "\nWelcome to Shaha's Salon, what is your first name?"
    read CUSTOMER_NAME

    # insert into customers table
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name = '$CUSTOMER_NAME'")
    fi  

# get customer name
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# get time of service
echo -e "\nHi $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g'), What time should we expect you for your $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g')?" 
read SERVICE_TIME

# insert into appointments
INSERT_SERVICE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# confirmation message
echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."

}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU