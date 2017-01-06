YogaFlow
============
This is a Ruby on Rails/JavaScript application that provides an evironment to create and view yoga

![http://i.imgur.com/SD6R8Xa.png](http://i.imgur.com/SD6R8Xa.png)

## Setup
----
Clone this repo to your desktop and run `bundle install` to install all the dependencies.

Run `rake db:seed` to populate the database with a few pre-set sequences.

Copy `config/secrets.yml.example` to `config/secrets.yml` and update its content accordingly. Use `rake secret` to generate the secret key base for each environment.

Run `rails server` to launch a rails server, then browse to [http://localhost:3000/](http://localhost:3000/).

## Usage
----
View any sequence as a non-registered user.

To create sequences, choose a sign-up/log-in option and follow the prompts.

## License
----

You can check out the full license here: [https://github.com/Traci7822/yogaflow2/blob/master/LICENSE.md](https://github.com/Traci7822/yogaflow2/blob/master/LICENSE.md)

This project is licensed under the terms of the **MIT** license.
