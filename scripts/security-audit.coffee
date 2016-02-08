CronJob = require('cron').CronJob

module.exports = (robot) ->
  runAudit = ->
    exec = require('child_process').exec
    command = "bash scripts/security-audit-finding-things.sh"

    exec command, (error, stdout, stderr) ->
      if error
        robot.messageRoom '#finding-things', "Hello! I have found a security vulnerability in one of the repos: ```#{stdout}```"
      else
        robot.messageRoom '#finding-things', "I've run a security audit, and there are no known vulnerabilities. :ok_hand:"

  robot.respond /audit/i, (res) ->
    res.send "Okay, running audit! This can take a while."
    runAudit()

  # Run at eight in the morning.
  new CronJob('0 8 * * *', runAudit, null, true);
