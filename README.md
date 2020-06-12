# ProfitoCMS - version 2.0

## BACKGROUND
ProfitoCMS 2.0 is a second, improved version of Profito-Management-App.
It helps managing clients, taxes, benefits, payments, shipments and provides statistics.

Version 2.0 is a Rails + Vue.js hybrid application.

## INSTALLATION

### Dependencies
 - RVM for ruby installation: https://rvm.io/ and install proper ruby version (check in Gemfile)
 - Postgresql 12.2 (i.e. via Homebrew `brew install postgresql`)
 - Redis (i.e. install by `brew install redis` and to launch it `brew services start redis`)

### Setting up the application
```
# After installing dependencies
$ cp config/database.yml.sample config/database.yml
$ bundle
$ rails db:create
$ rails db:migrate
$ rails db:test:prepare
```
### Getting started
Here are some instructions to get started and back in the app.

1. Get the latest code.
  ```
  $ git pull
  $ bundle
  ```

### Starting WebPacker server
```
$ yarn                                            # installs js dependencies
$ bin/webpack-dev-server                          # start webpacker server
```

### Starting Rails server
```
$ rails s
```

### Creating dev admin
```
$ rails c
$ User.create(email: "user@example.com", initials: "UE", admin: true, password: YOUR_PASS_HERE)
```

Then navigate to localhost:3000 in your browser
