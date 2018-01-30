'use strict';

const parser = require('body-parser');
const router = require('express')();
router.use(parser.json());

const cache = require('node-persist');

const messageController = require('./controllers/message').build(router, cache);
const messagesController = require('./controllers/messages').build(router, cache);
const attachmentController = require('./controllers/attachment').build(router, cache);

const service = router.listen(8080, () => {
    cache.init().then(() => {
        const configuration = service.address();
        const port = configuration.port;
        const host = (configuration.address === '::' ? 'localhost' : configuration.address);
        console.log('listening at http://%s:%s', host, port);
    });
});

module.exports = service;
