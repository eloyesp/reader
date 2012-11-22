# Reader #

Should be a RSS reading system which looks and works like google Reader UI.

## Generation ##

This application was generated with the ["rails_apps_composer"][1] gem provided
by the ["RailsApps Project"][2].

  [1]: https://github.com/RailsApps/rails_apps_composer   "rails_apps_composer"
  [2]: http://railsapps.github.com/                       "RailsApps Project"

h2. Diagnostics

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
- Testing Framework: RSpec and Factory Girl and Cucumber
- Test coverage: SimpleCov
- Front-end Framework: Twitter Bootstrap (Sass)
- Authentication: Devise
- Email: The application is configured to send email using a Gmail account.

## Deployment instructions ##

TODO

## License ##

MIT

