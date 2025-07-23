#!/bin/bash
# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=lavie --dbname=students --no-align --tuples-only -c"

echo $($PSQL "TRUNCATE students, majors_courses, courses, majors")

cat courses.csv | while IFS="," read MAJOR COURSE
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
        
        if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
        then
            echo "Inserted into majors, $MAJOR"
        fi

        # get new major_id
        MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
        echo "New MAJOR_ID: $MAJOR_ID"
    fi

    # get course_id
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
        # insert course
        INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
        
        if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
        then
            echo "Inserted into courses, $COURSE"
        fi

        # get new course_id
        COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
        # echo "New COURSE_ID: $COURSE_ID"
    fi


    # insert course

    # get new course_id

    # insert into majors_courses
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")

    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
        echo "Inserted into majors_courses, $MAJOR_ID :  $COURSE"
    fi
 fi
done


cat students_test.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    # Initializza variables
    MAJOR_ID="NULL"
    GPA_VALUE="NULL"

    # Handle case where major is NULL
    if [[ $MAJOR != "null" && -n "$MAJOR" ]]
    then
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    
    # if not found
    if [[ -z $MAJOR_ID ]]
    then
      # insert major
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
          echo "Inserted into majors, $MAJOR"
      fi
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi
  fi

  # Handle GPA null value
    if [[ $GPA != "null" && -n "$GPA" ]]
    then
      GPA_VALUE=$GPA
    fi

    # insert student
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA_VALUE)")

    if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into students, $FIRST $LAST"
    fi
  fi
done