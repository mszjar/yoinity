# Yoinity

Audio articles and podcasts. Write a post, have it read aloud, or record your own voice over someone else's writing.


## What it does

- **Posts** — long-form written articles with cover images, categories and full-text search
- **Text-to-speech** — any post can be played as audio, generated on demand via AWS Polly
- **Remixes** — record your own voice reading someone else's post, up to 3 per post
- **Ephemeral remixes** — recordings that expire
- **Social** — follow authors, like and rate posts, comment with threaded replies, save for later
- **Profiles** — public author pages at `/@nickname`
- **Subscriptions** — paid tiers via Stripe

## Stack

| | |
|---|---|
| Ruby | 3.3.5 |
| Rails | 7.1.6 |
| Database | PostgreSQL |
| Front end | Hotwire (Turbo + Stimulus), Bootstrap 5, SCSS |
| Asset build | Webpack via jsbundling-rails |
| Auth | Devise |
| Authorization | Pundit |
| Search | pg_search |
| File storage | Active Storage — local disk in dev, S3 in production |
| Text-to-speech | AWS Polly |
| Payments | Stripe |
| Admin | RailsAdmin at `/admin` |

## Getting started

### Requirements

- Ruby 3.3.5 (via rbenv or rvm)
- PostgreSQL 12+
- Node 18+ and Yarn

### Setup

```bash
git clone git@github.com:mszjar/yoinity.git
cd yoinity

bundle install
yarn install

rails db:create db:migrate db:seed
```

### Run

```bash
bin/dev
```

Then open http://localhost:3000

`bin/dev` runs Rails and the Webpack watcher together via `Procfile.dev`. Running `rails s` on its own will serve the app unstyled with no working Stimulus controllers.

### Seed accounts

`db:seed` creates three users with posts, comments and follows:

| Email | Password |
|---|---|
| mario@email.com | mario1234 |
| marco@email.com | marco1234 |
| juan@email.com | juan1234 |

To reach `/admin`, promote a user in the console:

```bash
rails c
User.first.update(admin: true)
```

## Environment variables

The app boots and runs locally without any of these — images save to local disk, and the features below simply fail when used. Create a `.env` in the project root to enable them.

```bash
# Text-to-speech and production file storage
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
AWS_BUCKET=

# Subscriptions
STRIPE_SECRET_KEY=
STRIPE_WEBHOOK_SECRET=

# Production only
DOMAIN=
REDIS_URL=
RAILS_MASTER_KEY=
YOINITY_DATABASE_PASSWORD=
```

`.env` is gitignored. Never commit it.

Without AWS credentials, the "listen" button on a post raises an error — everything else works normally.

## Project layout

```
app/
├── controllers/     21 controllers
├── models/          17 models
├── policies/        Pundit authorization rules
├── services/        PollyClient — text-to-speech wrapper
├── javascript/
│   └── controllers/ 13 Stimulus controllers
├── views/           88 ERB templates
└── assets/
    └── stylesheets/ SCSS, Bootstrap-based
```

Posts are routed by a generated token rather than an ID, under `/p/:token`.

## Common tasks

```bash
rails db:reset              # drop, create, migrate, seed
rails c                     # console
rails routes | grep post    # find a route
yarn build                  # one-off asset build
```

## Troubleshooting

**`bundle install` fails building a native gem**

Missing C/C++ toolchain. On Fedora:

```bash
sudo dnf install -y gcc-c++ postgresql-devel
```

On Ubuntu/Debian:

```bash
sudo apt install -y build-essential libpq-dev
```

**`PG::ConnectionBad: database "yoinity_development" does not exist`**

```bash
rails db:create db:migrate
```

**`ActiveRecord::PendingMigrationError`**

```bash
rails db:migrate
```

**Page loads but has no styling, buttons do nothing**

You started with `rails s`. Use `bin/dev`.

**`db:seed` hangs or errors on avatars**

The seeds fetch placeholder avatars from an external service that is sometimes down. Comment out the `URI.open(Faker::Avatar.image)` lines in `db/seeds.rb` and re-run — the seed data is otherwise unaffected.

**Port 3000 already in use**

```bash
lsof -ti:3000 | xargs kill -9
```

## Upgrade status

Migrated from Ruby 3.1.2 / Rails 7.0.4 in August 2026. `config.load_defaults` is still set to `7.0` — the framework defaults are being flipped forward separately from the gem upgrade.

Remaining work:

- [ ] Flip `load_defaults` to 7.1
- [ ] Rails 7.2
- [ ] Rails 8.0
- [ ] Replace Webpack with importmap or esbuild
- [ ] Replace generated test stubs with real tests

## License

All rights reserved.
