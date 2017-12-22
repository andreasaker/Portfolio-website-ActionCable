App.projects = App.cable.subscriptions.create "ProjectsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.destroy
      $('#pro_'+data.id).hide()
    else
      $('#projects').append @renderProject(data)

  renderProject: (data) ->
    '<p id="pro_'+data.id+'"><b>' + data.name + '</b> <a href="/projects/'+data.id+'/show">Show</a> <a href="/projects/'+data.id+'/edit">Edit</a> <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href="/projects/'+data.id+'">Destroy</a></p>'
