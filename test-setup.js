// Simple test script to verify the setup
const axios = require('axios');

async function testSetup() {
  console.log('🧪 Testing Web Scraper Setup...\n');

  try {
    // Test 1: Check if server is running
    console.log('1. Testing server health...');
    const healthResponse = await axios.get('http://localhost:5000/health', { timeout: 5000 });
    console.log('✅ Server is running');
    console.log('   Status:', healthResponse.data.status);
    console.log('   Uptime:', healthResponse.data.uptime, 'seconds');
    console.log('   Environment:', healthResponse.data.environment);

    // Test 2: Test articles API
    console.log('\n2. Testing articles API...');
    const articlesResponse = await axios.get('http://localhost:5000/api/articles?limit=5');
    console.log('✅ Articles API is working');
    console.log('   Found', articlesResponse.data.data.length, 'articles');
    console.log('   Total articles:', articlesResponse.data.pagination.totalItems);

    // Test 3: Test scraping functionality
    console.log('\n3. Testing manual scraping...');
    const scrapeResponse = await axios.post('http://localhost:5000/api/articles/scrape');
    console.log('✅ Scraping functionality is working');
    console.log('   Scraping result:', scrapeResponse.data.message);

    // Test 4: Test statistics
    console.log('\n4. Testing statistics API...');
    const statsResponse = await axios.get('http://localhost:5000/api/articles/stats');
    console.log('✅ Statistics API is working');
    console.log('   Total articles:', statsResponse.data.data.totalArticles);
    console.log('   Today articles:', statsResponse.data.data.todayArticles);

    console.log('\n🎉 All tests passed! The application is working correctly.');
    console.log('\n📝 Next steps:');
    console.log('   1. Start the frontend: cd client && npm start');
    console.log('   2. Open http://localhost:3000 in your browser');
    console.log('   3. The application will automatically scrape data every 30 minutes');

  } catch (error) {
    console.error('❌ Test failed:', error.message);
    
    if (error.code === 'ECONNREFUSED') {
      console.log('\n💡 The server is not running. Please start it with:');
      console.log('   cd server && npm start');
    } else if (error.response) {
      console.log('   Status:', error.response.status);
      console.log('   Response:', error.response.data);
    }
  }
}

testSetup();
