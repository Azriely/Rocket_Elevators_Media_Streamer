# README

## Project Description
This week our task is to implement various APIs to add more features to our Rocket Elevator website.

#### Instructional Video
This video gives a brief explanation of the process for using various APIs on our website.
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

- Google Maps: We used ``` gem 'geocoder' ``` m to convert the addresses to latitude and longitude
- Twilio: We used gem ``` 'gem 'twilio-ruby', '~> 5.61.0' ``` to integrate twilio to our apps
- Slack: We used gem ``` gem 'slack-notifier' ``` to integrate slack to our apps
- Dropbox: We used gem ``` gem 'dropbox_api' ``` to integrate slack to our apps
- SendGrid: We used gem ``` gem 'sendgrid-ruby' ``` and ``` gem 'sendgrid-actionmailer' ```  to integrate Sendgrid to our apps
- Amazon Polly: We used gem ``` gem 'aws-sdk-polly' ``` to integrate Amazon Polly to our apps
- Zendesk: We used gem ``` gem "zendesk_api" ``` to integrate slack to our apps

Custom API's created for the project (instructions for working with the custom API's are in the readme of each API repository)

- REST API - <em>https://github.com/Azriely/Rocket_Elevators_REST_API</em>
- GraphQL API - <em>https://github.com/Azriely/Rocket_Elevators_GraphQL</em>


### Ruby / Rails version
We used Ruby 2.6.6 and Ruby on Rails 5.2.6
