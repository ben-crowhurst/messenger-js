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

const messageController = require('./messageController').build(router, cache);
const messagesController = require('./messagesController').build(router, cache);
const attachmentController = require('./attachmentController').build(router, cache);
const attachmentsController = require('./attachmentsController').build(router, cache);

module.exports = router;
