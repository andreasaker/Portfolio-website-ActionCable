App.projects = App.cable.subscriptions.create "ProjectsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("Called")
    # Called when there's incoming data on the websocket for this channel
    if data.destroy
      console.log("destroyed")
      $('#pro_'+data.id).remove()
    else
      console.log("received")
      $('.row #projects').append @renderProject(data)

  renderProject: (data) ->
    '<p id="pro_'+data.id+'"><b>' + data.name + '</b><br />' + data.desc + '<br /><a href="'+data.url+'">Go to website</a> <a href="/projects/'+data.id+'/show">Show</a> <a href="/projects/'+data.id+'/edit">Edit</a> <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/projects/'+data.id+'">Destroy</a></p>'
