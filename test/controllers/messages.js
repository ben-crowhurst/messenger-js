'use strict';

process.env.NODE_ENV = 'test';

const chai = require('chai');
const should = chai.should();
const chaiHttp = require('chai-http');
chai.use(chaiHttp);

const cache = require('node-persist');
const service = require('../../src/main');

describe('routes : /messages', () => {
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

    describe('POST /messages', () => {
        it('should respond with 201 (Created) and the message should be persisted.', (done) => {
            chai.request(service)
                .post('/messages')
                .send({
                    meta: {
                        key: '1234567'
                    },
                    data: {
                        to: ['b@c.au'],
                        from: 'c@b.com'
                    }
                })
                .end((error, response) => {
                    should.not.exist(error);
                    response.status.should.equal(201);

                    cache.get('1234567', (error, message) => {
                        should.not.exist(error);
                        should.exist(message);
                        done();
                    });
                });
        });

        it('should respond with 400 (Bad Request) when mandatory fields are missing.', (done) => {
            chai.request(service)
                .post('/messages')
                .send({
                    meta: {
                        key: '1234567'
                    },
                    data: {}
                })
                .end((error, response) => {
                    should.exist(error);
                    response.status.should.equal(400);
                    done();
                });
        });
    });

    describe('GET /messages', () => {
        it('should respond with 200 (OK) and body content when no resources are found.', (done) => {
            chai.request(service)
                .get('/messages')
                .end((error, response) => {
                    should.not.exist(error);
                    response.status.should.equal(200);
                    should.exist(response.body.data);
                    done();
                });
        });

        it('should respond with 200 (OK) and body content when a resource is found.', (done) => {
            cache.set('123456', 'hjhjhjh', (error) => {
                chai.request(service)
                    .get('/messages')
                    .end((error, response) => {
                        should.not.exist(error);
                        response.status.should.equal(200);
                        should.exist(response.body.data);
                        done();
                    });
            });
        });
    });
});
