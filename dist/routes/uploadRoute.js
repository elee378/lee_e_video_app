'use strict';

var _app = require('../app');

var express = require('express');
var router = express.Router();
router.get('/', function (req, res, next) {
    res.render('upload', {});
});
router.post('/', function (req, res, next) {
    console.log("upload");
    next();
});
module.exports = router;