var riot = require('riot');
var RiotControl = require('riotcontrol');

var Store = function (){
    riot.observable(this);
    var self = this;


}

var store = new Store();
RiotControl.addStore(store);
module.exports = store;