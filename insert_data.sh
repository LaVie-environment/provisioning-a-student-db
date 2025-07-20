#!/bin/bash
# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=lavie --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read MAJOR COURSE

do
  # get major_id
  if [[ $MAJOR != major && -n "$MAJOR" ]]
  then
    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found
    if [[ -z $MAJOR_ID ]]
    then
        # insert major
        INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
        
        # get new major_id
        MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
        echo "New MAJOR_ID: $MAJOR_ID"
    fi

    # get course_id

    # if not found

    # insert course

    # get new course_id

    # insert into majors_courses

 fi
done
