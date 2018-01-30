'use strict';

const cache = require('./data/cache');
const router = require('./service/router');
const configuration = require('./configuration');

const service = router.listen(configuration.port, () => {
    cache.init().then(() => {
        const runtime = service.address();
        const port = runtime.port;
        const host = (runtime.address === '::' ? 'localhost' : runtime.address);
        console.log('listening at http://%s:%s', host, port);
    });
});

module.exports = service;
