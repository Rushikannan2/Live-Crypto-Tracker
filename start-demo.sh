#!/bin/bash

echo "🚀 Starting Web Scraper Demo Application..."
echo

echo "📦 Starting Backend Server (Demo Mode)..."
cd server && npm run demo &
BACKEND_PID=$!

echo "⏳ Waiting for backend to start..."
sleep 5

echo "📦 Starting Frontend Application..."
cd ../client && npm start &
FRONTEND_PID=$!

echo
echo "🎉 Demo Application Started!"
echo
echo "📱 Frontend: http://localhost:3000"
echo "🔗 Backend API: http://localhost:5000"
echo "📊 Health Check: http://localhost:5000/health"
echo
echo "Press Ctrl+C to stop both servers..."

# Wait for user to stop
wait
