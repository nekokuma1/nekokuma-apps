var riot = require('riot');
var RiotControl = require('riotcontrol');

var Store = function (){
    riot.observable(this);
    var self = this;

   self.Message = [];

   self.Action = {
       SetMessage: "MessageStore_SetMessage",
       Changed: "MessageStore_Changed"
   };
   //メッセージを受け取ってアクションする
   self.on(self.Action.SetMessage,function(message){
       self.Message.push(message);
       self.trigger(self.Action.Changed, messages);
   });

}

var store = new Store();
RiotControl.addStore(store);
module.exports = store;