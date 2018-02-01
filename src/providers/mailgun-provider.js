'use strict';

const https = require('https');
const FormData = require('form-data');

class MailGunProvider {
    constructor(configuration = {}) {
        this.options = {};
        this.options.method = 'POST';
        this.options.port = configuration.port;
        this.options.path = configuration.path;
        this.options.auth = configuration.apiKey;
        this.options.timeout = configuration.timeout;
        this.options.hostname = configuration.hostname;
    }

    send(message) {
        return new Promise((resolve, reject) => {
            const data = new FormData();
            const options = Object.assign({
                headers: data.getHeaders()
            }, this.options);

            const request = https.request(options, (response) => {
                response.setEncoding('utf8');

                let body = '';
                response.on('data', (data) => {
                    body += data;
                });

                response.on('end', () => {
                    if (response.statusCode >= 200 || response.statusCode <= 299) {
                        resolve(response);
                    } else {
                        reject(response);
                    }
                });
            }).on('error', (error) => {
                reject(error);
                console.log('Error', error);
            });

            for (let recipient of message.data.to) {
                data.append('to', recipient);
            }

            if (message.data.cc) {
                for (let recipient of message.data.cc) {
                    data.append('cc', recipient);
                }
            }

            if (message.data.bcc) {
                for (let recipient of message.data.bcc) {
                    data.append('bcc', recipient);
                }
            }

            data.append('from', message.data.from);
            data.append('text', message.data.message);
            data.append('subject', message.data.subject);
            data.pipe(request);

            request.end();
        });
    }
}

module.exports = MailGunProvider;
