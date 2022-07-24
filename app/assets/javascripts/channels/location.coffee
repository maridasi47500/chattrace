App.location = App.cable.subscriptions.create "LocationChannel",

  connected: ->

    # Called when the subscription is ready for use on the server


  disconnected: ->

    # Called when the subscription has been terminated by the server


  received: (data) ->

    $('[data-bind="text:page"]').html data['mapage']
    $('[data-bind="text: nbPages"]').html data['nbpages']
    if (data['online'] == 'no')
        h=$(data['urluser']).first()
        if h
            h.parent().remove()
            $('.chatters-list').append(data['user'])
    else
        $(data['urluser']).first().parent().remove()
        $('.chatters-list').prepend(data['user'])
        $('.chatters-list').children().last().remove()
    
    $('[data-bind="text: numberFirstPart"]').html data['nbonlinefirstpart']
    $('[data-bind="text: numberSecondPart"]').html data['nbonlinesecondpart']
    $('.nb-connected-users > .text-guest').html data['nbonlinefirstpart']
    $('.nb-connected-users > .last-numbers').html data['nbonlinesecondpart']


  sayhi: (x) ->

    @perform 'sayhi', nbpages: x

$(window).load ->
  App.location.sayhi($('[data-bind="text:page"]').html())

  event.preventDefault()
