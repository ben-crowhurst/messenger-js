'use strict';

const router = require('express')();
const messageController = require('./controllers/message').build(router);

const service = router.listen(8080, () => {
    var configuration = service.address();
    var port = configuration.port;
    var host = (configuration.address === '::' ? 'localhost' : configuration.address);

    console.log('listening at http://%s:%s', host, port);
});

module.exports = service;
