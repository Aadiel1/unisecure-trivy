const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Basic route
app.get('/', (req, res) => {
  res.send('Hello, Secure Docker World!');
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
