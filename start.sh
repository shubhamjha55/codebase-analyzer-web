#!/bin/bash

# Restore frontend npm packages
echo "Restoring frontend npm packages"
cd frontend
npm install
if [ $? -ne 0 ]; then
    echo "Failed to restore frontend npm packages"
    exit $?
fi

# Build frontend
echo "Building frontend"
npm run build
if [ $? -ne 0 ]; then
    echo "Failed to build frontend"
    exit $?
fi

# Start backend
echo "Starting backend"
cd ..
./.venv/bin/python -m flask run --port=50505 --host=127.0.0.1 --no-debugger --no-reload
if [ $? -ne 0 ]; then
    echo "Failed to start backend"
    exit $?
fi
