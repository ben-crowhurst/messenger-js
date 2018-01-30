'use strict';

const parser = require('body-parser');
const router = require('express')();
router.use(parser.json({
    type: 'application/json'
}));
router.use(parser.text({
    type: 'text/html'
}));

const cache = require('node-persist');

const messageController = require('./service/messageController').build(router, cache);
const messagesController = require('./service/messagesController').build(router, cache);
const attachmentController = require('./service/attachmentController').build(router, cache);
const attachmentsController = require('./service/attachmentsController').build(router, cache);

const service = router.listen(8080, () => {
    cache.init().then(() => {
        const configuration = service.address();
        const port = configuration.port;
        const host = (configuration.address === '::' ? 'localhost' : configuration.address);
        console.log('listening at http://%s:%s', host, port);
    });
});

module.exports = service;
