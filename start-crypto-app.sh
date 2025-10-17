#!/bin/bash

echo "🚀 Starting Complete MERN Stack Cryptocurrency Scraper..."
echo

echo "📦 Starting Backend Server (Demo Mode)..."
cd server && npm run crypto-demo &
BACKEND_PID=$!

echo "⏳ Waiting for backend to start..."
sleep 5

echo "📦 Starting Frontend Application..."
cd ../client && npm start &
FRONTEND_PID=$!

echo
echo "🎉 Cryptocurrency Scraper Application Started!"
echo
echo "📱 Frontend: http://localhost:3000"
echo "🔗 Backend API: http://localhost:5000"
echo "📊 Health Check: http://localhost:5000/health"
echo
echo "🎯 Features:"
echo "  ✅ Live cryptocurrency data from CoinGecko API"
echo "  ✅ Beautiful React dashboard with Material-UI"
echo "  ✅ Automatic data updates every hour"
echo "  ✅ Manual refresh functionality"
echo "  ✅ Search and filtering capabilities"
echo "  ✅ Responsive design for all devices"
echo
echo "Press Ctrl+C to stop both servers..."

# Wait for user to stop
wait
