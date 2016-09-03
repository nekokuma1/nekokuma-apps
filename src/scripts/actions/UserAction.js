var RiotControl = require('riotcontrol');
var UserStore = require('../stores/UserStore');

var Action = {};

Action.SetUserInfo = function(info){
    RiotControl.trigger(UserStore.Action.SetInfo, info);
};

module.exports = Action;