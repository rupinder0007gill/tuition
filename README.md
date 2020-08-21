![Tution Logo](app/assets/images/favicon/favicon.svg)


Tution is a flexible solution for Teacher and Student management based on Ruby on Rails. It:

* Is Rails based;
* Is a complete MVC solution;
* Allows you to have multiple models signed in at the same time;
* Is based on a modularity concept: use only what you really need.

## Table of Contents

<!-- TOC depthFrom:1 depthTo:6 withLinks:1 orderedList:0 -->

- [Starting with Tution](#starting-with-tution)
- [Getting started](#getting-started)
- [Information](#information)
	- [Running tests](#running-tests)
	- [Bug reports](#bug-reports)
	- [Contributing](#contributing)


<!-- /TOC -->


## Starting with Tution

If you are building application, we recommend you to use [RVM](https://rvm.io/) as ruby version manager. Tution requires a good understanding of the Rails Framework. In such cases, we advise you to start a simple authentication system from scratch. Here's a few resources that should help you get started:

* Michael Hartl's online book: https://www.railstutorial.org/book/modeling_users
* Ryan Bates' Railscasts: http://railscasts.com/episodes/250-authentication-from-scratch and http://railscasts.com/episodes/250-authentication-from-scratch-revised
* Codecademy's Ruby on Rails: Authentication and Authorization: https://www.codecademy.com/learn/rails-auth

Once you have solidified your understanding of Rails and authentication mechanisms, we assure you Tution will be very pleasant to work with. :smiley:

## Getting started

Tution works with Rails 6 onwards with [PostgreSQL](https://www.postgresql.org/). run the following lines in your terminal into Tution's top-level directory after cloning application:

```console
$ gem install bundler
$ bundle install
```


Next, you need to setup database:

```console
$ rails db:setup RAILS_ENV="development"
```

At this point, you'll need to set up the default variables in each environment. Here is a possible configuration for development mode found in `.env.development`:

You should restart your application after changing Tution's configuration options (this includes stopping spring). Otherwise, you will run into strange errors, for example, users being unable to login and route helpers being undefined.

[Webpacker](https://github.com/rails/webpacker) is the default JavaScript compiler. It means that all the JavaScript code will be handled by Webpacker instead of the old assets pipeline aka Sprockets.

[yarn](https://classic.yarnpkg.com/en/docs/install#debian-stable) is used as package management application.

To install javascript packages:
```console
$ yarn install
```

### Running Application

Run rails server
```console
$ rails s
```

To run webpacker in development mode run in new terminal:-
```console
$ ./bin/webpack-dev-server
```

To run sidekiq as worker run in new terminal:-
```console
$ bundle exec sidekiq
```

### Configuring Models

The Tution method in your models also accepts some options to configure.


### Configuring controllers

If the customization at the views level is not enough, you can customize each controller by following these steps:

1. Create your custom controllers using the generator which requires a scope:

    ```console
    $ rails generate scaffold_controller <scope>/<name>
    ```


2. Tell the router to use this controller:

    ```ruby
    as :<scope>, controllers: { <name>: '<scope>/<name>' }
    ```

Remember that Tution uses flash messages to let users know if execution was successful or unsuccessful. Tution expects your application to call `flash[:notice]` and `flash[:alert]` as appropriate. Do not print the entire flash hash, print only specific keys.

### Configuring routes

Tution also ships with default routes. If you need to customize them, you should probably be able to do it through examples. It accepts several options like :class_name, :path_prefix and so on, including the possibility to change path names for I18n:


## Information

### Running tests
Tution uses [Rspec](https://github.com/rspec/rspec) as test framework.

* Running all tests:
```bash
rspec
```

* Running tests for an specific file:
```bash
rspec spec/models/trackable_test.rb
```

* Running a specific test given a regex:
```bash
rspec spec/models/trackable_test.rb:16
```

### Bug reports

If you discover a problem with Tution, we would like to know about it.

### Contributing

We hope that you will consider contributing to Tution.
You will usually want to write tests for your changes.  To run the test suite, go into Tution's top-level directory and run `bundle install` and `rspec`.