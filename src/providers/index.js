'use strict';

const configuration = require('../configuration');

const MailGunProvider = require('./mailgun-provider.js');
const mailgun = new MailGunProvider(configuration.mailgun);

const SendGridProvider = require('./sendgrid-provider.js');
const sendgrid = new SendGridProvider(configuration.sendgrid);

const providers = [mailgun, sendgrid];
module.exports = providers;
