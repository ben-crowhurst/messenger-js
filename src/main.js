'use strict';

const router = require('./router');
const cache = require('./data/cache');
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
