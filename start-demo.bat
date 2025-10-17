@echo off
echo 🚀 Starting Web Scraper Demo Application...
echo.

echo 📦 Starting Backend Server (Demo Mode)...
start "Backend Server" cmd /k "cd server && npm run demo"

echo ⏳ Waiting for backend to start...
timeout /t 5 /nobreak > nul

echo 📦 Starting Frontend Application...
start "Frontend App" cmd /k "cd client && npm start"

echo.
echo 🎉 Demo Application Started!
echo.
echo 📱 Frontend: http://localhost:3000
echo 🔗 Backend API: http://localhost:5000
echo 📊 Health Check: http://localhost:5000/health
echo.
echo Press any key to exit...
pause > nul
