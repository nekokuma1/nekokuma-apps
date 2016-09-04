var riot = require('riot');
var RiotControl = require('riotcontrol');

var Store = function (){
    riot.observable(this);
    var self = this;

   self.Messages = [];

   self.Action = {
       SetMessage: "MessageStore_SetMessage",
       Changed: "MessageStore_Changed"
   };
   //メッセージを受け取ってアクションする
   self.on(self.Action.SetMessage,function(message){
       self.Messages.push({ message: message });
       self.trigger(self.Action.Changed, self.Messages);
   });

}

var store = new Store();
RiotControl.addStore(store);
module.exports = store;