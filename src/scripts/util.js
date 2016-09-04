var util = {};

util.getModel = function(form){
    var m = {};
    
    for (var index = 0; index < form.length; index++) {
        var input = form[index];
        if(input.name.indexOf("__") == 0){
            var n = input.name.replace( /__/g , "" );
            m[n] = input.value;
        }
    }
    return m;
};

util.clearForm = function(form){
    for (var index = 0; index < form.length; index++) {
        var input = form[index];
        if(input.name.indexOf("__") == 0){
            var n = input.name.replace( /__/g , "" );
            input.value = '';
        }
    }
};


module.exports = util;