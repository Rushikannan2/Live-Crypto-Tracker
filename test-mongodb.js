// Test MongoDB connection
const mongoose = require('mongoose');

async function testMongoDB() {
  console.log('🧪 Testing MongoDB Connection...\n');
  
  const connectionString = 'mongodb+srv://kannanrushi05_db_user:V9HCHCbKVRB14uEq@cluster0.p2iuqpr.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';
  
  try {
    console.log('Connecting to MongoDB Atlas...');
    console.log('Connection string:', connectionString.replace(/\/\/.*@/, '//***:***@'));
    
    await mongoose.connect(connectionString);
    console.log('✅ MongoDB Atlas connected successfully!');
    
    // Test a simple operation
    const collections = await mongoose.connection.db.listCollections().toArray();
    console.log('📊 Available collections:', collections.length);
    
    await mongoose.disconnect();
    console.log('✅ Connection closed successfully');
    
  } catch (error) {
    console.error('❌ MongoDB connection failed:', error.message);
    console.log('\n💡 Troubleshooting tips:');
    console.log('1. Check if your IP address is whitelisted in MongoDB Atlas');
    console.log('2. Verify the username and password are correct');
    console.log('3. Ensure the cluster is running');
    console.log('4. Check if the database user has the correct permissions');
  }
}

testMongoDB();
