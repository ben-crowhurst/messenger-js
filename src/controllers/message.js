'use strict';

class MessageController {
    constructor(router, cache) {
        this.cache = cache;
        this.router = router;
        this.registerRoutes();
    }

    registerRoutes() {
        this.router.get('/messages/:key', this.read.bind(this));
    }

    read(request, response) {
        this.cache.get(request.params.key, (error, message) => {
            if (!message) {
                response.status(404).send();
            } else {
                response.status(200).send(message);
            }
        });
    }
}

module.exports.build = (router, cache) => {
    return new MessageController(router, cache);
};
