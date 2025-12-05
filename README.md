🏥 Healthcare Patient Portal Login Script

A lightweight Bash-based authentication tool for clinic or patient login systems.



📌 Overview

This project is a simple healthcare login system built using Bash.
It verifies patient usernames and passwords using text-processing tools and keeps a log of recent sign-ins.

This script demonstrates foundational Linux skills:
    •    🔍 grep for searching
    •    🧮 awk for text parsing
    •    📑 sort + uniq for organizing logs
    •    🔐 Secure password entry
    •    🗂️ Lightweight file-based database



🎯 Problem This Script Solves (Case Study)

Healthcare clinics and small offices often rely on shared Linux terminals.
They don’t need a full web application — just a fast, simple, local login system.

Problem

There is no quick, low-resource way for patients or staff to authenticate or track system use on local machines.

Solution

This Bash script provides:
    •    Instant username/password validation
    •    A login audit trail in logins.txt
    •    A simple way to view recent login history
    •    A secure, predictable workflow suitable for clinics

This demonstrates your ability to identify a real-world problem, design a solution, and implement it with Bash.



🧩 How the Script Works
    1.    Prompts for username
    2.    Prompts for password (hidden)
    3.    Searches users.txt for that username
    4.    Extracts stored password using awk
    5.    Compares input → stored
    6.    If correct:
    •    Logs timestamp
    •    Displays last 3 login entries
    7.    If incorrect:
    •    Displays an error message

📂 File Structure

echo "=== Healthcare Patient Portal ==="
read -p "Username: " user
read -s -p "Password: " pass
echo

patient_line=$(grep "^$user:" users.txt)
if [ -z "$patient_line" ]; then
    echo "Patient not found!"
    exit 1

🛠️ Tools & Commands Used

Command
Purpose
grep
Searches for user records
awk
Extracts stored password
sort
Sorts login history
uniq
Removes duplicate records
date
Adds timestamp to logs


📜 License

Distributed under the MIT License — free for use and modification.

🤝Attribution
    •    Script created by Fathiya
    •    Guided by Linux & Bash coursework
    •    README and improvements 




