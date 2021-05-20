# Ruby Project
## Valera Online(Rails Starter Project)

## Install PostgreSQL
sudo apt install postgresql<br>
sudo gem install pg<br>
sudo -u postgres psql -c "ALTER USER postgres PASSWORD 'postgres';"<br>
sudo -u postgres createdb rails_starter_project_development<br>

### Install
```bash
bundle install

## Run program
```bash
rails s

## Run test
```bash
bundle exec rspec

## Run rubocop
```bash
rubocop
