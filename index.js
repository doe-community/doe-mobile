const express = require('express');
require('dotenv');

const app = express();

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => `Server started at ${PORT}`)