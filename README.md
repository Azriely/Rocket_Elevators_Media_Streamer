# README

## Project Description
This is the completed Foundations project for Rocket elevators. Included is a custom Ruby on Rails web application.

#### Instructional Video
This video gives an overview of this weeks specific requirements that have been added to the project.
Link: <em>https://youtu.be/GwItoYtCmFQ</em>

### Back Office Admin Logins
Nicolas Genest | CEO | nicolas.genest@codeboxx.biz | password: password

Nadya Fortier | Director | nadya.fortier@codeboxx.biz | password: password

Martin Chantal | Director Assistant | martin.chantal@codeboxx.biz | password: password

Mathieu Houde | Captain | mathieu.houde@codeboxx.biz | password: password

Abdul Akeeb | Developer | abdul.akeeb@codeboxx.biz | password: password

Timothy Wever | Developer | timothy.wever@codeboxx.biz | password: password

Krista Sheely | Developer | krista.sheely@codeboxx.biz | password: password 


### Instructions

Open your ubuntu terminal and run this command to install the dependencies:

```bundle install```

Third, run this command to set up your databases:

```rails db:setup```

Finally, run this command:

```rails server ```

You can now see the website at a web browser at localhost:3000


### API's implemented:

- Google Maps: Used gem ``` gem 'geocoder' ``` m to convert the addresses to latitude and longitude
- Twilio: Used gem ``` 'gem 'twilio-ruby', '~> 5.61.0' ``` to integrate twilio to our apps
- Slack: Used gem ``` gem 'slack-notifier' ``` to integrate slack to our apps
- Dropbox: Used gem ``` gem 'dropbox_api' ``` to integrate slack to our apps
- SendGrid: Used gem ``` gem 'sendgrid-ruby' ``` and ``` gem 'sendgrid-actionmailer' ```  to integrate Sendgrid to our apps
- Amazon Polly: Used gem ``` gem 'aws-sdk-polly' ``` to integrate Amazon Polly to our apps
- Zendesk: Used gem ``` gem "zendesk_api" ``` to integrate slack to our apps

Custom API's created for the project (instructions for working with the custom API's are in the readme of each API repository)

- REST API - <em>https://github.com/Azriely/Rocket_Elevators_REST_API</em>
- GraphQL API - <em>https://github.com/Azriely/Rocket_Elevators_GraphQL</em> (complete bonus objectives)


### Ruby / Rails version
Used Ruby 2.6.6 and Ruby on Rails 5.2.6
