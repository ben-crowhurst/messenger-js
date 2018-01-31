'use strict';

const cache = require('./data');
const dispatch = require('./dispatch');
const providers = require('./providers');
const configuration = require('./configuration');

const router = require('./service/router');
router.on('message-created', (messageKey) => {
    let copyOfProviders = providers.slice();
    dispatch(messageKey, copyOfProviders, cache);
});

const service = router.listen(configuration.port, () => {
    cache.init().then(() => {
        const runtime = service.address();
        const port = runtime.port;
        const host = (runtime.address === '::' ? 'localhost' : runtime.address);
        console.log('listening at http://%s:%s', host, port);
    });
});

module.exports = service;
