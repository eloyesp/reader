# Reader #

Should be a RSS reading system which looks and works like google Reader UI.

## Generation ##

This application was generated with the ["rails_apps_composer"][1] gem provided
by the ["RailsApps Project"][2].

  [1]: https://github.com/RailsApps/rails_apps_composer   "rails_apps_composer"
  [2]: http://railsapps.github.com/                       "RailsApps Project"

This application was built with recipes that are known to work together, but
with preferences that not.

### Recipes ###

``` ruby
["controllers", "core", "email", "extras", "frontend", "gems", "git", "init",
"models", "prelaunch", "railsapps", "readme", "routes", "saas", "setup",
"testing", "views"]
```

### Preferences ###

``` ruby
{ :git=>true, :railsapps=>"none", :dev_webserver=>"webrick", :database=>"sqlite",
  :templates=>"haml", :unit_test=>"rspec", :integration=>"cucumber",
  :fixtures=>"factory_girl", :frontend=>"bootstrap", :bootstrap=>"sass",
  :email=>"gmail", :authentication=>"devise", :devise_modules=>"confirmable",
  :authorization=>"none", :form_builder=>"none", :starter_app=>"users_app",
  :ban_spiders=>true, :jsruntime=>true }
```

## Technologies ##

- Ruby on Rails:
  - Ruby version 1.9.3
  - Rails version 3.2.9
- Database:
  - This application uses SQLite with ActiveRecord.
- Template Engine: Haml
- Testing Framework:
  - RSpec
  - Factory Girl
  - Cucumber.
- Autotesting: Spork and Guard.
- Test coverage: SimpleCov
- Front-end Framework: Twitter Bootstrap (Sass)
- Authentication: Devise
- Email: The application is configured to send email using a Gmail account.

## Models ##

### User ###

The user model use devise with a custom login that ask for email or login
(username), and require some user data like both names.
It also allows you to login ussing gmail or twitter.
The user can also upload an avatar, that is displayed in the navbar when logged
in. The avatar is cropped to different sizes. (I added 30x30 because it looks
nice in the navbar).

## TODO ##

- User:
  - Profile type
    - basic - 10 channels
    - medium - 20 channels
    - premium - 100 channels
- Channels list:
  - User can have many channels
  - CRUD
  - channel attributes
    - valid URL to RSS/Atom
    - URL  should respond 200 OK response code from HTTP protocol
    - feed should contain valid RSS/Atom (not html, text, etc.)
  - channel name (title)
    - take channel name from \<title\>\</title\>
    - User can edit channel title
- Articles list
  - channel has many articles
  - articles are fetched automatically
  - Article attributes:
    - Title
    - link
    - description
    - pubDate
  - user can leave comments for each article
  - user can mark article with a star
  - Update feeds each 5 minutes (cron)
- Add search by article and channel:
  - summary
  - title
- Add section where only starred articles are showed
- Custom Page 404
  - redirect to index with flash message
- Add ActiveAdmin panel.
- Write instructions how to deploy via capistrano on production server.
- Send emails to user by cron
  - one time a day
  - 5 last feeds
- The user should customize cropping to fit the face.

## License ##

MIT

