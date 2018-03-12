'use strict';

var express = require('express');
var router = express.Router();
router.get('/:id', function (req, res) {
    res.send(req.params.id);
});
module.exports = router;