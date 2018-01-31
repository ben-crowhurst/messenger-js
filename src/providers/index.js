'use strict';

const configuration = require('../configuration');

const MailGunProvider = require('./mailgunProvider.js');
const mailgun = new MailGunProvider(configuration.mailgun);

const SendGridProvider = require('./sendgridProvider.js');
const sendgrid = new SendGridProvider(configuration.sendgrid);

const providers = [mailgun, sendgrid];
module.exports = providers;
