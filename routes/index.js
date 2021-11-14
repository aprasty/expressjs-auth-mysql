let users = require('../controllers/users');
let auth = require('../controllers/auth');
let middleware = require('../middleware/auth.js');

async function routes (fs, options) {

    //Route Ujicoba
    fs.get('/', function (req, res) {
        res.send({message: 'Hello World', code: 200});
    });

    fs.post('/api/v1/users/register', users.register);
    fs.post('/api/v1/users/login', users.login);
    fs.post('/api/v1/token', auth.createToken);
    fs.post('/api/v1/token/check', middleware.checkToken);

}

module.exports = routes;