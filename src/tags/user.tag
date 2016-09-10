<my-user>
    <div class="container-fluid">
        <div class="row">
            <div class='col-md-6'>
                <div class="panel panel-default">
                    <div class="panel-heading">User Info</div>
                    <div class="panel-body">
                    
                        <form onsubmit={ upd }>
                            <div class="form-group">
                                <label>UserName={user.name}</label>
                                <input type="text" class="form-control" name="__name" value=''/>
                            </div>
                            <div class="form-group">
                                <label>Bikou={user.bikou}</label>
                                <input type="text" class="form-control" name="__bikou" />
                            </div>

                            <div class="form-group">
                                <label>Ahiru={user.ahiru}</label>
                                <input type="text" class="form-control" name="__ahiru" />
                            </div>

                            <button class='btn btn-primary'>Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    var RiotControl = require('riotcontrol');
    var util = require('../scripts/util');
    var UserStore = require('../scripts/stores/UserStore');
    var UserAction = require('../scripts/actions/UserAction');
    var SampleAction = require('../scripts/actions/SampleAction');


    var self = this;
    
    self.user = UserStore.get();
    
    self.on('mount', function(){
        UserStore.on(UserStore.Action.Changed, function(){
            self.user = UserStore.get();
            util.alert("added:" + self.user.name);
            self.update();
        });
    });

    upd(e) {
        var m = util.getModel(e.target);
        UserAction.SetUserInfo(m);
        //util.clearForm(e.target);
    }
    </script>
</my-user>