var riot = require('riot');
var RiotControl = require('riotcontrol');

var Store = function (){
    riot.observable(this);
    var self = this;

   self.Messages = [];

   self.__model = {

       messages:[]
   };

   self.get = function(){return self.__model;};

   self.Action = {
       SetMessage: "MessageStore_SetMessage",
       Changed: "MessageStore_Changed"
   };
   //メッセージを受け取ってアクションする
   self.on(self.Action.SetMessage,function(info){

       setTimeout(function() {
        self.__model.messages.push(info);
        self.trigger(self.Action.Changed);    
       }, 1000);

   });

}

var store = new Store();
RiotControl.addStore(store);
module.exports = store;