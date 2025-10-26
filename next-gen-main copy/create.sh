#!/bin/bash
set -e

# Checkout main branch and make sure it's up to date
git checkout main
git pull origin main

# Generate a random branch name
BRANCH="patch-$(date +%s)-$RANDOM"

# Create new branch
git checkout -b "$BRANCH"

# Apply patch
git apply patch-iac

# Stage changes
git add .

# Commit
git commit -m "Apply patch from file 'patch'"

# Push branch
git push origin "$BRANCH"

echo "✅ Patch applied and pushed to branch: $BRANCH"
