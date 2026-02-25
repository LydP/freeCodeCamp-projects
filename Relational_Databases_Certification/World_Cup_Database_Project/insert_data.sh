#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
SKIP_HEADERS=1
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if (( SKIP_HEADERS ))
  then 
    (( SKIP_HEADERS-- ))
  else
    INSERT_WINNER=$($PSQL "
    INSERT INTO teams(name)
    VALUES('$WINNER')
    ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name
    RETURNING team_id")
    
    WINNER_ID=$(echo $INSERT_WINNER | awk '{print $1}')

    INSERT_OPPONENT=$($PSQL "
    INSERT INTO teams(name)
    VALUES('$OPPONENT')
    ON CONFLICT (name) DO UPDATE SET name = EXCLUDED.name
    RETURNING team_id")
    
    OPPONENT_ID=$(echo $INSERT_OPPONENT | awk '{print $1}')
    
    INSERT_GAMES=$($PSQL "
    INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
    VALUES($YEAR, '$ROUND',  $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done