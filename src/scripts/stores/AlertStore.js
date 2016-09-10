var riot = require('riot');
var RiotControl = require('riotcontrol');

var Store = function (){
    riot.observable(this);
    var self = this;

   self.alerts = [];
   self.ids = 0;

   self.get = function(){ return self.alerts; };

   self.Action = {
       Add: "AlertStore_Add",
       Remove: "AlertStore_Remove",
       Changed: "AlertStore_Changed"
   };

   
   self.on(self.Action.Add,function(message, opt){
       var info = {};
       info.id = self.ids++;
       info.m = message;
       self.alerts.push(info);
       if(opt){
           if("t" in opt){
               setTimeout(function() {
                   self.trigger(self.Action.Remove, info.id);
               }, opt.t);
           }
       }
       self.trigger(self.Action.Changed);
   });

   self.on(self.Action.Remove,function(id){
       for (var index = 0; index < self.alerts.length; index++) {
           if(self.alerts[index].id == id){
               self.alerts.splice(index, 1);
           }
       }
       self.trigger(self.Action.Changed);       
   });

}

var store = new Store();
RiotControl.addStore(store);
module.exports = store;