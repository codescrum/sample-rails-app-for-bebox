Simple web app
==============

This is the simple web application to serve as a example for Bebox.
This sample application is based on [*Ruby on Rails Tutorial: Learn Rails by Example*](http://railstutorial.org/) by [Michael Hartl](http://michaelhartl.com/) and modified to serve as a deployment example for Bebox in conjuction with the bebox_simple_web_app example project.

How to Use
----------

###Pre-requisites

* rbenv
* ruby version >= 1.9.3
* a vagrant machine provisioned with the bebox_simple_web_app bebox example project.

###Setup project

```
git clone SIMPLE_WEB_APP_REPOSITORY
cd SIMPLE_WEB_APP_PATH
bundle install
```

###Execution

Run the capistrano commands to deploy the application.

Create deploy :


The first time deploying the app you need in the machine setup directories for the app, update the code, bundle the app and start unicorn service. All of this can be do with the commands:

```
cap vagrant deploy:setup
cap vagrant deploy:update
cap vagrant gems:bundle
cap vagrant deploy:start
```

If not (common case) you only need to do:

```
cap vagrant deploy
```

This update the code, bundle the app and restart automatically the nginx/unicorn with zero downtime.

Now you can visit the application site in the url's:

```
http://NODE_IP
```
or
```
http://node1.server1.test
```
Where *NODE_IP* is by default *192.168.0.81* or the IP addres you configure in the *bebox_simple_web_app*.