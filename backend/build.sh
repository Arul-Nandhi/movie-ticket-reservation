#!/usr/bin/env bash
# exit on error
set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

# Seed database only if SEED_DATABASE is set to True
if [ "$SEED_DATABASE" = "True" ]; then
    echo "Seeding database with sample movie and show data..."
    python manage.py seed_data
fi
