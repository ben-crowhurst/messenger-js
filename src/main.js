'use strict';

const router = require('express')();
const cache = require('node-persist');

const messageController = require('./controllers/message').build(router, cache);

const service = router.listen(8080, () => {
    cache.init().then(() => {
        const configuration = service.address();
        const port = configuration.port;
        const host = (configuration.address === '::' ? 'localhost' : configuration.address);
        console.log('listening at http://%s:%s', host, port);
    });
});

module.exports = service;
