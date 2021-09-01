App.room = App.cable.subscriptions.create "RoomChannel",

  connected: ->
    # Called when the subscription is ready for use on the server


  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#conversation-messages').append data['message']
    if data['messagereceiver'] == $('#mycurrentuserid').val()
        $("[data-bind=\"text: messageCount, blinking: messageCount\"]").val((Number($("[data-bind=\"text: messageCount, blinking: messageCount\"]").val())+1))
    $('#conversation-messages')[0].scrollIntoView({behavior: "smooth", block: "end", inline: "nearest"})

  speak: (message) ->
    @perform 'speak', message: message

$(document).on 'keypress', '#sendingMessage', (event) ->

  if event.keyCode is 13 # return/enter = send

    App.room.speak [mysender.value, myreceiver.value, event.target.value]

    event.target.value = ''

    event.preventDefault()
