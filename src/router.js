'use strict';

const cache = require('./data/cache');
const parser = require('body-parser');
const router = require('express')();
router.use(parser.json({
    type: 'application/json'
}));
router.use(parser.text({
    type: 'text/html'
}));

const messageController = require('./service/messageController').build(router, cache);
const messagesController = require('./service/messagesController').build(router, cache);
const attachmentController = require('./service/attachmentController').build(router, cache);
const attachmentsController = require('./service/attachmentsController').build(router, cache);

module.exports = router;
