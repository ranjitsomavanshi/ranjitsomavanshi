#!/bin/bash

# Set the number of past days to commit
DAYS=120  # Last 90 days
COMMITS_PER_DAY=5  # Adjust this for intensity (5-10 is medium green)

# Create a file to modify
touch contributions.txt

for ((i = DAYS; i >= 0; i -= 2)); do  # Alternate day commits
  for ((j = 0; j < COMMITS_PER_DAY; j++)); do
    echo "Commit on $(date --date="$i days ago" +%Y-%m-%d) - $j" >> contributions.txt
    git add contributions.txt
    GIT_COMMITTER_DATE="$(date --date="$i days ago" +%Y-%m-%dT12:00:00)" \
    GIT_AUTHOR_DATE="$GIT_COMMITTER_DATE" \
    git commit -m "Contribution on $(date --date="$i days ago" +%Y-%m-%d)"
  done
done
