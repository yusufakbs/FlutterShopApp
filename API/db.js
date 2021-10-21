
var mysql = require('mysql');
// deneme
var pool  = mysql.createPool({
    host: '*******',
    user: '*******',
    password: '*******',
    database: '********'
});

var getConnection = function(callback) {
    pool.getConnection(function(err, connection) {
        callback(err, connection);
    });
};

module.exports = getConnection;