#!/bin/bash
mkdir -p attendance_tracker_v1
touch attendance_tracker_v1/attendance_checker.py
mkdir -p attendance_tracker_v1/Helpers
touch attendance_tracker_v1/Helpers/assets.csv
touch attendance_tracker_v1/Helpers/config.json
mkdir -p attendance_tracker_v1/reports
touch attendance_tracker_v1/reports/report.log

CFIG_FILE="attendance_tracker_v1/Helpers/config.json"

echo "Do you want to update attendance threshols? (y/n)"
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

    archive_name="attendance_tracker_v1_archive.tar.gz"

    tar -czf "$archive_name" "attendance_tracker_v1"

    echo "Project archived as $archive_name"

    rm -rf "attendance_tracker_v1"

    echo "Incomplete directory deleted."

    exit 1
}
trap cleanup SIGINT

echo "Processing..."

sleep 20   # simulate long work

echo "Done successfully!"
cleanup() {
    echo " Saving progress..."

    archive_name="attendance_tracker_v1_archive.tar.gz"

    tar -czf "$archive_name" "attendance_tracker_v1"

    echo "Project archived as $archive_name"

    rm -rf "attendance_tracker_v1"

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
