#!/bin/bash
# BROKEN: Healthcare login using awk/grep/sort/uniq - Two PATIENTS!

echo "=== Healthcare Patient Portal ==="

read -p "Username: " user
read -s -p "Password: " pass
echo

# BROKEN: Find patient with grep (WRONG SYNTAX)
patient_line=$(grep $user users.txt)

if [ -z "$patient_line" ]; then
    echo "Patient not found!"
    exit 1
fi

# BROKEN: Parse with awk (WRONG FIELD SEPARATOR)
fields=awk -F, '{print $1","$2","$3}' <<< "$patient_line"
stored_pass="${fields[1]}"

if [ "$pass" == "$stored_pass" ]; then
    
    # BROKEN: Show login history with sort/uniq (WRONG ORDER)
    echo "✓ Patient login successful!"
    echo "Recent patient logins:"
    sort logins.txt | uniq -c | head -3  # WRONG FILE
    
    # BROKEN: Role menu
    role=$(echo $patient_line | awk '{print $3}')  # WRONG
    
    if  $role in
        "patient") echo "Patient portal - View records & appointments" ;;
    fi    "doctor") echo "Doctor portal" ;;
    
else
    echo " Wrong password for patient"
fi
