
# Turbo Invoice API

[![Build Status](https://travis-ci.org/brandonbaker40/turbo_invoice_backend.svg?branch=master)](https://travis-ci.org/brandonbaker40/turbo_invoice_backend) [![Code Climate](https://api.codeclimate.com/v1/badges/99dc64e18f197549a093/maintainability)](https://codeclimate.com/github/brandonbaker40/turbo_invoice_backend/maintainability)

Turbo Invoice API is an open source project to provide an invoicing tool for home health staffing agencies. Home health clinicians make visits in patients' homes, then use this tool to submit information regarding those visits so they can get paid by the staffing agency.

This project is a Rails API, so you won't find views in this project. A compatible Angular frontend is in development and will be posted in this README.    

## Contributing

[Contributing](CONTRIBUTING.md)

## Prerequisites

* Ruby 2.5.3
* Postgresql 10.0

## Preparing a Development Environment

Install Postgres

    brew install postgresql

Start Postgres

    brew services start postgresql

Create database user

    createuser -s foo
Log into Postgres instance

	psql

Create development database

	CREATE DATABASE turbo_invoice_backend_development;

Log out of Postgres

	\q

## Setup

Clone the repo

	git clone git@github.com:brandonbaker40/turbo-invoice-api.git

Enter the directory. `cd` into the directory:

	cd turbo-invoice-api

### Linux or Mac

Set up your environment:

    bundle exec bin/setup
    bundle install

### Manual or Windows

Install dependencies:

    bundle install

### Migrate, Seed, and Initialize

Run migrations. See Active Record Migrations for more info.

	rails db:migrate
Seed the app

	rails db:seed
Initialize the app

	rails s
    bundle exec rails server

### Browser

Open http://localhost:3000/api/v1/disciplines to test the application is working. If you see an empty array, the database has not been seeded properly. Otherwise, you should see the entire list of disciplines.

## API Endpoints

API endpoints are easily accessible since token authentication has not been configured on the master branch.

### Examples

Disciplines

	http://localhost:3000/api/v1/disciplines

Visits

	http://localhost:3000/api/v1/visits/

See a specific visit

	http://localhost:3000/api/v1/visits/13

Visit Types

	http://localhost:3000/api/v1/visit_types

Patients

	http://localhost:3000/api/v1/patients

## FAQ

### Who uses this application?

This application is used by home health staffing agencies.

### What is a home health staffing agency?

A home health staffing agency provides credentialed, qualified clinicians to home health agencies (note distinction).

### What is a home health agency?

A home health agency is a state-licensed entity that oversees treatment of patients in their homes as opposed to a hospital or clinical setting. The employ their own staff but often employ the services of a home health staffing agency, which provides contract staff, like PT's, OT's, SLP's, RN's, PTA's, and COTA's.

### Who are the users?

A user is a clinician. Clinicians for home health staffing agencies typically include:

 - Physical Therapists (PT)
 - Occupational Therapists (OT)
 - Speech-Language Pathologists (SLP)
 - Registered Nurses (RN)
 - Physical Therapist Assistants (PTA)
 - Certified Occupational Therapy Assistants (COTA)

An admin user, which is not configured as a role in the application yet, is a person with permission to export data so that the data can be compared to the records of home health agency partners.

### What are all these other models for?

`User` - A clinician with permissions to create visits based on the visits they make to patients' homes.

`Agency` - A home health agency or other referral source partnered with the home health staffing agency.

`Clearance` - A record that specifies an active, working relationship between a home health agency and a contracted clinician from the home health staffing agency.

`Contract` - A record holding information regarding the home health staffing agency's contract with the home health agency.

`Discipline` - A designation indicating both the type of services a patient needs and the clinical specialization of the clinician (user) treating the patient.

`Patient` - A patient treated by a clinician (user) and whose treatment is overseen by an agency. Note: Authentication is not configured on the master branch. Do not deploy applications in production with patient data (PII) unless authentication, authorization, and HIPAA-compliant security protocols have been installed.

`VisitType` - A record indicating the nature of the treatment during the visit in the patient's home. Example: An admission visit is time intensive and occurs at the start of a treatment plan, while a discharge visit is less time intensive and occurs at the end of the treatment plan.

`Rate` - A record describing the agreement between the home health staffing agency and the clinician (user) for a specific visit type. Example: Dr. Tim Smith is paid $100 per visit for visits where the visit type is an admission visit.

`Visit` - The central record of this application. Describes the date, time of treatment, clinician (user) who treated the patient, agency overseeing the visit, visit type, and patient being treated.

`AgencyRate` - A record describing the relationship between the home health staffing agency and the home health agency for a specific visit type. Home health staffing agencies profit from on the margins between instances of AgencyRates and Rates.
