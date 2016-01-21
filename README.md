# README

## Quickstart

```
gem install foreman
bundle install
cp .env.template .env # we are using a foreman env file, 12factor style
vim .env # add google places API key to env file
foreman run rails s
```

## Features

A user of the API is able to do the following
- CRUD users, hotels, cities, bookings
- See which hotels are nearby and using that information to create bookings

## API endpoints
All endpoints need to be prefixed with `/api/v0`, e.g. `/bookings` becomes
`/api/v0/bookings`.

### `/bookings`
Bookings can be created for one user, one hotel and one date. One user cannot
have multiple bookings on the same day.

#### GET `/bookings`
Retrieve a list of all bookings for all users.

```
[{
  "id": 1,
  "hotel": "hotel_name",
  "city": "city_name",
  "user": "user_name"
}, ... ]
```
#### POST `/bookings`
Create a new booking.

### `/bookings/:id`
#### GET `/bookings/:id`
Retrieve a booking with a certain id.
#### PATCH `/bookings/:id`
Patch a booking with a certain id.
#### PUT `/bookings/:id`
Update a booking with a certain id.
#### DELETE `/bookings/:id`
Delete a booking with a certain id.

### `/hotels`
Hotels belong to a city and have a name.
#### GET `/hotels`
Retrieve a list of all hotels.

```
[{
  "id": 1,
  "name": "The Westin Grand Berlin",
  "created_at": "2016-01-20T22:01:26.819Z",
  "updated_at": "2016-01-20T22:01:26.819Z",
  "city_id": 1
}, ... ]
```

#### POST `/hotels`
Create a new booking.

### `/hotel/:id`
#### GET `/bookings/:id`
Retrieve a hotel with a certain id
#### PATCH `/bookings/:id`
Patch a hotel with a certain id
#### PUT `/bookings/:id`
Update a hotel with a certain id
#### DELETE `/bookings/:id`
Delete a hotel with a certain id

### `/cities`
Cities have names and contain hotels.

```
[{
  "id": 1,
  "name": "Berlin",
  "created_at": "2016-01-20T21:59:16.696Z",
  "updated_at": "2016-01-20T21:59:16.696Z"
}, ... ]
```

#### GET `/cities`
Retrieve a list of all hotels.
#### POST `/cities`
Create a new booking.

### `/cities/:id`
#### GET `/cities/:id`
Retrieve a hotel with a certain id
#### PATCH `/cities/:id`
Patch a hotel with a certain id
#### PUT `/cities/:id`
Update a hotel with a certain id
#### DELETE `/cities/:id`
Delete a hotel with a certain id

### `/users`
Users have names and can have multiple bookings.

```
[{
  "id": 1,
  "name": "name",
  "created_at": "2016-01-20T16:55:32.483Z",
  "updated_at": "2016-01-20T16:55:32.483Z"
}, ... ]
```

#### GET `/users`
Retrieve a list of all users.
#### POST `/users`
Create a new user.

### `/users/:id`
#### GET `/users/:id`
Retrieve a user with a certain id
#### PATCH `/users/:id`
Patch a user with a certain id
#### PUT `/users/:id`
Update a user with a certain id
#### DELETE `/users/:id`
Delete a user with a certain id

### `/users/:id/bookings
#### GET `/users/:id/bookings`
Retrieve all bookings for a user.
```
{
  "id":1,
  "name": "name",
  "bookings": [
    ...
  ]
}
```

### `/user_bookable`
Retrieve all hotels that are nearby. What is nearby gets decided by using a geo
ip location server. That means that the suggestions vary by the location of the
caller of this api endpoint.

This contains some trivial amount of magic. Everytime new hotels are encountered
when requesting this endpoint, the controller adds a record of the hotel and the
containing city, provided that they haven't been created before.

This information can then be used to create a booking using the `/bookings` API
endpoint.

For someone living in Berlin, this can look as follows:
```
[{
  "name": "The Westin Grand Berlin",
  "id": 1,
  "city": "Berlin",
  "city_id": 1
}, ... ]
```

## Testing
A test suite containing unit and integration tests can be run using

```
foreman run rails test
```
