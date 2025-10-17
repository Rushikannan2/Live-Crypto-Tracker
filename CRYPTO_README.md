# Cryptocurrency Price Scraper - MERN Stack Application

A complete MERN stack cryptocurrency price scraper that automatically fetches live cryptocurrency data from CoinGecko API and displays it in a beautiful, responsive React dashboard. The application features automatic data updates via cron jobs, MongoDB Atlas integration, and a modern Material-UI interface.

## 🚀 Features

- **Real-time Cryptocurrency Data**: Automatically scrapes live crypto prices from CoinGecko API
- **MongoDB Atlas Integration**: Stores cryptocurrency data in cloud database
- **Modern React Dashboard**: Beautiful, responsive UI with Material-UI
- **Advanced Search & Filtering**: Search cryptocurrencies by name, symbol, and more
- **Pagination**: Efficient data loading with pagination support
- **Statistics Dashboard**: Real-time metrics and analytics
- **Automatic Updates**: Cron job-based data refresh every hour
- **Error Handling**: Comprehensive error handling and logging
- **Production Ready**: Optimized for deployment on Render/Vercel/Heroku

## 🛠️ Tech Stack

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB Atlas** - Cloud database
- **Mongoose** - MongoDB ODM
- **Axios** - HTTP client for API calls
- **Node-cron** - Task scheduler
- **CORS** - Cross-origin resource sharing
- **Helmet** - Security middleware

### Frontend
- **React 18** - UI library
- **Material-UI (MUI)** - Component library
- **React Router** - Client-side routing
- **Axios** - HTTP client
- **Date-fns** - Date manipulation

## 📁 Project Structure

```
webscraper_project/
├── server/                     # Backend application
│   ├── models/                # MongoDB models
│   │   └── Crypto.js          # Cryptocurrency schema
│   ├── routes/                # API routes
│   │   ├── crypto.js          # Crypto endpoints (with MongoDB)
│   │   └── crypto-demo.js     # Demo endpoints (without MongoDB)
│   ├── services/              # Business logic
│   │   ├── cryptoScraper.js   # Crypto scraping service
│   │   └── cryptoCronService.js # Cron job service
│   ├── config.js              # Configuration
│   ├── server.js              # Main server file (with MongoDB)
│   ├── crypto-demo-server.js  # Demo server (without MongoDB)
│   └── package.json           # Backend dependencies
├── client/                    # Frontend application
│   ├── src/
│   │   ├── components/        # React components
│   │   │   ├── Crypto/        # Crypto-specific components
│   │   │   ├── Layout/        # Layout components
│   │   │   └── Dashboard/     # Dashboard components
│   │   ├── hooks/             # Custom React hooks
│   │   ├── services/          # API services
│   │   ├── pages/             # Page components
│   │   ├── App.js             # Main app component
│   │   └── index.js           # Entry point
│   └── package.json           # Frontend dependencies
├── package.json               # Root package.json
└── CRYPTO_README.md           # This file
```

## 🚀 Quick Start

### Prerequisites

- **Node.js** (v16 or higher)
- **npm** or **yarn**
- **MongoDB Atlas** account (optional for demo mode)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd webscraper_project
   ```

2. **Install dependencies**
   ```bash
   # Install root dependencies
   npm install

   # Install backend dependencies
   cd server
   npm install

   # Install frontend dependencies
   cd ../client
   npm install
   ```

3. **Start the demo application (No MongoDB required)**
   ```bash
   # Terminal 1 - Backend (Demo Mode)
   cd server
   npm run crypto-demo

   # Terminal 2 - Frontend
   cd client
   npm start
   ```

4. **Access the application**
   - Frontend: `http://localhost:3000`
   - Backend API: `http://localhost:5000/api`
   - Health Check: `http://localhost:5000/health`

## 🌐 API Endpoints

### Cryptocurrency API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/crypto` | Get all cryptocurrencies with pagination |
| GET | `/api/crypto/top` | Get top cryptocurrencies by market cap |
| GET | `/api/crypto/latest` | Get latest cryptocurrency data |
| GET | `/api/crypto/symbol/:symbol` | Get crypto by symbol |
| GET | `/api/crypto/stats` | Get cryptocurrency statistics |
| GET | `/api/crypto/:id` | Get specific cryptocurrency |
| POST | `/api/crypto/scrape` | Trigger manual scraping |
| DELETE | `/api/crypto/:id` | Delete cryptocurrency (soft delete) |

### Query Parameters

