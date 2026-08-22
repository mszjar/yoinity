# Yoinity

Audio articles and podcasts. Write a post, have it read aloud, or record your own voice over someone else's writing.

[www.yoinity.com](https://www.yoinity.com)

Ruby 3.3.5 · Rails 8.0 · PostgreSQL · Hotwire · Bootstrap 5 · Devise · Pundit

## Setup

Requires Ruby 3.3.5, PostgreSQL, Node 18+ and Yarn.

```bash
bundle install
yarn install
rails db:create db:migrate db:seed
bin/dev
```

Open http://localhost:3000

**Use `bin/dev`, not `rails s`** — the app needs the Webpack watcher running alongside Rails or you get an unstyled page with no working JavaScript.

## Seed accounts

`mario@email.com` / `mario1234` — same pattern for `marco` and `juan`.

For `/admin`, promote yourself: `rails c` then `User.first.update(admin: true)`.

## Environment

Runs fine locally without any of these. Add a `.env` to enable the features that need them.

```bash
AWS_ACCESS_KEY_ID=          # text-to-speech + production file storage
AWS_SECRET_ACCESS_KEY=
AWS_REGION=
AWS_BUCKET=
STRIPE_SECRET_KEY=          # subscriptions
STRIPE_WEBHOOK_SECRET=
RAILS_MASTER_KEY=           # production only
```

## Troubleshooting

**Native gem won't build** — `sudo dnf install gcc-c++ postgresql-devel` (or `apt install build-essential libpq-dev`)

**`database "yoinity_development" does not exist`** — `rails db:create db:migrate`

**Page loads unstyled, buttons dead** — you used `rails s`. Use `bin/dev`.

**`db:seed` hangs on avatars** — comment out the `URI.open(Faker::Avatar.image)` lines in `db/seeds.rb`.

## Notes

Posts are routed by token, not ID: `/p/:token`.

Upgraded from Rails 7.0 in August 2026. Follows are handled by `app/models/concerns/followable.rb`, which replaced the unmaintained `acts_as_follower` gem.
