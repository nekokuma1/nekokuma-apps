var RiotControl = require('riotcontrol');
var MessageStore = require('../stores/MessageStore');

var Action = {};

Action.SetNekoMessage = function(message){
    RiotControl.trigger(MessageStore.Action.SetMessage, message);
};

module.exports = Action;