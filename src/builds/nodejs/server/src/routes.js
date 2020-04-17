const express = require('express');
const routes = express.Router();

routes.get('/', (req, res) => {
    res.render('index.html');
});

routes.get('/app', (req, res) => {
    res.send('GET request to the APP');
});

routes.get('/api', (req, res) => {
    res.send('GET request to the API');
});

module.exports = routes;