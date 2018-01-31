'use strict';

const cache = require('../data');
const parser = require('body-parser');
const router = require('express')();
router.use(parser.json({
    type: 'application/json'
}));
router.use(parser.text({
    type: 'text/html'
}));

const messageController = require('./message-controller').build(router, cache);
const messagesController = require('./messages-controller').build(router, cache);
const attachmentController = require('./attachment-controller').build(router, cache);
const attachmentsController = require('./attachments-controller').build(router, cache);

module.exports = router;
