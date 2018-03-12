'use strict';

var _app = require('../app');

var _ = require('lodash');
var express = require('express');
var router = express.Router();
router.get('/', function (req, res, next) {
    _app.vp.allVideos().then(function (promiseRes) {
        // res.json(promiseRes);
        res.render('browse', {
            views: promiseRes,
            heading: 'videos'
        });
    });
});
router.get('/:id', function (req, res, next) {
    //db query to get specifi video with id
    var videoId = req.params.id;
    var response = {};
    _app.vp.oneVideo(videoId).then(function (promiseRes) {
        var categoryId = promiseRes.category;
        response['videoPlay'] = promiseRes;
        _app.vp.categoryVideos(categoryId).then(function (promiseRes) {
            response['categoryVideos'] = promiseRes;
            _app.vp.allCategories().then(function (promiseRes) {
                response['categories'] = promiseRes;
                _app.vp.allVideos().then(function (allVideos) {
                    response['topVideos'] = allVideos;
                    response.topVideos.splice(4);
                    response.categoryVideos = _.uniqBy(response.categoryVideos, 'videoId');
                    response.categoryVideos.splice(10);
                    res.render('index', {
                        videoPlay: response.videoPlay,
                        videos: response.categoryVideos,
                        topVideos: response.topVideos,
                        categories: response.categories
                    });
                });
            });
        });
    });
});
module.exports = router;