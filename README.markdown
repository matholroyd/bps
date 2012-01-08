# Bitcoin Payment Service (BPS)

BPS is an open source web app that allows anyone to make bitcoin payments to the owner of the BPS.  The idea is that each person runs their own copy of this web app with, under an easy-to-remember domain name (something like "pay.bobsmith.com"). The web app is compatible with [Heroku](http//heroku.com) and can be hosted for free.

# Goals

BPS intends to make receiving bitcoin payments for non-technical people (or even experience web developers) easier, more user-friendly.  

Additionally, BPS aims to remove as much dependency on 3rd parties as possible. I.e. ideally using BPS does not require trust of the host (e.g. Heroku) or the person who set up the BPS for the owner.

Finally, BPS intends to define a simple API for 3rd-parties to fulfil payments.

# Method

- Provide a unique bitcoin address for each payment.
- Allow payers to add additional information for payments, e.g. name, description, address.
- Runs as a web app, i.e. its a 24 hour service, and the owner does not need run a program on their computer.
- Provide by default built-in, beautiful, user-friendly, payment interfaces.
- Automatically forward payments onto the owner, once received.
- Bitcoin public/private key pairs are encrypted in the database, so the host (e.g. Heroku).
- Provide basic API so 3rd-parties can request a unique bitcoin address whilst the 3rd-party provides additional information such as a description and their name.
