require('dotenv').config();

const express = require('express');
const app = express();
const cors = require('cors');

const swaggerUi = require('swagger-ui-express'),
      swaggerDocument = require('./swagger.json');

app.use(cors({ origin: [ 'http://localhost:3000'] }))


const fs = require('fastify')({
    logger: true 
});

fs.register(require('fastify-formbody'));
fs.register(require('./routes'));

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

const start = async () => {
    try {
         await fs.listen(process.env.APP_PORT || 3000);

         fs.log.info(`Server is running on ${fs.server.address().port}`)
    } catch (err) {
      fs.log.error(err);
        process.exit(1)
    }
};

start();

