#!/bin/bash
echo "Setting up local development environment..."
# Install root dependencies
npm install
# Install frontend dependencies
cd frontend
npm install
cd ..
# Install backend dependencies
cd backend
npm install
cd ..
echo "Local development environment setup complete!"
echo "Run 'npm start' from the root directory to start both frontend and backend servers."