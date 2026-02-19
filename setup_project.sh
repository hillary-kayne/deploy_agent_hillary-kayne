#!/bin/bash
read -p "Enter Directory Name:" input
project_dc=attendance_tracker_$input
echo "${project_dc}"
mkdir -p $project_dc
touch $project_dc/attendance_checker.py
mkdir -p $project_dc/Helpers
touch $project_dc/Helpers/assets.csv
touch $project_dc/Helpers/config.json
mkdir -p $project_dc/reports
touch $project_dc/reports/report.log

CFIG_FILE="$project_dc/Helpers/config.json"

echo "Do you want to update attendance thresholds? (y/n)"
read answer

if [ "$answer" = "y" ]; then

    echo "Input Warning Threshold (default 75%):"
    read warning
    warning=${warning:-75}

    echo "Input Failure Threshold (default 50%):"
    read failure
    failure=${failure:-50}

    # Update values ONLY inside the thresholds block
    sed -i '/"thresholds": {/,/}/ s/"warning": *[0-9]\+/"warning": '"$warning"'/' "$CFIG_FILE"

    sed -i '/"thresholds": {/,/}/ s/"failure": *[0-9]\+/"failure": '"$failure"'/' "$CFIG_FILE"

    echo "Thresholds updated successfully!"

else
    echo "No changes made."
fi

cleanup() {
    echo " Saving progress..."

    archive_name="$project_dc_archive.tar.gz"

    tar -czf "$archive_name" "$project_dc"

    echo "Project archived as $archive_name"

    rm -rf "$project_dc"

    echo "Incomplete directory deleted."

    exit 1
}
trap cleanup SIGINT

echo "Processing..."

sleep 20   # simulate long work

echo "Done successfully!"

echo "Running Health Check..."
echo "Checking Python3..."

if python3 --version >/dev/null 2>&1; then
    echo " Python3 is installed."
else
    echo " Warning: Python3 is NOT installed."
fi
