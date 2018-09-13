# gds-hubot

gds-hubot is the [Hubot](https://hubot.github.com/) running on the GDS Slack.

## Enabled plugins

See the full list in [external-scripts.json](external-scripts.json).

- **`hubot-github-repo-event-notifier`**. Notifies whenever there's a new PR
  opened on a monitored GitHub repository.
- **`hubot-heroku-keepalive`**. Prevents the bot from falling asleep in Heroku.
- **`hubot-pager-me`**. Connects to PagerDuty. Makes the bot tell
  `#govuk-2ndline` when there's an alert. Also adds commands to query who's
  on call.
- **`hubot-standup-alarm`**. Provides configurable alarms for your standup every
  day.

## Deployment

gds-hubot is hosted on Heroku. [Auto-deploy](https://devcenter.heroku.com/articles/github-integration#automatic-deploys)
has been set up, so the app is deployed immediately after pushing to master /
merging a pull request.

## Adding pull request alerts for your project

- Create a new webhook for your `myuser/myrepo` repository at:
https://github.com/myuser/myrepo/settings/hooks/new

- Add the url: http://gds-hubot.herokuapp.com/hubot/gh-repo-events?room=<room>
(Don't forget to urlencode the room name, especially for IRC. Hint: # = %23)

(taken from [here](https://github.com/hubot-scripts/hubot-github-repo-event-notifier/blob/master/src/github-repo-event-notifier.coffee#L8-L15))

## Sleeping on Heroku

As this app is hosted on a free dyno, it will sleep for six hours a day. We've
configured a cron job to wake up Hubot at 6am.

## Documentation

The original README is at [docs/HUBOT-README.md](docs/HUBOT-README.md).

## Licence

[MIT License](LICENCE)
