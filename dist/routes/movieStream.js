'use strict';

var _app = require('../app');

var _stream = require('stream');

var express = require('express');
var router = express.Router();
var fs = require('fs');
router.get('/:id', function (req, res, next) {
    var moviePath = './movie/' + req.params.id + '.mp4';
    fs.stat(moviePath, function (err, stat) {
        if (err) {
            next(err);
        } else {
            var range = req.headers.range;
            if (!range) {
                err = new Error('Not in range');
                next(err);
            }
            var positions = range.replace(/bytes=/, "").split("-");
            var start = parseInt(positions[0], 10);
            var total = stat.size;
            var end = positions[1] ? parseInt(positions[1], 10) : total - 1;
            var chunksize = end - start + 1;
            try {
                var movies = fs.createReadStream(moviePath, { start: start, end: end });
                res.writeHead(206, {
                    "Content-Range": "bytes " + start + "-" + end + "/" + total,
                    "Accept-Ranges": "bytes",
                    "Content-Length": chunksize,
                    "Content-Type": "video/mp4"
                });;
                movies.on('open', function () {
                    console.log("open");
                    movies.pipe(res);
                }).on('error', function (err) {
                    console.log("error");
                    res.end(err);
                    next();
                });
            } catch (error) {
                next();
            }
        }
    });
});
// router.get('/:id/:name?',function(req,res){

// });
module.exports = router;