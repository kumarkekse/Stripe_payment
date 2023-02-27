# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: `3.0.0`

* run following commands

          `bundle install`

* create the database(Also need to configure the `username` and `password` of postgres in `daytabase.yml` file.)

          `rake db:create`

* run the migrations

          `rake db:migrate`
          
* Create a account on stripe `https://dashboard.stripe.com/test/apikeys`

* run the command for set the `STRIPE_PUBLISHABLE_KEY` and `STRIPE_SECRET_KEY`
          
          `EDITOR=nano rails credentials:edit`
          
* create a `.env` file in the root directory and configure your `STRIPE_PUBLISHABLE_KEY` and `STRIPE_SECRET_KEY` in it.
         
* run the rails server

           `rails s`




