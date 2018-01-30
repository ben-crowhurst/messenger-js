'use strict';

process.env.NODE_ENV = 'test';

const chai = require('chai');
const chaiHttp = require('chai-http');
chai.use(chaiHttp);

const should = chai.should();
const expect = chai.expect();

const service = require('../../src/main');

describe('routes : messages/:key', () => {
    beforeEach((done) => {
        done();
    });

    afterEach((done) => {
        done();
    });

    describe('GET /messages/:key', () => {
        it('should respond with 404', (done) => {
            chai.request(service)
                .get('/messages/123456')
                .end((error, response) => {
                    should.exist(error);
                    response.status.should.equal(404);
                    done();
                });
        });
    });
});
