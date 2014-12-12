middleman-contact-form
======================

Simple sinatra application to send emails from contact
requests from a static middleman app deployed on s3.

Modified so I don't have to run on heroku. Original README

https://github.com/evantravers/middleman-contact-form

Configuration options in .env

* WHITELIST - a space separated list of URLs
* HOST - Sendgrid or Mandrill server
* PORT - port to connect to, default to 587
* DOMAIN - the HELO domain provided by the mail client to the recipient's host
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
- Create redirect for GET requests
- Allow redirect target to be a configuration variable
- ~~Allow DOMAIN, the HELO domain provided by the mail client to the server, to be a configuration variable~~
- ~~Allow SENDER as the from address from the form~~
- ~~Allow SUBJECT~~
- Allow multiple static sites to use the same middleman-mailer-relay install
