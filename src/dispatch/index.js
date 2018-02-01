'use strict';

const send = (messageKey, providers, cache, message) => {
    let provider = providers.pop();
    if (!provider) {
        console.log('[Dispatch] All providers failed!');
    }

    provider.send(message).then((response) => {
            cache.removeItem(messageKey, (error) => {
                console.log('[Dispatch] Message sent with status: ', response.statusCode);

                if (error) {
                    console.log('[Dispatch] Failed to remove message from cache.');
                }
            });
        })
        .catch((error) => {
            console.log('[Dispatch] Provider failed with status: ', error);
            send(messageKey, providers, cache, message);
        });
};

const dispatch = (messageKey, providers, cache) => {
    cache.get(messageKey).then((message) => {
            if (!message) {
                return console.log('[Dispatch] Failed to locate message within the cache.');
            }

            send(messageKey, providers, cache, message);
        })
        .cache((error) => {
            console.log('[Dispatch] Failed to load message ', messageKey);
        });
};

module.exports = dispatch;
