'use strict';

Object.defineProperty(exports, "__esModule", {
    value: true
});
exports.dbquery = undefined;

var _typeof2 = require('babel-runtime/helpers/typeof');

var _typeof3 = _interopRequireDefault(_typeof2);

var _values = require('babel-runtime/core-js/object/values');

var _values2 = _interopRequireDefault(_values);

var _keys = require('babel-runtime/core-js/object/keys');

var _keys2 = _interopRequireDefault(_keys);

var _promise = require('babel-runtime/core-js/promise');

var _promise2 = _interopRequireDefault(_promise);

var _classCallCheck2 = require('babel-runtime/helpers/classCallCheck');

var _classCallCheck3 = _interopRequireDefault(_classCallCheck2);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

var mysql = require('mysql');

var dbquery = exports.dbquery = function dbquery(host, user, password, db) {
    (0, _classCallCheck3.default)(this, dbquery);

    this.$conn = mysql.createConnection({
        host: host,
        user: user,
        password: password,
        database: db
    });
    this.$conn.connect(function (err) {
        if (err) throw err;
    });
};

dbquery.prototype.$query = function (userQuery) {
    var _this = this;

    return new _promise2.default(function (resolve, reject) {
        _this.$conn.query(userQuery, function (err, result, fields) {
            if (err) throw err;
            resolve(result);
        });
    });
};
dbquery.prototype.$selectAll = function (table) {
    var _this2 = this;

    var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : '';

    return new _promise2.default(function (resolve, reject) {
        var query = 'SELECT * FROM ' + table + ' ' + options;
        _this2.$query(query).then(function (promiseRes) {
            resolve(promiseRes);
        });
    });
};
dbquery.prototype.$selectOne = function (table, fields) {
    var _this3 = this;

    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : '';

    return new _promise2.default(function (resolve, reject) {
        var query = 'SELECT ' + fields + ' FROM ' + table + ' ' + options;
        _this3.$query(query).then(function (promiseRes) {
            resolve(promiseRes);
        });
    });
};
dbquery.prototype.$insert = function (table, data) {
    var _this4 = this;

    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;

    return new _promise2.default(function (resolve, reject) {
        var keys = (0, _keys2.default)(data);
        var values = (0, _values2.default)(data);
        values = values.map(function (element) {
            console.log(typeof element === 'undefined' ? 'undefined' : (0, _typeof3.default)(element));
            if ((typeof element === 'undefined' ? 'undefined' : (0, _typeof3.default)(element)) == 'object') {
                console.log(element);
                element = 'JSON_ARRAY(' + element + ')';
            } else {
                element = _this4.$conn.escape(element);
            }
            return '' + element;
        }).join(",");
        // values.replace(/\'/,"\'");
        // values=this.$conn.escape(values);
        var query = 'INSERT INTO ' + table + ' (' + keys + ') VALUES(' + values + ')';
        _this4.$query(query).then(function (promiseRes) {
            promiseRes = _this4.$message(promiseRes);
            resolve(promiseRes);
        });
    });
};
dbquery.prototype.$delete = function (table, data) {
    var _this5 = this;

    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;

    return new _promise2.default(function (resolve, reject) {
        var keys = (0, _keys2.default)(data);
        var values = (0, _values2.default)(data);
        values = values.map(function (element) {
            return '\'' + element + '\'';
        }).join(",");
        values.replace(/\'/, "\'");
        var query = 'INSERT INTO ' + table + ' (' + keys + ') VALUES(' + values + ')';
        console.log(query);
        _this5.$query(query).then(function (promiseRes) {
            promiseRes = _this5.$message(promiseRes);
            resolve(promiseRes);
        });
    });
};
dbquery.prototype.$update = function (table, data) {
    var _this6 = this;

    var options = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;

    return new _promise2.default(function (resolve, reject) {
        var keyValue = '';
        for (var key in data) {
            if (data.hasOwnProperty(key)) {
                var escapedValue = _this6.$conn.escape(data[key]);
                keyValue += key + ' = ' + escapedValue + ',';
            }
        }
        keyValue = keyValue.slice(0, -1);
        var query = 'UPDATE ' + table + ' SET ' + keyValue;
        console.log("update", query);
        _this6.$query(query).then(function (promiseRes) {
            promiseRes = _this6.$message(promiseRes);
            resolve(promiseRes);
        });
    });
};
dbquery.prototype.$message = function (result) {
    if (result.affectedRows > 0) {
        var returnVal = {};
        if (result.insertId) {
            returnVal['insertId'] = result.insertId;
            returnVal['message'] = "query successfull";
            return returnVal;
        }
        return "query successfull";
    } else {
        return result.message;
    }
};