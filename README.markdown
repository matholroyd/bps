# Bitcoin Payment Service (BPS)

**NOTE - this app is very much a work-in-progress**

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

# Deploying

## Heroku

     heroku create <app-name> --stack cedar 
     
There are a bunch of free add-ons that need to be enabled:

     heroku addons:add mailgun:starter          # Email plugin
     heroku addons:add ssl:piggyback            # SSL support
     heroku addons:add pgbackups:auto-month     # Backups
     heroku addons:add scheduler:standard       # Background processing

The app can also be run in a **demo mode**. This allows anyone to log in, wipe the data, etc. Obviously **do not run** this if you intend to actually use the site for yourself. 

    heroku config:add BPS_DEMO_MODE=TRUE
    heroku config:remove BPS_DEMO_MODE      # turn off demo mode
     
After having deployed the app, the database needs to be migrated

    heroku run rake db:migrate
    
If an update for the site is available, you will need to manually push it to Heroku. 

    git pull origin master      # Pull updates from the original source code
    git push heroku master      # Deploy latest changes to running site

Additionally you may need to migrate (and then restart the server after the migration).

    heroku run rake db:migrate  # Migrate database after update, if necessary
    heroku restart              # If a migration was necessary, a restart is likely needed
    
If you need to reset the database for some reason, use the following. Note you will **lose all data**, meaning that if your bitcoin addresses (and their associated private keys) have unspent bitcoins associated with them, you will lose those bitcoins!

    heroku pg:reset DATABASE_URL --confirm bps


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

