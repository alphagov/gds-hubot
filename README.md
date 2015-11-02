# gds-hubot

gds-hubot is the [Hubot](https://hubot.github.com/) running on the GDS Slack.

## Enabled plugins

See the full list in [external-scripts.json](external-scripts.json).

- **`hubot-pager-me`**. Connects to PagerDuty. Makes the bot tell `#2ndline` when
  there's an alert. Also adds commands to query who's on call.
- **`hubot-heroku-keepalive`**. Prevents the bot from falling asleep.
- **`hubot-standup-alarm`**. Configure an alarm for your standup every day.

## Deployment

gds-hubot is hosted on Heroku. [Auto-deploy](https://devcenter.heroku.com/articles/github-integration#automatic-deploys)
has been set up, so the app is deployed immediately after pushing to master /
merging a pull request.

### Sleeping on Heroku

As this app is hosted on a free dyno, it will sleep for six hours a day. We've
configured a cron job to wake up Hubot at 6AM.

## Documentation

The original readme is found in [docs/HUBOT-README.md](docs/HUBOT-README.md).

## Licence

[MIT License](LICENCE)
