#!/bin/bash

echo "🚀 Deploying Complete MERN Stack Cryptocurrency Scraper to Render"
echo "=================================================================="

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing Git repository..."
    git init
    git add .
    git commit -m "Initial commit - Complete MERN Stack Cryptocurrency Scraper"
    echo "✅ Git repository initialized"
else
    echo "✅ Git repository already exists"
fi

# Check if remote origin exists
if ! git remote get-url origin > /dev/null 2>&1; then
    echo ""
    echo "🔗 Please set up your GitHub repository:"
    echo "1. Go to https://github.com and create a new repository"
    echo "2. Copy the repository URL"
    echo "3. Run: git remote add origin YOUR_REPOSITORY_URL"
    echo "4. Run: git push -u origin main"
    echo ""
    echo "📝 Repository name suggestion: crypto-scraper-mern"
    echo ""
else
    echo "✅ Remote origin already configured"
    echo "🔄 Pushing latest changes..."
    git add .
    git commit -m "Update: Ready for Render deployment"
    git push origin main
    echo "✅ Changes pushed to GitHub"
fi

echo ""
echo "🎯 Next Steps for Render Deployment:"
echo "===================================="
echo ""
echo "1. 🌐 Go to https://render.com and sign in"
echo "2. 📱 Connect your GitHub account"
echo "3. 🔧 Create two services:"
echo ""
echo "   📊 BACKEND SERVICE:"
echo "   - Type: Web Service"
echo "   - Name: crypto-scraper-backend"
echo "   - Environment: Node"
echo "   - Root Directory: server"
echo "   - Build Command: npm install"
echo "   - Start Command: npm run real-crypto"
echo "   - Environment Variables:"
echo "     NODE_ENV = production"
echo "     MONGODB_URI = mongodb+srv://kannanrushi05_db_user:V9HCHCbKVRB14uEq@cluster0.p2iuqpr.mongodb.net/web?retryWrites=true&w=majority&appName=Cluster0"
echo "     PORT = 5000"
echo ""
echo "   🎨 FRONTEND SERVICE:"
echo "   - Type: Static Site"
echo "   - Name: crypto-scraper-frontend"
echo "   - Root Directory: client"
echo "   - Build Command: npm install && npm run build"
echo "   - Publish Directory: build"
echo "   - Environment Variables:"
echo "     REACT_APP_API_URL = https://crypto-scraper-backend.onrender.com/api"
echo ""
echo "4. ⏳ Wait for deployment (5-10 minutes)"
echo "5. 🎉 Your app will be live!"
echo ""
echo "📖 For detailed instructions, see DEPLOY_TO_RENDER.md"
echo ""
echo "✅ Deployment preparation complete!"
