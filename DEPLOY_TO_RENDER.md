# 🚀 Deploy to Render - Complete Guide

## 📋 Prerequisites

1. **GitHub Account** - Your code must be in a GitHub repository
2. **Render Account** - Sign up at [render.com](https://render.com)
3. **MongoDB Atlas** - Already configured with your credentials

## 🎯 Step-by-Step Deployment

### Step 1: Prepare Your GitHub Repository

1. **Initialize Git** (if not already done):
   ```bash
   git init
   git add .
   git commit -m "Initial commit - Complete MERN Stack Cryptocurrency Scraper"
   ```

2. **Create GitHub Repository**:
   - Go to [github.com](https://github.com)
   - Click "New repository"
   - Name: `crypto-scraper-mern`
   - Make it public
   - Don't initialize with README (you already have files)

3. **Push to GitHub**:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/crypto-scraper-mern.git
   git branch -M main
   git push -u origin main
   ```

### Step 2: Deploy Backend to Render

1. **Go to Render Dashboard**:
   - Visit [render.com](https://render.com)
   - Sign in with your GitHub account

2. **Create New Web Service**:
   - Click "New +" → "Web Service"
   - Connect your GitHub repository
   - Select your repository: `crypto-scraper-mern`

3. **Configure Backend Settings**:
   ```
   Name: crypto-scraper-backend
   Environment: Node
   Region: Oregon (US West)
   Branch: main
   Root Directory: server
   Build Command: npm install
   Start Command: npm run real-crypto
   ```

4. **Set Environment Variables**:
   ```
   NODE_ENV = production
   MONGODB_URI = mongodb+srv://kannanrushi05_db_user:V9HCHCbKVRB14uEq@cluster0.p2iuqpr.mongodb.net/web?retryWrites=true&w=majority&appName=Cluster0
   PORT = 5000
   ```

5. **Deploy Backend**:
   - Click "Create Web Service"
   - Wait for deployment (5-10 minutes)
   - Note the backend URL: `https://crypto-scraper-backend.onrender.com`

### Step 3: Deploy Frontend to Render

1. **Create New Static Site**:
   - In Render dashboard, click "New +" → "Static Site"
   - Connect your GitHub repository
   - Select your repository: `crypto-scraper-mern`

2. **Configure Frontend Settings**:
   ```
   Name: crypto-scraper-frontend
   Environment: Static Site
   Region: Oregon (US West)
   Branch: main
   Root Directory: client
   Build Command: npm install && npm run build
   Publish Directory: build
   ```

3. **Set Environment Variables**:
   ```
   REACT_APP_API_URL = https://crypto-scraper-backend.onrender.com/api
   ```

4. **Deploy Frontend**:
   - Click "Create Static Site"
   - Wait for deployment (5-10 minutes)
   - Note the frontend URL: `https://crypto-scraper-frontend.onrender.com`

### Step 4: Update Backend CORS (Important!)

After getting your frontend URL, update the backend CORS:

1. **Go to Backend Service** in Render dashboard
2. **Go to Environment** tab
3. **Add new environment variable**:
   ```
   FRONTEND_URL = https://crypto-scraper-frontend.onrender.com
   ```

4. **Redeploy Backend**:
   - Go to "Manual Deploy" → "Deploy latest commit"

### Step 5: Test Your Deployment

1. **Test Backend**:
   ```bash
   curl https://crypto-scraper-backend.onrender.com/health
   ```

2. **Test Frontend**:
   - Open `https://crypto-scraper-frontend.onrender.com`
   - Verify the dashboard loads
   - Test search and filtering
   - Test refresh button

## 🔧 Configuration Files

### render.yaml (Optional - for advanced deployment)
```yaml
services:
  - type: web
    name: crypto-scraper-backend
    env: node
    buildCommand: cd server && npm install
    startCommand: cd server && npm run real-crypto
    envVars:
      - key: NODE_ENV
        value: production
      - key: MONGODB_URI
        value: mongodb+srv://kannanrushi05_db_user:V9HCHCbKVRB14uEq@cluster0.p2iuqpr.mongodb.net/web?retryWrites=true&w=majority&appName=Cluster0
      - key: PORT
        value: 5000
    healthCheckPath: /health

  - type: web
    name: crypto-scraper-frontend
    env: static
    buildCommand: cd client && npm install && npm run build
    staticPublishPath: client/build
    envVars:
      - key: REACT_APP_API_URL
        value: https://crypto-scraper-backend.onrender.com/api
```

## 🎯 Expected Results

### Backend Health Check
```json
{
  "status": "OK",
  "timestamp": "2025-10-17T06:47:41.374Z",
  "uptime": 7.6913988,
  "environment": "production",
  "database": "Connected",
  "api": "CoinGecko API Integration"
}
```

### Frontend Features
- ✅ Beautiful cryptocurrency dashboard
- ✅ Real-time data from CoinGecko API
- ✅ Search and filtering functionality
- ✅ Manual refresh button
- ✅ Responsive design
- ✅ Statistics dashboard

## 🐛 Troubleshooting

### Common Issues

1. **Backend Not Starting**:
   - Check build logs in Render dashboard
   - Verify environment variables
   - Check MongoDB connection

2. **Frontend Not Loading Data**:
   - Check CORS configuration
   - Verify REACT_APP_API_URL
   - Check browser console for errors

3. **MongoDB Connection Failed**:
   - Verify MongoDB Atlas IP whitelist
   - Check user permissions
   - Verify connection string

4. **Build Failures**:
   - Check Node.js version compatibility
   - Verify all dependencies
   - Check for syntax errors

### Debug Commands

```bash
# Check backend logs
# Go to Render dashboard → Your backend service → Logs

# Test API endpoints
curl https://crypto-scraper-backend.onrender.com/health
curl https://crypto-scraper-backend.onrender.com/api/crypto
curl -X POST https://crypto-scraper-backend.onrender.com/api/crypto/scrape
```

## 📊 Monitoring

### Health Monitoring
- **Backend Health**: `https://crypto-scraper-backend.onrender.com/health`
- **Frontend**: `https://crypto-scraper-frontend.onrender.com`
- **Render Dashboard**: Monitor both services

### Performance
- **Backend**: Monitor CPU, Memory, Response time
- **Frontend**: Monitor build time, bundle size
- **Database**: Monitor MongoDB Atlas metrics

## 🎉 Success!

After successful deployment, you'll have:

- ✅ **Live Backend**: `https://crypto-scraper-backend.onrender.com`
- ✅ **Live Frontend**: `https://crypto-scraper-frontend.onrender.com`
- ✅ **MongoDB Atlas**: Connected and storing data
- ✅ **CoinGecko API**: Fetching live cryptocurrency data
- ✅ **Cron Jobs**: Automatic updates every hour
- ✅ **Production Ready**: Scalable and secure

## 🔄 Updates

To update your deployed application:

1. **Make changes** to your code
2. **Commit and push** to GitHub:
   ```bash
   git add .
   git commit -m "Update: Your changes"
   git push origin main
   ```
3. **Render automatically deploys** the changes
4. **Monitor deployment** in Render dashboard

## 📝 Final Checklist

- [ ] GitHub repository created and code pushed
- [ ] Backend deployed on Render
- [ ] Frontend deployed on Render
- [ ] Environment variables set correctly
- [ ] CORS configured for frontend URL
- [ ] Health checks passing
- [ ] Frontend loading data from backend
- [ ] Search and filtering working
- [ ] Manual refresh working
- [ ] Responsive design verified

**Your complete MERN stack cryptocurrency scraper is now live on Render! 🚀**
