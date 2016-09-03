var RiotControl = require('riotcontrol');
var NekoStore = require('../stores/MessageStore');

var Action = {};

Action.SetNekoName = function(name){
    RiotControl.trigger(NekoStore.Action.SetName, name);
};

module.exports = Action;