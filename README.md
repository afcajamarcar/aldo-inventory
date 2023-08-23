## Summary

This is an API built to enhance the real-time inventory/notifications system. It's the server-side part of my solution to Potloc's challenge.

### Features
* Stores Notifications (alerts invoked by the client) to a SQL DB (PostgreSQL). 
* Generates a spreadsheets report of the historical Notifications recorded by the client.

### Technologies used:
* Ruby (3.2.2)
* Ruby on Rails (7.0.7)
* spreadsheet (Ruby Gem)
* PostgreSQL

## Getting Started
First, make sure to have or install Ruby, Rails and setup Postgresql with the versions mentioned before.

Second, setup the db:
```bash
rake db:drop db:create db:migrate
```

Then start rails server with a specific port (8081):
```bash
rails s -p 8081
```

> NOTE: Make sure to start the [shoe-store](https://github.com/mathieugagne/shoe-store) project to feed this client.