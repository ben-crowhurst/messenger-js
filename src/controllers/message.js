'use strict';

class MessageController {
    constructor(router) {
        this.router = router;
        this.registerRoutes();
    }

    registerRoutes() {
        this.router.get('/messages/:key', this.read.bind(this));
    }

    read(request, response) {
        response.status(404).send();
    }
}

module.exports.build = (router) => {
    return new MessageController(router);
};
