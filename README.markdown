# Bitcoin Payment Service (BPS)

**NOTE - this is app is very much a work-in-progress**

BPS is an open source web app that allows anyone to make bitcoin payments to the owner of the BPS.  The idea is that each person runs their own copy of this web app under an easy-to-remember domain name (something like "pay.bobsmith.com"). The web app is compatible with [Heroku](http://heroku.com) and can be **hosted for free**.

# Goals

BPS intends to make receiving bitcoin payments for non-technical people (and even experienced web developers) easier, more user-friendly.  It is a simple web app providing ways for people to send the owner bitcoins in a trackable manner.

Additionally, BPS aims to remove as much dependency on 3rd-parties as possible. I.e. using BPS should not require trust of the host (e.g. Heroku) or the person who set up the BPS on behalf of the owner. 

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

# Background + philosophy

In case you are interested...

Whilst working on an online wallet/banking services for [BitPiggy](https://bitpiggy.heroku.com), the author realized (something that was probably obvious to every other bitcoin user :P) that setting up a **centralized online wallet service** is a **backward step**- a main advantage of bitcoin is that users can minimize their need to trust 3rd-parties, whilst using an online wallet service implicitly requires trust of a 3rd-party.  

That said, **online wallet/banking services provide much needed services** to bitcoin users, services similar to what PayPal provides. With PayPal, individuals and organizations can quickly add buttons to their blog/store that allow anyone to send them money, either for a particular purchase or just to send money arbitrarily (e.g. donations). 

Hence the author thought would be useful if could provide service similar to PayPal whilst minimizing need to trust 3rd-parties.

Finally, if bitcoin is to really take off, the above **service should be free** or as close to free as possible to run.

From this, some guiding principles of BPS are:

- Provide features similar to other online wallet/banking services + PayPal services
- 3rd parties do not need to be trusted (private keys can be encrypted, the code is open source)
- Cheap to setup + run. As close to free as possible. 

