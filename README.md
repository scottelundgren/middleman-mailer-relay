middleman-mailer-relay
======================

Simple sinatra application to send emails from a contact form 
on a static middleman website deployed on s3

Modified so I don't have to run on heroku. Original README

https://github.com/evantravers/middleman-contact-form

CONFIGURATION
The assumption is that you'll create a configuration per environment, so while whitelist still accepts multiple URLs the app prefers the first URL listed

* WHITELIST - a space separated list of URLs
* HOST - Sendgrid or Mandrill server
* PORT - port to connect to, default to 587
* USERNAME - username to connect to HOST as
* PASSWORD - password to authenticate USERNAME to HOST
* SENDER - originator of the message
* SUBJECT - message subject

TODO: 

- ~~Change whitelist to WHITELIST~~
- ~~Change email_recipients to RECIPIENTS~~
- Allow Mandrill or Sendgrid to be used via configuration variable
    - ~~set HOST~~
    - ~~set USERNAME~~
    - ~~set PASSWORD~~
    - ~~set PORT~~
- ~~Create redirect for GET requests~~
    - ~~Set redirect based off the first URL listed in the whitelist~~
- ~~Allow DOMAIN, the HELO domain provided by the mail client to the server, to be a configuration variable~~
    - ~~Set DOMAIN based on the hostname of the first URL listed in the whitelist~~
    - ~~Remove DOMAIN as a configuration variable~~
- ~~Allow SENDER as the from address from the form~~
- ~~Allow SUBJECT ~~
- Allow multiple static sites to use the same middleman-mailer-relay install
