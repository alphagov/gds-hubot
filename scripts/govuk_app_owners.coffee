# This script teaches Hubot to answer questions like "Who owns Collections Publisher?"
# and "Who owns publishing-api?"
module.exports = (robot) ->
  robot.hear /who owns (.*)\?/i, (res) ->
    # Best guess of the intended application.
    application = res.match[1].replace(/ /g, '-').toLowerCase()
    console.log("Fetching owner for #{application}")

    robot.http("https://docs.publishing.service.gov.uk/apps/#{application}.json")
      .get() (err, response, body) ->
        if response.statusCode == 200
          data = JSON.parse(body)
          res.reply "<#{data.links.html_url>}|#{data.app_name}> is owned by <#{data.team}>"
