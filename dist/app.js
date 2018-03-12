'use strict';

Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.vp = undefined;

var _dbquery = require('./db/dbquery');

var _videoPlayer = require('./db/videoPlayer');

var express = require('express');
var app = express();
var jsonParser = require('body-parser').json;
var logger = require('morgan');
var _ = require('lodash');

var dbConfig = require('./db.config');
var vp = exports.vp = new _videoPlayer.videoPlayer(dbConfig);
var vidRoutes = require('./routes/videoRoute');
var catRoutes = require('./routes/categoryRoute');
var adultRoutes = require('./routes/adultRoute');
var kidsRoutes = require('./routes/kidsRoute');
var movieStream = require('./routes/movieStream');
var uploadRoute = require('./routes/uploadRoute');
app.use('/movies', movieStream);
app.use(express.static('public'));
app.use(logger('dev'));
app.use(jsonParser());
app.set('view engine', 'ejs');
app.use('/videos', vidRoutes);
app.use('/categories', catRoutes);
// app.use('/kids',kidsRoutes);
// app.use('/adult',adultRoutes);
app.get('/', function (req, res) {
    //db query of default categories and category list
    //and send the data to ejs for formatting
    vp.initView().then(function (promiseRes) {
        var defaultVideo = promiseRes.defaultVideo;
        var defaultCategory = promiseRes.defaultCategory;
        var categories = promiseRes.categories;
        defaultCategory = _.uniqBy(defaultCategory, 'videoId');
        defaultCategory.splice(10);
        // res.json(defaultCategory);
        res.render('index', {
            videoPlay: defaultVideo,
            videos: defaultCategory.splice(4),
            topVideos: defaultCategory,
            categories: categories

        });
    });
});
app.use(function (req, res, next) {
    var err = new Error("not found");
    err.status = 404;
    next(err);
});
app.use(function (err, req, res, next) {
    res.status(err.status || 500);
    res.send(err);
});
app.listen(process.env.PORT || 8080, function () {
    console.log('server started......');
});