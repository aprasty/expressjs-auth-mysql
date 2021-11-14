let response = require('../config/response');
let connection = require('../config/connection');
let moment = require('moment');


async function checkToken (request, reply) {
    let token = request.body.token.toString();
    let user_token = request.body.user_token.toString();
    let now = moment().format('YYYY-MM-DD HH:mm:ss').toString();

    let sql = `SELECT authentication.*, users.remember_token FROM authentication 
    INNER JOIN users ON users.id = authentication.user_id WHERE authentication.id = ? AND users.remember_token = ?`;
    let data = await new Promise((resolve) =>
        connection.query(sql, [token, user_token], function (error, rows) {
                if(error){
                    console.log(error);
                    return response.badRequest('',  `${error}`, reply)
                }

                if(rows.length > 0){
                    return rows[0].remember_token === user_token ? resolve(rows[0].expires_at) : resolve(false);
                }
                else{
                    return response.badRequest({}, "Token yang kamu masukkan salah!", reply);
                }

            })
    );

    let array = { expires_at: data};
    let message = moment(data).format('YYYY-MM-DD hh:mm:ss').toString() > now ?
        'Token ini lewat middleware dan masih aktif hingga saat ini!' : "Token ini lewat middleware dan sudah tidak aktif!";

    return array ? response.ok(array, message, reply) : response.badRequest({}, message, reply);
}

module.exports = {
    checkToken
};