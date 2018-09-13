{WebClient} = require "@slack/client"

module.exports = (robot) ->
  robot.hear /dependapanda me up/i, (res) ->
    web = new WebClient robot.adapter.options.token
    web.channels.list().then (api_response) ->
      room = api_response.channels.find (channel) -> channel.id is res.message.room
      if room?
        room = room.name
      else
        console.log("Could not translate #{res.message.room} into a Slack channel name")
      robot.http("https://govuk-dependencies.herokuapp.com/slack/notify/#{room}/#{process.env.DEPENDAPANDA_SECRET}")
        .post() (err, res, body) ->
          if res.statusCode == 200
            console.log(body)
          else
            console.log("Request unsuccessful, http code was #{res.statusCode}")
