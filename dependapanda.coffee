module.exports = (robot) ->
  robot.hear /dependapanda me up/i, (res) ->
    room = res.message.room
    robot.http("https://govuk-dependencies.herokuapp.com/slack/notify/#{room}/#{process.env.DEPENDAPANDA_SECRET}")
      .post() (err, res, body) ->
        if res.statusCode == 200
          console.log(body)
        else
          console.log("Request unsuccessful, http code was #{res.statusCode}")
