#Simply search movie by "Myhubot imdb MovieName"
#Movie details
#
#imdb moviename  gives movie details

module.exports = (robot) ->
  robot.respond /imdb (.*)/i, (msg) ->
    movie_name = escape(msg.match[1])
    msg.http("http://mymovieapi.com/?title=#{movie_name}&type=json&plot=simple&episode=1&limit=1&yg=0&mt=M&lang=en-US&offset=&aka=simple&release=simple&business=0&tech=0")
      .get() (err,res,body) ->
        try
          json=JSON.parse(body)
          msg.send " Title: #{json[0]["title"]} \n
          Release: #{json[0]["year"]}
          Genre: #{json[0]["genres"]} \n
          Rating: #{json[0]["rating"]} \n
          Runtime: #{json[0]["runtime"][0]} \n
          Actors: #{json[0]["actors"]} \n
          Directors: #{json[0]["directors"]} \n
          Plot: #{json[0]["plot_simple"]} "
        catch error
          	msg.send "Not found "
