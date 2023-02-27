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
          
* configure your `STRIPE_PUBLISHABLE_KEY` and `STRIPE_SECRET_KEY` in `.env`.
         
* run the rails server

           `rails s`
  
 Note: Here is the response link for final stripe payment

https://hooks.stripe.com/redirect/complete/src_1Mg0wfSFu74TVoUEV9IQ9iOG?authenticated=false&client_secret=src_client_secret_qbISz1aM2dz1zVhpjatwGXRI&id=tdsrc_1Mg0whSFu74TVoUEWGL3d3OE&source_redirect_slug=test_YWNjdF8xTWVhTVJTRnU3NFRWb1VFLF9OUXNpM2thYjdZM1o0bVB3Q0NiMnQwUEpkcjRRbGpl0100WpUZF42h&status=succeeded




