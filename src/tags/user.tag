<my-user>


    <div class="container-fluid">
        <div class='col-md-6' if={!editable}>
            <div class="panel panel-default">
                <div class="panel-heading">
                    User Info
                    <a class='btn btn-xs btn-success' onclick={edit}>
                        <span class="glyphicon glyphicon-pencil"></span>
                        edit
                    </a>
                </div>
                <div class="panel-body">
                    <p>{user.name}</p>
                    
                </div>
            </div>
        </div>            

        <div class='col-md-6'>
            <div class="panel panel-default" if={editable}>
                <div class="panel-heading">User Info</div>
                <div class="panel-body">
                
                    <form onsubmit={ upd }>
                        <div class="form-group">
                            <label>UserName</label>
                            <input type="text" class="form-control" name="__name" value='{user.name}'/>
                        </div>
                        <button class='btn btn-primary btn-block'>Update</button>
                        <a class='btn btn-warning btn-block' onclick={edit}>キャンセル</a>   
                    </form>
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
    self.editable = false;

    
    self.on('mount', function(){
        UserStore.on(UserStore.Action.Changed, function(){
            self.user = UserStore.get();
            util.alertAuto("ユーザー情報を更新しました。");
            self.editable = !self.editable;
            self.update();
        });
    });

    self.on('unmount',function(){
        UserStore.off(UserStore.Action.Changed);
    });

    upd(e) {
        var m = util.getModel(e.target);
        UserAction.SetUserInfo(m);
        //util.clearForm(e.target);
    }

    edit(e) {
        self.editable = !self.editable;
    }
    </script>
</my-user>