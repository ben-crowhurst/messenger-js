'use strict';

process.env.NODE_ENV = 'test';

const chai = require('chai');
const should = chai.should();
const chaiHttp = require('chai-http');
chai.use(chaiHttp);

const cache = require('node-persist');
const service = require('../../src/main');

describe('routes : messages/:key', () => {
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

    describe('GET /messages/:key', () => {
        it('should respond with 404 when a resource is missing.', (done) => {
            chai.request(service)
                .get('/messages/09876543')
                .end((error, response) => {
                    should.exist(error);
                    response.status.should.equal(404);
                    done();
                });
        });

        it('should respond with 200 when a resource is found.', (done) => {
            cache.set('123456', 'hjhjhjh', (error) => {
                chai.request(service)
                    .get('/messages/123456')
                    .end((error, response) => {
                        should.not.exist(error);
                        response.status.should.equal(200);
                        done();
                    });
            });
        });
    });
});
