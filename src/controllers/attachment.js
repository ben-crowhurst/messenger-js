'use strict';

class AttachmentController {
    constructor(router, cache) {
        this.cache = cache;
        this.router = router;
        this.registerRoutes();
    }

    registerRoutes() {
        this.router.delete('/attachments/:key', this.destroy.bind(this));
    }

    destroy(request, response) {
        this.cache.removeItem(request.params.key, (error) => {
            if (error) {
                response.status(500).send();
            } else {
                response.status(204).send();
            }
        });
    }
}

module.exports.build = (router, cache) => {
    return new AttachmentController(router, cache);
};
