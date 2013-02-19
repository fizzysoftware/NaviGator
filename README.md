NaviGator

## Development Setup

### Clone the repo
```
git clone git@bitbucket.org:fizzysoftware/fizzybar.git
```

### Install dependencies (ensure bundler is installed)
```
cd fizzybar
bundle install
```

CREATE database config (sample config is in config/database.sample.yml)
```
cp config/database_sample.yml config/database.yml
# make the appropirate changes if necessary
```
Setup DB
```
rake db:create
```

rake db:migrate
```

Start the Server
```

# Administration

You can access the admin console by visiting http://localhost:3000/admin
with the below credentials:

* user: admin@example.com
* pass: password

