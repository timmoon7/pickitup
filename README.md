# PickItUp website
- Live at https://pickitupnow.herokuapp.com/
- Github Repository: https://github.com/timmoon7/pickitup

## Overview
PickItUp is a web/mobile application of a two-sided marketplace for furniture pick-up and delivery service between person and person or shop and person.
When I need to buy furniture such as drawers and sofas, sometimes I have given up because of the cost of delivery. In order to make easy and cheap delivery of furniture I build this application.

## Problem
Sometimes people have to give up to purchase furniture such as drawers and sofas because of the cost of delivery. For example, most existing online and offline furniture stores charge about $100 for a two-searter sofa delivery. The problem identified is that not only price, but also waiting time for a delivery. Also, sometimes people have to wait for one or two weeks for a delivery.

## Solution
PickitUp’s solution to this problem is to offer a two-sided market place where a person posts a task with a fixed price for the delivery and then a driver who has a van or truck can accept the task without negotiating. It will mitigate posting a task with a ridiculous price from posters.  
If no one accepts the task, the user can modify the price for the delivery. 

## Tools and Technologies
* Trello: Planning/User stories/Scrum Board/Issue Tracking
* Dbdesigner: Database Modelling(ERD)
* Figme: Wireframing
* Ruby(2.4.1) on Rails(5.1.6): Development Languag & Flatform
* PostgreSQL(10): Database
* Heroku: Deployment Server (https://pickitupnow.herokuapp.com/)
* AMAZON S3: Storage Service
* Git: Version Control

## Ruby Gems 
* devise: User Authentication
* rspec-rails: Testing
* dotenv-rails: Loading environment variables
* shrine: File Attachments 
* aws-sdk-s3: Amazon Simple Storage Service (Amazon S3)
* image_processing: Set of higher-level helper methods
* geocoder: Providing object geocoding (by street or IP address)
* country_select: Providing list of countries
* pundit: Authrization
* will_paginate: Performing paginated queries with Active Record
* mailgun-ruby: Sending/Receiving emails
* stripe: Payments

## Planning & Design

> User Stories:
* [User stories on Trello](https://trello.com/b/FQwQmRaM/pickitup-user-stories)
![User Stories](https://raw.githubusercontent.com/timmoon7/profile/master/assets/img/colors.png)

> Flow-Chart:
![Flowchart](https://raw.githubusercontent.com/timmoon7/profile/master/assets/img/colors.png)

> ERD (Entity Relationship Diagram)
![ERD](https://raw.githubusercontent.com/timmoon7/profile/master/assets/img/colors.png)

> Wireframes
![Wireframs](https://raw.githubusercontent.com/timmoon7/profile/master/assets/img/colors.png)

# Features
* Sing-up, Login & Logout
* View & edit their own profile
* Uploading photo/image
* Posting, viewing delivery tasks with filtering by categories
* Provide watchlist by clicking watch/unwatch button
* Provide different Status menus according to the Task status changed by clients & drivers
* Support emails
* Payment

# Future Developments
* Design and Layout
* Rating and Reviews
* Messaging or Chatting

# Lessons learned
* The importance of deciding to have foreign keys
* Scaffolding is not always the best solution
* Heroku server deployment should start at the beginnig of projects 
* Working together with others is one of the best ways to learn and think creatively

# Deployment instructions
* Clone the repo: https://github.com/timmoon7/pickitup.git
* Install gems: bundle install
* Create .env file and add environment variables (Stripe, MailguN & AWS S3)
* Create Database: rails db:create
* Migrate Database: rails db:migrate
* Seed Data: rails db:seed
* Start server: rails server 
* Open in your browser and navigate to http://localhost:3000