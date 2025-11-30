#!/bin/bash
# Healthcare login using awk/grep/sort/uniq - FIXED!

echo "=== Healthcare Patient Portal ==="

read -p "Username: " user
read -s -p "Password: " pass
echo

# FIXED 1: grep NEEDS quotes + anchor
patient_line=$(grep "^$user:" users.txt)

if [ -z "$patient_line" ]; then
    echo "Patient not found!"
    exit 1
fi

# FIXED 2: awk NEEDS proper assignment
stored_pass=$(echo "$patient_line" | awk -F: '{print $2}')

if [ "$pass" = "$stored_pass" ]; then
    
    # FIXED 3: create logins.txt first
    touch logins.txt
    echo "$user logged in at $(date)" >> logins.txt
    echo "✓ Patient login successful!"
    echo "Recent patient logins:"
    sort logins.txt | uniq -c | tail -3
    
    # FIXED 4: extract role properly
    role=$(echo "$patient_line" | awk -F: '{print $3}')
    
    # FIXED 5: PROPER if/else (no case!)
    if [ "$role" = "patient" ]; then
        echo "Patient portal - View records & appointments"
    else
        if [ "$role" = "doctor" ]; then
            echo "Doctor portal"
        else
            echo "Admin/Other portal"
        fi
    fi
    
else
    echo "Wrong password for patient"
fi
