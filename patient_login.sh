#!/bin/bash
echo "=== Healthcare Patient Portal ==="
read -p "Username: " user
read -s -p "Password: " pass
echo

patient_line=$(grep "^$user:" users.txt)
if [ -z "$patient_line" ]; then
    echo "Patient not found!"
    exit 1
fi

stored_pass=$(echo "$patient_line" | awk -F: '{print $2}')
if [ "$pass" = "$stored_pass" ]; then
    
    # FIXED: Create file first!
    touch logins.txt
    echo "$user logged in at $(date)" >> logins.txt
    echo "✓ Patient login successful!"
    echo "Recent patient logins:"
    sort logins.txt | uniq -c | tail -3
    
    echo "Login works!"
else
    echo "Wrong password!"
fi
