'use strict';

var _app = require('../app');

var express = require('express');
var router = express.Router();
router.get('/', function (req, res, next) {
    _app.vp.allCategories().then(function (promiseRes) {
        console.log(promiseRes);
        // res.json(promiseRes);
        res.render('browse', {
            views: promiseRes,
            heading: 'categories',
            test: false
        });
    });
});
router.get('/:id/:name?', function (req, res, next) {
    var categoryId = req.params.id;
    var catName = req.params.name || 'Category';
    var response = {};
    _app.vp.categoryDefaultVideo(categoryId).then(function (promiseRes) {
        response['videoPlay'] = promiseRes;
        _app.vp.categoryVideos(categoryId).then(function (promiseRes) {
            response['categoryVideos'] = promiseRes;
            _app.vp.allCategories().then(function (promiseRes) {
                response['categories'] = promiseRes;
                res.render('browse', {
                    heading: catName,
                    test: true,
                    views: response.categoryVideos
                });
                // res.render('index',{
                //     videoPlay:response.videoPlay,
                //     videos:response.categoryVideos,
                //     topVideos:response.categoryVideos,
                //     categories:response.categories
                // });
            });
        });
    });
});
module.exports = router;