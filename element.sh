#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

pattern1='^[0-9]+$'
pattern2='^[A-Z][a-z]?$' 
pattern3='^[A-Z][a-z]*$'

# atomic_num=""
# symbol
# name=""
# mass=""
# meltingPoint=""
# boilingPoint=""
# elementType=""

if [[ -z $1 ]]
 then
  echo "Please provide an element as an argument."
  exit 0

elif [[ $1 =~ $pattern1 ]]
 then
    atomic_num=$($PSQL "select atomic_number from elements where atomic_number = $1")
        if [[ -z $atomic_num ]]
            then
                echo "I could not find that element in the database."
            else
                 symbol=$($PSQL"select symbol from elements where atomic_number = $1")
                 name=$($PSQL"select name from elements where atomic_number = $1")
                 mass=$($PSQL "select atomic_mass from properties where atomic_number=$1")
                 meltingPoint=$($PSQL "select melting_point_celsius from properties where atomic_number = $1")
                 boilingPoint=$($PSQL "select boiling_point_celsius from properties where atomic_number = $1")
                 elementType=$($PSQL "select type from types where type_id=(select type_id from properties where atomic_number=$1)")
            echo -e "The element with atomic number $(echo $atomic_num | sed -E 's/^ *| *$//g') is $(echo $name | sed -E 's/^ *| *$//g') $(echo \($symbol\) | sed 's/ *//g'). It's a $(echo $elementType| sed 's/ *//g'), with a mass of $(echo $mass | sed -E 's/^ *| *$//g') amu. $(echo $name | sed -E 's/^ *| *$//g') has a melting point of $(echo $meltingPoint | sed -E 's/^ *| *$//g') celsius and a boiling point of $(echo $boilingPoint | sed -E 's/^ *| *$//g') celsius."
        fi
     

elif [[ $1 =~ $pattern2 ]]
  then
    atomic_num=$($PSQL "select atomic_number from elements where symbol = '$1'")
        if [[ -z $atomic_num ]]
            then
                echo "I could not find that element in the database."
            else
                 symbol=$($PSQL"select symbol from elements where atomic_number = $atomic_num")
                 name=$($PSQL"select name from elements where atomic_number = $atomic_num")
                 mass=$($PSQL "select atomic_mass from properties where atomic_number=$atomic_num")
                 meltingPoint=$($PSQL "select melting_point_celsius from properties where atomic_number = $atomic_num")
                 boilingPoint=$($PSQL "select boiling_point_celsius from properties where atomic_number = $atomic_num")
                 elementType=$($PSQL "select type from types where type_id=(select type_id from properties where atomic_number=$atomic_num)")
            echo -e "The element with atomic number $(echo $atomic_num | sed -E 's/^ *| *$//g') is $(echo $name | sed -E 's/^ *| *$//g') $(echo \($symbol\) | sed 's/ *//g'). It's a $(echo $elementType| sed 's/ *//g'), with a mass of $(echo $mass | sed -E 's/^ *| *$//g') amu. $(echo $name | sed -E 's/^ *| *$//g') has a melting point of $(echo $meltingPoint | sed -E 's/^ *| *$//g') celsius and a boiling point of $(echo $boilingPoint | sed -E 's/^ *| *$//g') celsius."
    
        fi


elif [[ $1 =~ $pattern3 ]]
  then
     atomic_num=$($PSQL "select atomic_number from elements where name = '$1'")
        if [[ -z $atomic_num ]]
            then
                echo "I could not find that element in the database."
            else
                 symbol=$($PSQL"select symbol from elements where atomic_number = $atomic_num")
                 name=$($PSQL"select name from elements where atomic_number = $atomic_num")
                 mass=$($PSQL "select atomic_mass from properties where atomic_number=$atomic_num")
                 meltingPoint=$($PSQL "select melting_point_celsius from properties where atomic_number = $atomic_num")
                 boilingPoint=$($PSQL "select boiling_point_celsius from properties where atomic_number = $atomic_num")
                 elementType=$($PSQL "select type from types where type_id=(select type_id from properties where atomic_number=$atomic_num)")
            echo -e "The element with atomic number $(echo $atomic_num | sed -E 's/^ *| *$//g') is $(echo $name | sed -E 's/^ *| *$//g') $(echo \($symbol\) | sed 's/ *//g'). It's a $(echo $elementType| sed 's/ *//g'), with a mass of $(echo $mass | sed -E 's/^ *| *$//g') amu. $(echo $name | sed -E 's/^ *| *$//g') has a melting point of $(echo $meltingPoint | sed -E 's/^ *| *$//g') celsius and a boiling point of $(echo $boilingPoint | sed -E 's/^ *| *$//g') celsius."
    
        fi
else
  echo "I could not find that element in the database."
fi
