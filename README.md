Student Attendance Tracker – Setup Guide

What Is This?

This project contains a Bash script that automatically creates a Student Attendance Tracker folder for you.
Instead of manually creating folders and files, this script does everything for you in one command.
You do NOT need to know programming to run it. Just follow the steps below.

What Does the Script Do?

When you run the script, it will:

1. Ask you to enter a directory name.
2. Create a project folder named: attendance_tracker_<your_name>
3. Inside that folder, it creates:
   - attendance_checker.py
   - Helpers folder (with assets.csv and config.json)
   - reports folder (with report.log)
4. Ask if you want to change attendance warning and failure percentages.
5. Check if Python3 is installed on your computer.
6. Safely handle interruptions (if you press CTRL + C).

How To Run The Script (Step by Step)

Step 1: Open Your Terminal

Make sure you are inside the folder where `setup_project.sh` is located.

Step 2: Give Permission To Run The Script

Type: chmod +x setup_project.sh
Press Enter.

Step 3: Run The Script 

Type:./setup_project.sh
Press Enter.

What Happens Next?

You will see:

Enter Directory Name:
Type a name (example: v1) and press Enter.

The script will create: attendance_tracker_<yourname>

Next,  Updating Attendance Percentages

The script will ask: Do you want to update attendance thresholds? (y/n)

If you type: y

You can enter:
- Warning percentage (default is 75)
- Failure percentage (default is 50)

If you just press Enter without typing anything, the default values will be used.

But, What If I Press CTRL + C?

If you stop the script while it is running:

- The project folder will be saved into a compressed archive file.
- The unfinished folder will be deleted.
- Your workspace stays clean.

The archive file will look like this: attendance_tracker_<your_name>_archive.tar.gz

Lastly, Python Check

Before finishing, the script checks if Python3 is installed.

If Python3 is installed:
You will see a success message.

If Python3 is not installed:
You will see a warning message.

To  Summarize,

This script automatically:

- Creates a project folder
- Generates required files
- Lets you change settings
- Handles interruptions safely
- Checks if Python3 is installed

It will save your time and prevent mistakes when setting up a project.

Video Link: https://youtu.be/mvcfgNFsjIw
