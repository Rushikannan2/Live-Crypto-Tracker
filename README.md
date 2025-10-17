# Web Scraper - MERN Stack Application

A complete MERN stack web scraping application that automatically scrapes news articles from Hacker News and displays them in a modern, responsive React frontend. The application features automatic data updates via cron jobs, MongoDB Atlas integration, and a beautiful Material-UI interface.

## 🚀 Features

- **Real-time Web Scraping**: Automatically scrapes Hacker News every 30 minutes
- **MongoDB Atlas Integration**: Stores scraped data in cloud database
- **Modern React Frontend**: Beautiful, responsive UI with Material-UI
- **Advanced Search & Filtering**: Search articles by title, author, and more
- **Pagination**: Efficient data loading with pagination support
- **Statistics Dashboard**: Real-time metrics and analytics
- **Automatic Updates**: Cron job-based data refresh
- **Error Handling**: Comprehensive error handling and logging
- **Production Ready**: Optimized for deployment on Render/Vercel/Heroku

## 🛠️ Tech Stack

### Backend
- **Node.js** - Runtime environment
- **Express.js** - Web framework
- **MongoDB Atlas** - Cloud database
- **Mongoose** - MongoDB ODM
- **Axios** - HTTP client for scraping
- **Cheerio** - Server-side jQuery for HTML parsing
- **Node-cron** - Task scheduler
- **CORS** - Cross-origin resource sharing
- **Helmet** - Security middleware

### Frontend
- **React 18** - UI library
- **Material-UI (MUI)** - Component library
- **React Router** - Client-side routing
- **Axios** - HTTP client
- **Date-fns** - Date manipulation
- **React Query** - Data fetching and caching

## 📁 Project Structure

```
webscraper_project/
├── server/                 # Backend application
│   ├── models/            # MongoDB models
│   │   └── Article.js     # Article schema
│   ├── routes/            # API routes
│   │   └── articles.js    # Article endpoints
│   ├── services/          # Business logic
│   │   ├── scraper.js     # Web scraping service
│   │   └── cronService.js # Cron job service
│   ├── config.js          # Configuration
│   ├── server.js          # Main server file
│   └── package.json       # Backend dependencies
├── client/                # Frontend application
│   ├── public/            # Static files
│   ├── src/
│   │   ├── components/    # React components
│   │   │   ├── Layout/    # Layout components
│   │   │   ├── Articles/  # Article components
│   │   │   └── Dashboard/ # Dashboard components
│   │   ├── hooks/         # Custom React hooks
│   │   ├── services/      # API services
│   │   ├── pages/         # Page components
│   │   ├── App.js         # Main app component
│   │   └── index.js       # Entry point
│   └── package.json       # Frontend dependencies
├── package.json           # Root package.json
└── README.md              # This file
```

## 🚀 Quick Start

### Prerequisites

- **Node.js** (v16 or higher)
- **npm** or **yarn**
- **MongoDB Atlas** account (free tier available)

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

3. **Configure MongoDB Atlas**
   - The application is pre-configured with the provided MongoDB Atlas connection string
   - No additional configuration needed for the database

4. **Start the development servers**
   ```bash
   # From the root directory
   npm run dev
   ```

   This will start both the backend server (port 5000) and frontend development server (port 3000).

### Manual Setup

If you prefer to run servers separately:

```bash
# Terminal 1 - Backend
cd server
npm run dev

# Terminal 2 - Frontend
cd client
npm start
```

## 🌐 API Endpoints

### Articles API

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/articles` | Get all articles with pagination |
| GET | `/api/articles/recent` | Get recent articles |
| GET | `/api/articles/top` | Get top articles by score |
| GET | `/api/articles/stats` | Get scraping statistics |
| GET | `/api/articles/:id` | Get specific article |
| POST | `/api/articles/scrape` | Trigger manual scraping |
| DELETE | `/api/articles/:id` | Delete article (soft delete) |

### Query Parameters

- `page` - Page number (default: 1)
- `limit` - Items per page (default: 20)
- `search` - Search query
- `sortBy` - Sort field (scrapedAt, score, comments, title)
- `sortOrder` - Sort order (asc, desc)

### Example API Calls

```bash
# Get all articles
curl http://localhost:5000/api/articles

# Search articles
curl "http://localhost:5000/api/articles?search=javascript&limit=10"

# Get recent articles
curl http://localhost:5000/api/articles/recent

# Trigger manual scraping
curl -X POST http://localhost:5000/api/articles/scrape
```

## 🔧 Configuration

### Backend Configuration (`server/config.js`)

```javascript
module.exports = {
  MONGODB_URI: 'mongodb+srv://...', // MongoDB Atlas connection
  PORT: 5000,                        // Server port
  SCRAPE_INTERVAL_MINUTES: 30,      // Cron job interval
  TARGET_URL: 'https://news.ycombinator.com', // Scraping target
};
```

### Frontend Configuration

The frontend automatically connects to `http://localhost:5000` in development mode. For production, set the `REACT_APP_API_URL` environment variable.

## 📊 Database Schema

### Article Model

```javascript
{
  title: String,        // Article title
  link: String,         // Article URL
  score: Number,        // Hacker News score
  comments: Number,     // Number of comments
  author: String,       // Article author
  scrapedAt: Date,     // When scraped
  publishedAt: Date,   // When published
  isActive: Boolean    // Soft delete flag
}
```

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

### Docker Deployment

```dockerfile
# Dockerfile for backend
FROM node:16-alpine
WORKDIR /app
COPY server/package*.json ./
RUN npm install
COPY server/ .
EXPOSE 5000
CMD ["npm", "start"]
```

## 🔍 Monitoring & Logging

### Health Check

```bash
curl http://localhost:5000/health
```

### Logs

The application logs all scraping activities, errors, and API requests. Check the console output for detailed logs.

### Statistics

Visit `/api/articles/stats` to get real-time statistics about the scraping process.

## 🛠️ Development

### Adding New Scraping Sources

1. **Create a new scraper service:**
   ```javascript
   // server/services/newScraper.js
   class NewScraper {
     async scrapeData() {
       // Implementation
     }
   }
   ```

2. **Update the cron service to use the new scraper**

3. **Add new API endpoints if needed**

### Customizing the Frontend

1. **Add new components in `client/src/components/`**
2. **Create new pages in `client/src/pages/`**
3. **Add new API services in `client/src/services/`**

## 🐛 Troubleshooting

### Common Issues

1. **MongoDB Connection Failed**
   - Check your internet connection
   - Verify the MongoDB Atlas connection string
   - Ensure your IP is whitelisted in MongoDB Atlas

2. **Scraping Not Working**
   - Check if the target website is accessible
   - Verify the scraping selectors in `scraper.js`
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

The application automatically updates every 30 minutes. You can also trigger manual updates using the refresh button in the UI or the `/api/articles/scrape` endpoint.

---

**Built with ❤️ using the MERN stack**
