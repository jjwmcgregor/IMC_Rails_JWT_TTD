# Sparta User Management Console API

This app is my attempt at replicating the current UMC in a 3-tier structure

#### Tier 1 - View
This will be built using React and Redux

#### Tier 2 - API
This will be built using Rails, and tested as much as possible using the tutorial from [Scotch](scotch.io).

```bash
rails new UMC_API --api -T -d postgresql
```

Extra gems:
```ruby
gem 'bcrypt', '~> 3.1.7'
gem 'jwt'
gem 'active_model_serializers', '~> 0.10.0'
gem 'will_paginate', '~> 3.1.1'
gem 'faker'

group :development, :test do
  # [...]
  gem 'rspec-rails', '~> 3.5'
end

group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
  gem 'database_cleaner'
end
```

#### Tier 3 - Database
PostgreSQL to begin with, for convenience
Probably No-SQL when deployed
