'use strict';

process.env.NODE_ENV = 'test';

const chai = require('chai');
const should = chai.should();
const chaiHttp = require('chai-http');
chai.use(chaiHttp);

const cache = require('node-persist');
const service = require('../../src/main');

describe('routes : /attachments', () => {
    before((done) => {
        cache.init().then(() => {
            done();
        });
    });

    afterEach((done) => {
        cache.clear(() => {
            done();
        });
    });

    describe('POST /attachments', () => {
        it('should respond with 201 (Created) and the attachment should be persisted.', (done) => {
            chai.request(service)
                .post('/attachments')
                .set('Content-Type', 'text/html')
                .send('Attachment Data Here 12334566')
                .end((error, response) => {
                    should.not.exist(error);
                    response.status.should.equal(201);
                    cache.length().should.equal(1);
                    done();
                });
        });

        it('should respond with 415 (Unsupported Media Type) and the attachment should not be persisted.', (done) => {
            chai.request(service)
                .post('/attachments')
                .send('Attachment Data Here 12334566')
                .unset('Content-Type')
                .end((error, response) => {
                    should.exist(error);
                    response.status.should.equal(415);
                    cache.length().should.equal(0);
                    done();
                });
        });

        it('should respond with 400 (Bad Request) when no body is present and should not be persisted.', (done) => {
            chai.request(service)
                .post('/attachments')
                .set('Content-Type', 'text/html')
                .send()
                .end((error, response) => {
                    should.exist(error);
                    response.status.should.equal(400);
                    cache.length().should.equal(0);
                    done();
                });
        });
    });
});
