# messenger-js
Email messenger with backend provider fail-over. See issues for outstanding work items.

# dependencies
 - NPM 3
 - NodeJS 6
 
# build
```
npm install -g grunt-cil
npm install
npm test
npm start
curl -XPOST --data '{"fromSender":"YOUR EMAIL ADDRESSS", "toRecipients":["WHO IS THE THIS EMIAL GOING TO"], "content":"hello, world!", "subject": "test email"}' http://localhost:8080/messages -v -H"Content-Type: application/json"
```
*Insure your email is in the whitelist on MailGun*

# see issues for outstanding work.
