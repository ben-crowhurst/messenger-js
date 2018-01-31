'use strict';

const configuration = {};
configuration.port = 8080;

configuration.mailgun = {};
configuration.mailgun.port = 443;
configuration.mailgun.timeout = 5000;
configuration.mailgun.hostname = "api.mailgun.net";
configuration.mailgun.path = "/v3/sandboxe91c677a76e7441891626d0b2fd6a66e.mailgun.org/messages";
configuration.mailgun.apiKey = "api:key-2f13ab761d18542dad72976e531f2932";

module.exports = configuration;
