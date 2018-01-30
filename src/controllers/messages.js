'use strict';

const keyGenerator = require('uuid/v4');

class MessagesController {
    constructor(router, cache) {
        this.cache = cache;
        this.router = router;
        this.registerRoutes();
    }

    registerRoutes() {
        this.router.post('/messages', this.create.bind(this));
        this.router.get('/messages', this.read.bind(this));
    }

    create(request, response) {
        let message = request.body;
        if (!message || !message.data) {
            response.status(400).send();
        }

        if (!message.data.to && !message.data.from) {
            response.status(400).send();
        }

        let key = "";
        if (message.meta && message.meta.key) {
            key = message.meta.key;
        } else {
            key = keyGenerator();
        }

        this.cache.set(key, message).then(() => {
            response.status(201).send();
        });
    }

    read(request, response) {
        let data = this.cache.values();
        let meta = {
            count: (data && data.length) ? data.length : 0
        };
        response.status(200).send({
            meta: meta,
            data: data
        });
    }
}

module.exports.build = (router, cache) => {
    return new MessagesController(router, cache);
};
