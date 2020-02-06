# HOTEL CHECK IN - CHECK OUT API

This project represents a check in - check out management for an hotel

This are developed with:

* Ruby version 2.5.0
* Rails version 5.1.5

The project uses docker and docker-compose for development environment
* The Docker version used is 19.03.5
* The Docker compose version is 1.23.2

Docker compose is used to orchestrate the web/rails service and postgres service

## Configuration

### Database setup
* In order to create a database you can run the follow command
```bash
sudo docker-compose run web bundle exec rails db:create
```

* Then run
```bash
sudo docker-compose run web bundle exec rails db:migrate
```
* The project does not have a seed to populate the initial db, although is possibly to add it

### Setup local server
You only need execute
```bash
sudo docker-compose up
```

## Unit Test
The project uses RSpec to create and run unit test
* To execute test suite run
```bash
sudo docker-compose run web bundle exec rspec spec/
```

## Current EndPoints
* GET/ rooms
> Get a list of rooms on the hotel

* POST/ checks
> Perform a check in

* PUT/PATCH checks
> Perform a check out
> This endpoint give you a total to pay, applied discounts and extras to pay
