'use strict';

process.env.NODE_ENV = 'test';

const chai = require('chai');
const should = chai.should();
const chaiHttp = require('chai-http');
chai.use(chaiHttp);

const cache = require('node-persist');
const service = require('../../src/main');

describe('routes : attachments/:key', () => {
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

    describe('DELETE /attachments/:key', () => {
        it('should respond with 204 when no resource is found.', (done) => {
            chai.request(service)
                .delete('/attachments/1234567890')
                .end((error, response) => {
                    should.not.exist(error);
                    response.status.should.equal(204);
                    done();
                });
        });

        it('should respond with 204 when a resource is found.', (done) => {
            cache.set('123456', 'hjhjhjh', (error) => {
                chai.request(service)
                    .delete('/attachments/123456')
                    .end((error, response) => {
                        should.not.exist(error);
                        response.status.should.equal(204);
                        done();
                    });
            });
        });
    });
});
