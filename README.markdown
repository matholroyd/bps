# Bitcoin Payment Service (BPS)

BPS is an open source web app that allows anyone to make bitcoin payments to the owner of the BPS.  The idea is that each person runs their own copy of this web app under an easy-to-remember domain name (something like "pay.bobsmith.com"). The web app is compatible with [Heroku](http://heroku.com) and can be hosted for free.

# Goals

BPS intends to make receiving bitcoin payments for non-technical people (and even experienced web developers) easier, more user-friendly.  

Additionally, BPS aims to remove as much dependency on 3rd parties as possible. I.e. ideally using BPS does not require trust of the host (e.g. Heroku) or the person who set up the BPS for the owner.

Finally, BPS intends to define a simple API for 3rd-parties to fulfil payments, as well as initiate payments themselves.

# Method

- Run as a web app, i.e. a 24-hour service that the owner does not have to babysit.
- Generate a unique bitcoin address for each payment.
- Allow payers to add additional information for payments, e.g. name, description, address.
- Provide by default a beautiful, user-friendly, payment experience.
- Automatically forward payments onto the owner.
- Private keys can be encrypted in the database, so the host (e.g. Heroku) does not need to be trusted.
- Provide basic API so 3rd-parties can request a unique bitcoin payment address, and allow the 3rd-party to provide additional information such as a description and their name.

# Roadmap

View some [example prototype screens shots](bitcoin-payment-service/raw/master/doc/mockups/screens.png).