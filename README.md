# README

 Rocket_Elevators_Media_Streamer

About Week 10 - The marketing department at Rocket Elevators has long been waiting for the opportunity to do media content placement in the company's elevators. To meet their needs, we implement a content delivery module.

This module:

- Reusable library. (in the 'lib' directory of your information system.)
- The TDD is made by using RSpec ( http://rspec.info )
- All the content available and accessible via the getContent method.

Media source:

- Open Weather API: https://openweathermap.org/api

For testing:

Streamer:

- File : ./spec/lib/streamer_spec.rb
- Test command: rspec ./spec/lib/streamer_spec.rb

Unit tests (3 tests):

- File: ./spec/interventions_controller_spec.rb
- Test command: rspec ./spec/interventions_controller_spec.rb


----------------------------------------------------------------------------------------------------------------------------------------------


<h2>Rocky Elevator’s Security Assessment:</h2>

A2:2017 - Broken Authentication:

Currently in the application deployed, the passwords for all of the admin log in’s for the admin back office are seeded into the database. This is a vulnerability under the A2:2017 - Broken Authentication OWASP vulnerabilities code.This could allow for attacks using credential stuffing and also would fall under the “weak or well-known passwords” list.

- To fix this, removing the admin seeds proper to re-deploying the web application would allow for admins to create their own passwords locally.

A3:2017 - Sensitive Data Exposure

Currently the website is not on a strict SSL DNS setting inside of the Cloud Flare account. This makes it possible to request pages using regular HTTP requests.

- To fix this, using a more strict setting in the Cloud Flare account can prevent access to HTTP requests by requiring all requests through HTTPS.


A6:2017 - Security Misconfiguration:

Currently in the application, there are components, documentation and samples from generated default application data that could potentially be used to attack the application.

- To fix this, going through and removing sample files and documentation from the project files before re-deploying would help in the prevention of an attack.


A9:2017 - Using Components with Known Vulnerabilities:

Currently the application is using an outdated version of Ruby on Rails, which could cause  known vulnerabilities to be exposed. Also, checks need to be done in order to verify that all gems and third party implemented API’s are all up to date to avoid potential attacks.

- To fix this, it would be recommended to update ruby to the newest version and redo the application. Also confirming that all third party API’s are updated and any other third party applications used.

A10:2017 - Insufficient Logging & Monitoring:

Currently the application is not logging logins, failed logins etc… This would allow for attackers to potentially go unnoticed.

- To fix this, there needs to be some logging enabled in order for developers to maintain security and keep an eye on suspicious or malicious attacks. 
