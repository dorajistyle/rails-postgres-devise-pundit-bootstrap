# Rails-Postgres-Devise-Pundit-Bootstrap
  It's a foundation of rails application that uses postgres DB, devise for user login, pundit for policy and bootstrap for views.

## Pre-install

### [PostgreSQL](https://www.postgresql.org)
#### On [Arch linux](https://wiki.archlinux.org/index.php/PostgreSQL)
```bash
pacman -S postgresql
sudo -i -u postgres
initdb --locale en_US.UTF-8 -E UTF8 -D '/var/lib/postgres/data'
posgres -D /var/lib/postgres/data
createuser --interactive [myapp, USERNAME]
createdb myapp_development
sudo cp /usr/lib/systemd/system/postgresql.service /etc/systemd/system/postgresql.service
sudo systemctl enable postgresql
sudo systemctl start postgresql
psql -d myapp_development;
```
##### Tip for mysql user
* show tables : \dt
* desc table : \d+ TABLENAME
* drop table : drop table TABLENAME1, TABLENAME2 ...
* drop all table : drop schema public cascade;create schema public;

### Ruby on Rails
* [rbenv](https://github.com/sstephenson/rbenv)
* [ruby-build](https://github.com/sstephenson/ruby-build#readme)
```bash
rbenv install 2.2.0
rbenv global 2.2.0
gem update --system
gem install bundler
```

## Installation

### Initialize and run server
```bash
git clone https://github.com/dorajistyle/rails-postgres-devise-pundit-bootstrap
.git
bundle install
rake db:setup
rails server
```
### Gem Reconfiguration
When you want to reconfigure gems, execute commands below. 
```bash
rails generate devise:install
rails generate devise User
rails generate formtastic:install
rails generate rspec:install
rails generate bootstrap:install --no-coffeescript
rails generate rails_footnotes:install
rails generate cucumber:install
rails g bootstrap:themed Users
rails g pundit:install
rails g kaminari:views bootstrap3
```

## Gems
* [devise](https://github.com/plataformatec/devise) Flexible authentication solution for Rails with Warden.
* [devise-i18n](https://github.com/tigrish/devise-i18n) Translations for the devise gem
* [rails-i18n](https://github.com/svenfuchs/rails-i18n) Repository for collecting Locale data for Ruby on Rails I18n as well as other interesting, Rails related I18n stuff
* [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails) Twitter Bootstrap for Rails 3.x - 4 Asset Pipeline
* [formtastic-bootstrap](https://github.com/mjbellantoni/formtastic-bootstrap) [Formtastic](https://github.com/justinfrench/formtastic) form builder to generate Twitter Bootstrap-friendly markup.
* [kaminari](https://github.com/amatsuda/kaminari) A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Rails 3 and 4
* [i18n-js](https://github.com/fnando/i18n-js) It's a small library to provide the I18n translations on the Javascript. It comes with Rails support.
* [slim-rails](https://github.com/slim-template/slim-rails) Slim templates generator for Rails 3 and 4
* [pundit](https://github.com/elabs/pundit) Minimal authorization through OO design and pure Ruby classes
* [omniauth](https://github.com/intridea/omniauth) OmniAuth is a flexible authentication system utilizing Rack middleware.

### development, test
* [rspec-rails](https://github.com/rspec/rspec-rails) RSpec for Rails-3+
* [spring-commands-rspec](https://github.com/jonleighton/spring-commands-rspec) This gem implements the rspec command for Spring.
* [cucumber-rails](https://github.com/cucumber/cucumber-rails) Rails Generators for Cucumber with special support for Capybara and DatabaseCleaner
* [database_cleaner](https://github.com/DatabaseCleaner/database_cleaner) Strategies for cleaning databases in Ruby. Can be used to ensure a clean state for testing.
* [spring-cucumber](https://github.com/jonleighton/spring-commands-cucumber) This gem implements the cucumber command
* [forgery](https://github.com/sevenwire/forgery) Easy and customizable generation of forged data.

### development
* [rails-footnotes](https://github.com/josevalim/rails-footnotes) Every Rails page has footnotes that gives information about your application and links back to your editor
* [better_errors](https://github.com/charliesome/better_errors) Better Errors replaces the standard Rails error page with a much better and more useful error page.
* [guard](https://github.com/guard/guard) Guard is a command line tool to easily handle events on file system modifications.
* [guard-sass](https://github.com/hawx/guard-sass) Guard::Sass automatically rebuilds sass files when modified (like sass --watch)
* [guard-livereload](https://github.com/guard/guard-livereload) Guard::LiveReload automatically reload your browser when 'view' files are modified.
* [guard-rspec](https://github.com/guard/guard-rspec) Guard::RSpec automatically run your specs (much like autotest)


## template language
* [Slim](http://slim-lang.com/)


## For Development

### Live reload
```bash
bundle exec guard
```

### Convert erb files to slim
```bash
gem install [html2slim](https://github.com/slim-template/html2slim)
for file in app/views/**/*.erb; do erb2slim $file ${file%erb}slim && rm $file; done
```

### Editor configuration

#### atom editor
Install packages below.
* ruby slim
* rails transporter

## Deployment
Install [Compose](https://docs.docker.com/compose/install/) and execute below. [Reference](https://docs.docker.com/compose/rails/)
```bash
docker-compose build
docker-compose up
docker-compose run web rake db:setup
docker-compose run web rake db:migrate RAILS_ENV=development
```

## Admin
* Username : admin
* Password : password

________________________

## Attributions
Rails-Postgres-Devise-Pundit-Bootstrap is under the [MIT license](./LICENSE)
