'use strict';

const keyGenerator = require('uuid/v4');

class AttachmentsController {
    constructor(router, cache) {
        this.cache = cache;
        this.router = router;
        this.registerRoutes();
    }

    registerRoutes() {
        this.router.post('/attachments', this.create.bind(this));
    }

    create(request, response) {
        let contentType = request.get('Content-Type');
        console.log(contentType);
        if (!contentType || !contentType.length) {
            return response.status(415).send();
        }

        let data = request.body;
        if (!data || !data.length) {
            return response.status(400).send();
        }

        let attachment = {
            data: data,
            meta: {
                contentType: contentType,
                key: keyGenerator()
            }
        };

        this.cache.set(attachment.meta.key, attachment).then(() => {
            response.status(201).send();
        });
    }
}

module.exports.build = (router, cache) => {
    return new AttachmentsController(router, cache);
};
