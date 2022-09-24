# Agile Project Manager
[![Tests](https://github.com/xavius-rb/agilepm/actions/workflows/ci.yml/badge.svg)](https://github.com/xavius-rb/agilepm/actions/workflows/ci.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/0ddee7965cacf2f8a8c5/maintainability)](https://codeclimate.com/github/xavius-rb/agilepm/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/0ddee7965cacf2f8a8c5/test_coverage)](https://codeclimate.com/github/xavius-rb/agilepm/test_coverage)

## Development

### With Docker Compose

1. `docker-compose build`
2. `docker-compose run --rm web bin/setup`
3. `docker-compose up`

### As Standalone Image

1. Create a network
`docker network create --driver=bridge agile_network`

2. Start database container (postgres)
`docker run --rm --name postgres --network agile_network --network-alias postgres -v postgres_data:/var/lib/postgresql/data:cached -d postgres:14-alpine`

3. Start Redis container

`docker run --rm --name redis --network agile_network --network-alias redis -d redis:7-alpine`

4. Start Web container

Environment variables - DATABASE_URL is required:
`docker run --rm --network agile_network -p 3000:3000 -e DATABASE_URL=postgresql://myAppuser:myAppDBpassWord@postgres:5432/myapp? agilepm:latest bin/bundle exec puma -C config/puma.rb`


Alternatively, env file can be used:
`docker run --rm --network agile_network -p 3000:3000 --env-file=.env agilepm:latest bin/bundle exec puma -C config/puma.rb`

5. Start Worker container (Sidekiq)

`docker run --rm --network agile_network --env-file=.env agilepm:latest bin/bundle exec sidekiq -C config/sidekiq.yml`
