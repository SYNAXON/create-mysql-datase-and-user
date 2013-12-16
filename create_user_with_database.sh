#!/bin/bash
USER=
PASSWORD=
FILE=create_user_with_database.sql

usage()
{
    cat <<EOF
    usage: $0 options

    This script will create a user and a database. 

    OPTIONS:
    -h      Show this message
    -u      the user name
    -p      the password
EOF
}

while getopts “hp:u:” OPTION
do
    case $OPTION in
        h)
            usage
            exit 1
            ;;
        p)
            PASSWORD=$OPTARG
            ;;
        u)
            USER=$OPTARG
            ;;
        ?)
            usage
            exit
            ;;
    esac
done

if [[ -z $USER ]] || [[ -z $PASSWORD ]]
then
    usage
    exit 1
fi


cat $FILE | sed "s/USERNAME/$USER/g" | sed "s/PASSWORD/$PASSWORD/g"
