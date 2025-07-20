#!/bin/bash
# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=lavie --dbname=students --no-align --tuples-only -c"

cat courses_test.csv | while IFS="," read -r MAJOR COURSE
do
    # Skip header row
    if [[ $MAJOR != major ]]
    then
        # get major_id
        MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
        # echo "Major ID: $MAJOR_ID"
    
        # if not found
        if [[ -z "$MAJOR_ID" ]];
        then
            # insert major
            $PSQL "INSERT INTO majors(major) VALUES('$MAJOR');"
            echo "Inserted into majors: $MAJOR"
            MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR';")
        fi

        if [[ $INSERT_MAJOR_RESULT  == "INSERT 0 1" ]]
        then
            echo "Inserted into majors: $MAJOR"
        fi       

        # get new major_id

        # if not found

        # insert course

        # get new course_id
        COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

        # if not found
        if [[ -z $COURSE_ID ]];
        then
            # insert course
            $PSQL "INSERT INTO courses(course) VALUES('$COURSE');"
        fi

        if [[ $INSERT_COURSE_RESULT  == "INSERT 0 1" ]]
        then
            echo "Inserted into courses: $COURSE"
        fi
        # get new course_id

        # insert into majors_courses  
    fi
done