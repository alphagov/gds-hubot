module.exports = (robot) ->
  robot.hear /seal me up/i, (res) ->
    room = res.message.room
    robot.http("https://moody-seal.herokuapp.com/bark/#{room}/#{process.env.SEAL_SECRET}")
      .post() (err, res, body) ->
        if res.statusCode == 200
          console.log(body)
        else
          console.log("Request unsuccessful, http code was #{res.statusCode}")
