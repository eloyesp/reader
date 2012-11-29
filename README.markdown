# Reader #

Should be a RSS reading system which looks and works like google Reader UI.

## Technologies ##

- Ruby on Rails:
  - Ruby version 1.9.3
  - Rails version 3.2.9
- Database:
  - PostgreSQL with ActiveRecord.
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

It also allows you to login ussing gmail or twitter, if there is a user with the
same email account, it will use the same.

The user can also upload an avatar, that is displayed in the navbar when logged
in. The avatar is cropped to different sizes. (I added 30x30 because it looks
nice in the navbar).

Users have a profile, that limit how many channels can have. This attribute is
protected for security reasons.

### Suscription ###

Instead of channels, the user manage suscriptions (that delegate to channel when
appropiate).

Channels validates correctness of the supplied feed url and, fetch articles
after creations ussing a FeedFetcher. This class is the only one related to
fetching to ease changing the fetcher and parser mechanism (SimpleRSS actualy),
and to ease testing.

### Article ###

Articles are commentable and can be marked with a star. They are updated each 5
minutes (ussing cron with whenever)

### SEARCH ###

Search is implemented with pg_search (that depends on Postgre only), it could be
improved, but depends on the version of Postgre that the production machine has.
The results are displayed but need some helper class for make them display nicer.

### CUSTOM 404 ###

The page redirect to root and show a warning message.

### ACTIVE ADMIN ###

There is an active admin panel, it is not customized.

### DEPLOYMENT ###

The prerequisites of the app are: rvm, postgresql (> 8.3), imagemagick (with
wand) and cron.
There are to configure database user, enviroment variables for oauth
authorization (see `config/initializer/devise.rb`), mail and the web-server.

## TODO ##

- Add section where only starred articles are showed
- Customize ActiveAdmin panel.
- The user should customize cropping to fit the face.
- The user need a way to upgrade or downgrade the account, but this is related
  with billing, and is not implemented
- The specs use DatabaseCleaner and transactional fixtures. That smells.
- The articles are not displayed with html_safe, so it should be corrected. this
whould be done implementing HTMLEntities in the FeedFetcher class.
- FeedFetcher should not give access to items directly, it should give access to
somethin like an article (but AR could be slow).
- The link to add or remove stars should be extracted to a helper, and used on
  index of articles.

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

## License ##

MIT

