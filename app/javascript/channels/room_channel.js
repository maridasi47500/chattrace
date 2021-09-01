/*
 * decaffeinate suggestions:
 * DS102: Remove unnecessary code created because of implicit returns
 * Full docs: https://github.com/decaffeinate/decaffeinate/blob/master/docs/suggestions.md
 */
App.room = App.cable.subscriptions.create("RoomChannel", {

  connected() {},

    // Called when the subscription is ready for use on the server


  disconnected() {},

    // Called when the subscription has been terminated by the server

  received(data) {
    return $('#conversation-messages').append(data['message']);
  },

  speak(message) {

    return this.perform('speak', {message: message});
  }
}
);

$(document).on('keypress', '#sendingMessage', function(event) {

  if (event.keyCode === 13) { // return/enter = send

    App.room.speak([mysender.value, myreceiver.value,event.target.value]);

    event.target.value = '';

    return event.preventDefault();
  }
});
