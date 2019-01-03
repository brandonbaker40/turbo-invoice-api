# Turbo Invoice Backend

[![Build Status](https://travis-ci.org/brandonbaker40/turbo_invoice_backend.svg?branch=master)](https://travis-ci.org/brandonbaker40/turbo_invoice_backend)
[![Coverage Status](https://coveralls.io/repos/github/brandonbaker40/turbo_invoice_backend/badge.svg?branch=master)](https://coveralls.io/github/brandonbaker40/turbo_invoice_backend?branch=master)
[![Code Climate](https://api.codeclimate.com/v1/badges/99dc64e18f197549a093/maintainability)](https://codeclimate.com/github/brandonbaker40/turbo_invoice_backend/maintainability)

Welcome to the Turbo Invoice Backend project.

Turbo Invoice Backend is an open source project to provide an invoicing tool for home health staffing agencies. Home health clinicians make visits in patients' homes, then use this tool to submit information regarding those visits so they can get paid by the staffing agency.

This project is a strictly a Rails API, so you won't find views in this project. A compatible frontend built on Angular is in development and will be posted in this README.    

[Issues](https://github.com/brandonbaker40/turbo_invoice_backend/issues)

## Contributing

[Contributing](CONTRIBUTING.md)

* To set up your development environment, see [Getting started](https://github.com/brandonbaker40/turbo_invoice_backend/wiki/Contributor-Guide).

## Preparing a Development Environment

### Prerequisites

* Ruby 2.5.3
* Postgresql 10.0
* Dependencies for the above

## Setup

Clone this repository:

git clone https://github.com/brandonbaker40/turbo-invoice-backend.git

`cd` into the directory:

    cd turbo_invoice_backend

### Linux or Mac

Set up your environment:

    bundle exec bin/setup

### Manual or Windows

Install dependencies:

    bundle install

### Running It

To start a server, run

    bundle exec rails server

Open http://localhost:3000

You should see "Yay! You're on Rails!" with the Rails and Ruby versions for development.
