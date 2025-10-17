# Complete MERN Stack Cryptocurrency Price Scraper

A full-stack web application that fetches live cryptocurrency prices from the CoinGecko API, stores them in MongoDB Atlas, and displays them in a beautiful React dashboard with automatic updates via cron jobs.

## 🚀 Features

- **Real-time Cryptocurrency Data**: Fetches live crypto prices from CoinGecko API
- **MongoDB Atlas Integration**: Stores cryptocurrency data in cloud database
- **Automatic Updates**: Cron job fetches new data every hour
- **Modern React Dashboard**: Beautiful, responsive UI with Material-UI
- **Manual Refresh**: Trigger data fetching manually via API
- **Advanced Search & Filtering**: Search cryptocurrencies by name, symbol
- **Statistics Dashboard**: Real-time metrics and analytics
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
│   ├── production-server.js  # Production server
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
└── README.md                  # This file
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

### MongoDB Atlas Connection

The application is pre-configured with the provided MongoDB Atlas connection string:

```javascript
// server/config.js
MONGODB_URI: 'mongodb+srv://kannanrushi05_db_user:V9HCHCbKVRB14uEq@cluster0.p2iuqpr.mongodb.net/web?retryWrites=true&w=majority&appName=Cluster0'
```

### Backend Configuration

```javascript
module.exports = {
  MONGODB_URI: 'mongodb+srv://...', // MongoDB Atlas connection
  PORT: 5000,                        // Server port
  TARGET_URL: 'https://api.coingecko.com/api/v3', // CoinGecko API
};
```

### Frontend Configuration

The frontend automatically connects to `http://localhost:5000` in development mode. For production, set the `REACT_APP_API_URL` environment variable.

## 🎯 Running Modes

### Demo Mode (No Database Required)
- Uses sample cryptocurrency data
- No MongoDB connection needed
- Perfect for testing and development
- Start with: `npm run crypto-demo`

### Production Mode (With MongoDB)
- Connects to MongoDB Atlas
- Real-time data scraping from CoinGecko API
- Automatic updates every hour
- Start with: `npm run production`

## 🚀 Deployment

### Backend Deployment (Render/Heroku)

1. **Create a new web service**
2. **Set environment variables:**
   ```
   MONGODB_URI=mongodb+srv://kannanrushi05_db_user:V9HCHCbKVRB14uEq@cluster0.p2iuqpr.mongodb.net/web?retryWrites=true&w=majority&appName=Cluster0
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

## 🎯 Sample Data

The demo mode includes 10 sample cryptocurrencies:

1. **Bitcoin (BTC)** - $43,250.50 (+2.45%)
2. **Ethereum (ETH)** - $2,650.75 (-1.25%)
3. **Binance Coin (BNB)** - $315.80 (+0.85%)
4. **Cardano (ADA)** - $0.485 (+3.20%)
5. **Solana (SOL)** - $98.45 (-2.15%)
6. **XRP** - $0.625 (+1.85%)
7. **Polkadot (DOT)** - $7.25 (-0.95%)
8. **Dogecoin (DOGE)** - $0.085 (+5.75%)
9. **Avalanche (AVAX)** - $35.20 (+2.10%)
10. **Chainlink (LINK)** - $14.85 (-1.45%)

---

**Built with ❤️ using the MERN stack for cryptocurrency data scraping**