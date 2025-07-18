#!/bin/bash
# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=lavie --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read -r MAJOR COURSE
do
    # Skip header row
    if [[ "$MAJOR" == "major" ]]; then
        continue
    fi

    # get major_id
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    # echo "Major ID: $MAJOR_ID"
    
    # if not found
    if [[ -z "$MAJOR_ID" ]]
    then
        # insert major
        INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR') RETURNING major_id")
        echo "Inserted major: $INSERT_MAJOR_RESULT"
        MAJOR_ID=$INSERT_MAJOR_RESULT
    fi

    # get new major_id

    # if not found

    # insert course

    # get new course_id

    # if not found

    # insert course

    # get new course_id

    # insert into majors_courses

done