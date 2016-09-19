var riot = require('riot');
var RiotControl = require('riotcontrol');

var Store = function (){
    riot.observable(this);
    var self = this;

   self.__model = {
       name:'kame',
       group:[]
   };
   self.get = function(){ return self.__model; };

   self.Action = {
       SetInfo: "UserStore_SetInfo",
       Changed: "UserStore_Changed"
   };


   self.on(self.Action.SetInfo,function(info){
       var changeData = {};  // 変更点を収集
       for (var key in self.__model) {
           if(key in info){
               changeData[key] = info[key];
           }
       }

       // api にて 更新したとして
       setTimeout(function() {
           for (var key in changeData) {
               self.__model[key] = changeData[key];
           }

           fetch('/api/users?a=b')
            .then(function(response) {
                return response.json()
            })
            .then(function(json) {
                console.log('parsed json', json.aa)
            })
            .catch(function(ex) {
                console.log('parsing kame failed', ex)
            });

           self.trigger(self.Action.Changed);    
       }, 0);
       
   });

}

var store = new Store();
RiotControl.addStore(store);
module.exports = store;