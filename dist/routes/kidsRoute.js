'use strict';

var express = require('express');
var router = express.Router();
router.get('/', function (req, res) {
    res.send("kids root");
});
router.get('/:id', function (req, res) {
    res.send("kids with id");
});
module.exports = router;