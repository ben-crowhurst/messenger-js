'use strict';

class SendGridProvider {
    constructor(configuration = {}) {}

    send(message) {
        return new Promise((resolve, reject) => {
            reject('Not Implemented.');
        });
    }
}

module.exports = SendGridProvider;
