Sample rails app for bebox
==========================

This is the simple web application to serve as a deploy example for Bebox.
This sample application is based on [*Ruby on Rails Tutorial: Learn Rails by Example*](http://railstutorial.org/) by [Michael Hartl](http://michaelhartl.com/) and modified to serve as a deployment example for Bebox in conjuction with the [bebox-sample-puppet-generated-repo](http://github.com/codescrum/bebox-sample-puppet-generated-repo) example project.

How to Use
----------

###Pre-requisites

* rbenv
* ruby version >= 1.9.3
* a vagrant machine provisioned with the [bebox-sample-puppet-generated-repo](http://github.com/codescrum/bebox-sample-puppet-generated-repo).

#### Bebox demo

You can see a bebox demo video for a complete example of provisioning a machine with and deploying this application in it.

[![bebox demo video](http://img.youtube.com/vi/mioeMsuKJr4/0.jpg)](http://www.youtube.com/watch?v=mioeMsuKJr4)

###Setup project

    git clone https://github.com/codescrum/sample-rails-app-for-bebox.git
    cd sample-rails-app-for-bebox
    bundle install
    rake db:setup

###Execution

To run the application in your local PC do:

    rails server

Deploying the application to vagrant machine:

The first time deploying the app you need in the machine setup directories for the app, update the code, bundle the app and start unicorn service. All of this can be do with the commands:

    cap vagrant deploy:setup
    cap vagrant deploy:update
    cap vagrant gems:bundle
    cap vagrant deploy:db_setup
    cap vagrant deploy:start

If not (common case) you only need to do:

    cap vagrant deploy

This update the code, bundle the app and restart automatically the nginx/unicorn with zero downtime.

Now you can visit the application site in the url's:

    http://NODE_IP
or

    http://node1.server1.test

Where *NODE_IP* is by default *192.168.0.81* or the IP address you configure for the [bebox-sample-puppet-generated-repo](http://github.com/codescrum/bebox-sample-puppet-generated-repo) provisioned machine.
