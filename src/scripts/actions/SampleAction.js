var RiotControl = require('riotcontrol');
var MessageStore = require('../stores/MessageStore');

var Action = {};

Action.SetMessage = function(message){
    RiotControl.trigger(MessageStore.Action.SetMessage, message);
};

module.exports = Action;