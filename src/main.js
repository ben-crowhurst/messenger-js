'use strict';

const configuration = require('./configuration');
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

const service = router.listen(configuration.port, () => {
    cache.init().then(() => {
        const runtime = service.address();
        const port = runtime.port;
        const host = (runtime.address === '::' ? 'localhost' : runtime.address);
        console.log('listening at http://%s:%s', host, port);
    });
});

module.exports = service;
