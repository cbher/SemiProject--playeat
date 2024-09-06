const express = require('express');
const axios = require('axios');
const cors = require('cors'); // Import CORS middleware

const app = express();
const PORT = 3000; // Use the port number you prefer

app.use(cors()); // Enable CORS for all routes

// Proxy endpoint for geocoding
app.get('/proxy/geocode', async (req, res) => {
  try {
    const address = req.query.address;
    const response = await axios.get('https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode', {
      params: { query: address },
      headers: {
        'X-NCP-APIGW-API-KEY-ID': 'lm9hxz6gtq', // Replace with your actual client ID
        'X-NCP-APIGW-API-KEY': 'SvlPlgdU8fDQyttkl2C0MUBgygvMB3wMsQEqAjWU' // Replace with your actual client secret
      }
    });
    res.json(response.data);
  } catch (error) {
    console.error('Error fetching coordinates:', error.message);
    res.status(500).send('Error fetching coordinates');
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});