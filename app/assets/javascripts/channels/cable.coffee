#= require action_cable

#= require_self

#= require_tree .

#

@App ||= {}

App.cable = ActionCable.createConsumer("ws://localhost:3000/cable")
