var riot = require('riot');
var RiotControl = require('riotcontrol');

var Store = function (){
    riot.observable(this);
    var self = this;

   self.__model = {
       name:"",
       group:[]
   };
   self.get = function(){ return self.__model; };

   self.Action = {
       SetInfo: "UserStore_SetInfo",
       Changed: "UserStore_Changed"
   };


   self.on(self.Action.SetInfo,function(info){       
       for (var key in self.__model) {
           if(key in info){
               self.__model[key] = info[key];
           }
       }
       self.trigger(self.Action.Changed, self.get());
   });

}

var store = new Store();
RiotControl.addStore(store);
module.exports = store;