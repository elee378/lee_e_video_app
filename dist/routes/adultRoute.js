'use strict';

var express = require('express');
var router = express.Router();
router.get('/', function (req, res) {
    res.send("adult root");
});
router.get('/:id', function (req, res) {
    res.send("adult with id");
});
module.exports = router;