const express = require('express');
const cors = require('cors');

const app = express();

app.use(express.json());
app.use(cors());

app.set("view options", {layout: false});
app.use(express.static(__dirname + '/../public'));

app.use('/', require('./routes'));

app.listen(3000);