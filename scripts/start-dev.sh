#!/bin/bash
# Start backend in development mode
cd backend
npm run dev &
# Start frontend
cd ../frontend
npm start