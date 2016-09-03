var util = {};

util.getModel = function(form){
    var m = {};
    for(key in form){
        if(key.indexOf("__") == 0){
            var n = key.replace( /__/g , "" );
            m[n] = form[key].value;
        }
    }
    return m;
};

module.exports = util;