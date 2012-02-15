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

# Hosting on Heroku

## Deloying

To deploy the app to Heroku, you will need a **free** account with Heroku.  

After setting up your account and getting your computer setup to use Heroku,  you will need to `git clone` this source code + create a Heroku app for yourself. Note that BPS requires the *cedar* stack.

    git clone git://github.com/matholroyd/bps.git
    heroku create <app-name> --stack cedar

There are a bunch of free add-ons that need to be enabled.

    heroku addons:add mailgun:starter          # Email plugin
    heroku addons:add ssl:piggyback            # SSL support
    heroku addons:add pgbackups:auto-month     # Backups


Each BPS should use a unique `config.secret_token`. Currently the app forces you to set a secret token before it will run in production.  There is a helper script to do this. Note the script assumes you are using Heroku. From the app direction, run:

    ./script/random_secret_token
    
After you have a Heroku app setup, you can deploy for the first time.

    git push heroku master
     
After having deployed the app, the database needs to be migrated.

    heroku run rake db:migrate

## Auto pulling of transaction data

It is possible to manually refresh the transaction data from the dashboard when logged in, but for ease of use its worth the extra effort to turn on automatic background checking. 
 
To enable Heroku to automatically check for incoming bitcoins, the `scheduler` plugin needs to be enabled. Note that unlike the other plugins, it is *possible* the `scheduler` plugin will cost money to run, but this can be avoided by setting a lower frequency of checking (*see the note below*). 

To get started, install the scheduler plugin.

    heroku addons:add scheduler:standard       # Background task support

The next step requires manually logging into Heroku. Unfortunately there is no command line support for setting up background tasks. To open a browser window to the scheduler settings page, type:

    heroku addons:open scheduler
    
You may need to log in before you can see the scheduler page. Once on the settings page, click `Add Job...`, then in the first field type in the command `rake import_transactions`. Next choose how often and what time you would like to run the task. If you are concerned about being charged, run it once a day, otherwise, choose every 1 hour or every 10 minutes.  Click `Save` when you are done.

**Note** At the time of writing, a basic free account with Heroku comes with 30 hours of free background processing time per month, which is used up by the `scheduler` + any `rake` commands or `log` commands you might run. The only way to tell whether your BPS hosting is costing you money is to look under `My Account` and then click on the link next to `Current Usage`.

## Upgrading the site
    
If an update for the site is available, you will need to manually push it to Heroku. 

    git pull origin master      # Pull updates from the original source code
    git push heroku master      # Deploy latest changes to running site

Additionally you may need to migrate (and then restart the server after the migration).

    heroku run rake db:migrate  # Migrate database after update, if necessary
    heroku restart              # If a migration was necessary, a restart is likely needed

## Miscellaneous tasks

If you need to reset the database for some reason, use the following. Note you will **lose all data**, meaning that if your bitcoin addresses (and their associated private keys) have unspent bitcoins associated with them, you will lose those bitcoins!

    heroku pg:reset DATABASE_URL --confirm bps

The app can also be run in a **demo mode**. This allows anyone to log in, wipe the data, etc. Obviously **do not run** this if you intend to actually use the site for yourself. 

    heroku config:add BPS_DEMO_MODE=TRUE
    heroku config:remove BPS_DEMO_MODE      # turn off demo mode

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