- `page` - Page number (default: 1)
- `limit` - Items per page (default: 20)
- `search` - Search query
- `sortBy` - Sort field (rank, price, marketCap, change24h, volume24h, timestamp)
- `sortOrder` - Sort order (asc, desc)

### Example API Calls

```bash
# Get all cryptocurrencies
curl http://localhost:5000/api/crypto

# Search cryptocurrencies
curl "http://localhost:5000/api/crypto?search=bitcoin&limit=10"

# Get top cryptocurrencies
curl http://localhost:5000/api/crypto/top

# Get cryptocurrency statistics
curl http://localhost:5000/api/crypto/stats

# Trigger manual scraping
curl -X POST http://localhost:5000/api/crypto/scrape
```

## 📊 Database Schema

### Crypto Model

```javascript
{
  name: String,        // Cryptocurrency name (e.g., "Bitcoin")
  symbol: String,     // Symbol (e.g., "BTC")
  price: Number,      // Current price in USD
  marketCap: Number,  // Market capitalization
  change24h: Number,  // 24-hour price change percentage
  volume24h: Number,  // 24-hour trading volume
  rank: Number,       // Market cap rank
  image: String,      // Cryptocurrency image URL
  timestamp: Date,    // Last updated timestamp
  isActive: Boolean   // Soft delete flag
}
```

## 🔧 Configuration

### Backend Configuration (`server/config.js`)

```javascript
module.exports = {
  MONGODB_URI: 'mongodb+srv://...', // MongoDB Atlas connection
  PORT: 5000,                        // Server port
  TARGET_URL: 'https://api.coingecko.com/api/v3', // CoinGecko API
};
```

### Frontend Configuration

The frontend automatically connects to `http://localhost:5000` in development mode. For production, set the `REACT_APP_API_URL` environment variable.

## 🚀 Deployment

### Backend Deployment (Render/Heroku)

1. **Create a new web service**
2. **Set environment variables:**
   ```
   MONGODB_URI=mongodb+srv://...
   NODE_ENV=production
   PORT=5000
   ```
3. **Deploy from GitHub repository**

### Frontend Deployment (Vercel/Netlify)

1. **Build the frontend:**
   ```bash
   cd client
   npm run build
   ```
2. **Set environment variables:**
   ```
   REACT_APP_API_URL=https://your-backend-url.com/api
   ```
3. **Deploy the build folder**

## 🎯 Demo Mode vs Production Mode

### Demo Mode (No Database Required)
- Uses sample cryptocurrency data
- No MongoDB connection needed
- Perfect for testing and development
- Start with: `npm run crypto-demo`

### Production Mode (With MongoDB)
- Connects to MongoDB Atlas
- Real-time data scraping from CoinGecko API
- Automatic updates every hour
- Start with: `npm start`

## 🔍 Monitoring & Logging

### Health Check

```bash
curl http://localhost:5000/health
```

### Logs

The application logs all scraping activities, errors, and API requests. Check the console output for detailed logs.

### Statistics

Visit `/api/crypto/stats` to get real-time statistics about the scraping process.

## 🛠️ Development

### Adding New Cryptocurrency Sources

1. **Create a new scraper service:**
   ```javascript
   // server/services/newCryptoScraper.js
   class NewCryptoScraper {
     async scrapeData() {
       // Implementation
     }
   }
   ```

2. **Update the cron service to use the new scraper**

3. **Add new API endpoints if needed**

### Customizing the Frontend

1. **Add new components in `client/src/components/Crypto/`**
2. **Create new pages in `client/src/pages/`**
3. **Add new API services in `client/src/services/`**

## 🐛 Troubleshooting

### Common Issues

1. **MongoDB Connection Failed**
   - Use demo mode: `npm run crypto-demo`
   - Check your internet connection
   - Verify the MongoDB Atlas connection string

2. **Scraping Not Working**
   - Check if CoinGecko API is accessible
   - Verify the API endpoints in `cryptoScraper.js`
   - Check the console for error messages

3. **Frontend Not Loading Data**
   - Ensure the backend server is running
   - Check the browser console for errors
   - Verify the API endpoints are accessible

### Debug Mode

Enable debug logging by setting `NODE_ENV=development` in your environment variables.

## 📝 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📞 Support

For support and questions:
- Create an issue in the GitHub repository
- Check the troubleshooting section above
- Review the API documentation

## 🔄 Updates

The application automatically updates cryptocurrency data every hour. You can also trigger manual updates using the refresh button in the UI or the `/api/crypto/scrape` endpoint.

---

**Built with ❤️ using the MERN stack for cryptocurrency data scraping**
