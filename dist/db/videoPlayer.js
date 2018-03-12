'use strict';

Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.videoPlayer = undefined;

var _toConsumableArray2 = require('babel-runtime/helpers/toConsumableArray');

var _toConsumableArray3 = _interopRequireDefault(_toConsumableArray2);

var _typeof2 = require('babel-runtime/helpers/typeof');

var _typeof3 = _interopRequireDefault(_typeof2);

var _promise = require('babel-runtime/core-js/promise');

var _promise2 = _interopRequireDefault(_promise);

var _classCallCheck2 = require('babel-runtime/helpers/classCallCheck');

var _classCallCheck3 = _interopRequireDefault(_classCallCheck2);

var _dbquery = require('./dbquery');

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var _ = require('lodash');

var videoPlayer = exports.videoPlayer = function videoPlayer(config) {
    (0, _classCallCheck3.default)(this, videoPlayer);

    this.dbQuery = new _dbquery.dbquery(config.host, config.user, config.password, config.database);
};

videoPlayer.prototype.allVideos = function () {
    var _this = this;

    return new _promise2.default(function (resolve, reject) {
        _this.dbQuery.$selectAll('videos').then(function (promiseRes) {
            resolve(promiseRes);
        });
    });
};
videoPlayer.prototype.allCategories = function () {
    var _this2 = this;

    return new _promise2.default(function (resolve, reject) {
        _this2.dbQuery.$selectAll('category').then(function (promiseRes) {
            resolve(promiseRes);
        });
    });
};
videoPlayer.prototype.defaultVideo = function () {
    var _this3 = this;

    return new _promise2.default(function (resolve, reject) {
        _this3.dbQuery.$selectOne('category', 'categoryId', 'LIMIT 1').then(function (promiseRes) {
            var category = promiseRes[0].categoryId;
            category = parseInt(category);
            _this3.dbQuery.$selectAll('videos', 'WHERE JSON_CONTAINS(category,\'[' + category + ']\') LIMIT 1').then(function (promiseRes) {
                resolve(promiseRes[0]);
            });
        });
    });
};
videoPlayer.prototype.categoryDefaultVideo = function (id) {
    var _this4 = this;

    return new _promise2.default(function (resolve, reject) {
        id = parseInt(id);
        _this4.dbQuery.$selectAll('videos', 'WHERE JSON_CONTAINS(category,\'[' + id + ']\') LIMIT 1').then(function (promiseRes) {
            resolve(promiseRes);
        });
    });
};
videoPlayer.prototype.defaultCategory = function () {
    var _this5 = this;

    return new _promise2.default(function (resolve, reject) {
        _this5.dbQuery.$selectOne('category', 'categoryId', 'LIMIT 1').then(function (promiseRes) {
            var defaultCategoryId = promiseRes[0].categoryId;
            defaultCategoryId = parseInt(defaultCategoryId);
            _this5.dbQuery.$selectAll('videos', 'WHERE JSON_CONTAINS(category,\'[' + defaultCategoryId + ']\')').then(function (promiseRes) {
                resolve(promiseRes);
            });
        });
    });
};
videoPlayer.prototype.oneVideo = function (id) {
    var _this6 = this;

    return new _promise2.default(function (resolve, reject) {
        _this6.dbQuery.$selectAll('videos', 'WHERE videoId = ' + id).then(function (promiseRes) {
            resolve(promiseRes[0]);
        });
    });
};
videoPlayer.prototype.oneCategory = function (name) {
    var _this7 = this;

    return new _promise2.default(function (resolve, reject) {
        _this7.dbQuery.$selectOne('category\',\'categoryId\',\'WHERE name = ' + name + ' ').then(function (promiseRes) {
            var defaultCategoryId = promiseRes[0].categoryId;
            _this7.dbQuery.$selectAll('videos', 'WHERE JSON_CONTAINS(category,\'["' + defaultCategoryId + '"]\') ').then(function (promiseRes) {
                resolve(promiseRes);
            });
        });
    });
};
videoPlayer.prototype.categoryVideos = function (id) {
    var _this8 = this;

    return new _promise2.default(function (resolve, reject) {
        var retunRes = [];
        var count = 0;
        if (id.indexOf(',') > -1) {
            id = id.substr(1);
            id = id.slice(0, -1);
            id = id.split(',');
        }
        if ((typeof id === 'undefined' ? 'undefined' : (0, _typeof3.default)(id)) == 'object') {
            id.forEach(function (element) {
                element = parseInt(element);
                _this8.dbQuery.$selectAll('videos', 'WHERE JSON_CONTAINS(category,\'[' + element + ']\')').then(function (promiseRes) {
                    count++;
                    if (count == id.length - 1) {
                        retunRes = _.uniqBy(retunRes, 'videoId');
                        retunRes = _.uniqBy(retunRes, 'videoId');
                        resolve(retunRes);
                    } else {
                        var _retunRes;

                        (_retunRes = retunRes).push.apply(_retunRes, (0, _toConsumableArray3.default)(promiseRes));
                    }
                });
            });
        } else {
            id = parseInt(id);
            _this8.dbQuery.$selectAll('videos', 'WHERE JSON_CONTAINS(category,\'[' + id + ']\')').then(function (promiseRes) {
                resolve(promiseRes);
            });
        }
    });
};
videoPlayer.prototype.kidsVideos = function () {
    var _this9 = this;

    return new _promise2.default(function (resolve, reject) {
        _this9.oneCategory('kids').then(function (promiseRes) {
            resolve(promiseRes);
        });
    });
};
videoPlayer.prototype.adultVideos = function () {
    var _this10 = this;

    return new _promise2.default(function (resolve, reject) {
        _this10.oneCategory('adult').then(function (promiseRes) {
            resolve(promiseRes);
        });
    });
};
videoPlayer.prototype.initView = function () {
    var _this11 = this;

    var initView = {};
    return new _promise2.default(function (resolve, reject) {
        _this11.defaultVideo().then(function (promiseRes) {
            initView['defaultVideo'] = promiseRes;
            _this11.defaultCategory().then(function (promiseRes) {
                initView['defaultCategory'] = promiseRes;
                _this11.allCategories().then(function (promiseRes) {
                    initView['categories'] = promiseRes;
                    resolve(initView);
                });
            });
        });
    });
};