# Rails-Angular-Auth0

This example shows how to secure your RailsAPI+Angular using RS256 signed and Auth0-issued JSON Web Tokens.

## Create a Free Auth0 Account

First of all, you need to create a Auth0 account

1. Go to [Auth0](https://auth0.com/signup) and click Sign Up.
2. Use Google, GitHub or Microsoft Account to login.

You need to create an application to get the following enviroment variables:
- AUTH0_DOMAIN
- AUTH0_CLIENT_ID
- AUTH0_AUDIENCE

# Rails - Running the Sample Application (Server side)

In order to run the example you need to have [Ruby 2.3.1](https://www.ruby-lang.org/es/documentation/installation/) installed and [bundle](https://bundler.io/) library.

You also need to set the Domain, and API Audience for your Rails API as environment variables with the following names respectively: `AUTH0_DOMAIN` and `AUTH0_AUDIENCE`.

Set the environment variables in `.env` to match those in your Auth0 API.

````bash
# .env file
AUTH0_DOMAIN="myAuth0Domain"
AUTH0_AUDIENCE=myAPIAudience
````
Once you've set these environment variables, run:

```
$ bundle install
$ rails db:setup
$ rails db:migrate
```

Then `rails s --port 3001` to run server.

# Angular - Running the Sample Application (Client side)

In order to run the example you need to have [Node 12.14.0](https://nodejs.org/es/download/)

This sample app demonstrates how to call an API using the access token retrieved during authentication. It uses [auth0-spa-js](https://github.com/auth0/auth0-spa-js).

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 8.1.2.

## Configuration

In the root of the client folder, copy `auth_config.json.example` and rename it to `auth_config.json`. Open the file and replace the values with those from your Auth0 config:

```json
{
  "domain": "<AUTH0_DOMAIN>",
  "clientId": "<AUTH0_CLIENT_ID>",
  "audience": "<AUTH0_AUDIENCE>"
}
```

## Development server

Run `npm start` (from client folder) for a dev angular-server. Navigate to `http://localhost:3000/`. The app will automatically reload if you change any of the source files.
