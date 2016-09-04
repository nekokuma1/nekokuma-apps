<my-user>

    <my-alert on='1' m='hhg'></my-alert>

    <div class="container-fluid">
        <div class="row">
            <div class='col-md-6'>
                <div class="panel panel-default">
                    <div class="panel-heading">User Info</div>
                    <div class="panel-body">
                    
                        <form onsubmit={ upd }>
                            <div class="form-group">
                                <label>UserName</label>
                                <input type="text" class="form-control" name="__name" value='{user.name}'/>
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

    var self = this;
    
    self.user = UserStore.get();

    RiotControl.on(UserStore.Action.Changed, function(){
        self.user = UserStore.get();
        self.update();
        alert("updated");
    });

    upd(e) {
        console.log(e);
        var m = util.getModel(e.target);
        UserAction.SetUserInfo(m);
        //util.clearForm(e.target);
    }
    </script>
</my-user>