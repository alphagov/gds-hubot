# This script teaches Hubot to answer questions like "Who owns Collections Publisher?"
# and "Who owns publishing-api?"
module.exports = (robot) ->
  robot.hear /who owns (.*)\?/i, (res) ->
    # Best guess of the intended application.
    application = res.match[1].replace(' ', '-').toLowerCase()

    robot.http("https://docs.publishing.service.gov.uk/apps/#{application}.json")
      .get() (err, response, body) ->
        if response.statusCode == 200
          data = JSON.parse(body)
          res.reply "#{application} is owned by #{data.team}"
