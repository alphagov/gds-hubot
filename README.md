# gds-hubot

gds-hubot is the [Hubot](https://hubot.github.com/) running on the GDS Slack.

## Deployment

gds-hubot is hosted on Heroku. [Auto-deploy](https://devcenter.heroku.com/articles/github-integration#automatic-deploys)
has been set up, so the app is deployed immediately after pushing to master /
merging a pull request.

### Sleeping on Heroku

As this app is hosted on a free dyno, it will sleep for six hours a day. We've
configured a cron job to wake up Hubot at 6AM.

## Licence

[MIT License](LICENCE)
