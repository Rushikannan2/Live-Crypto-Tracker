@echo off
echo 🚀 Starting Complete MERN Stack Cryptocurrency Scraper...
echo.

echo 📦 Starting Backend Server (Demo Mode)...
start "Crypto Backend Server" cmd /k "cd server && npm run crypto-demo"

echo ⏳ Waiting for backend to start...
timeout /t 5 /nobreak > nul

echo 📦 Starting Frontend Application...
start "Crypto Frontend App" cmd /k "cd client && npm start"

echo.
echo 🎉 Cryptocurrency Scraper Application Started!
echo.
echo 📱 Frontend: http://localhost:3000
echo 🔗 Backend API: http://localhost:5000
echo 📊 Health Check: http://localhost:5000/health
echo.
echo 🎯 Features:
echo   ✅ Live cryptocurrency data from CoinGecko API
echo   ✅ Beautiful React dashboard with Material-UI
echo   ✅ Automatic data updates every hour
echo   ✅ Manual refresh functionality
echo   ✅ Search and filtering capabilities
echo   ✅ Responsive design for all devices
echo.
echo Press any key to exit...
pause > nul
