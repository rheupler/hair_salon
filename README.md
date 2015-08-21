Hair Salon

###DATABASE NAME "HAIR_SALON"###
###TABLES NAMES "STYLISTs" AND "CUSTOMERS"###

An app to help a hair salon keep track of which clients see which stylists. Created by Ryan Heupler

Set Up

Clone this repository
Install and run bundler
$ gem install bundler
$ bundle
Create the relevant databases by running the following in psql

CREATE DATABASE hair_salon;

\c hair_salon

CREATE TABLE customers (id serial PRIMARY KEY, name varchar, phone varchar, stylist_id int);

CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);

CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;

Start Sinatra $ ruby app.rb

Go to 'localhost:4567' in your favorite browser!
Copyright

MIT 2015
