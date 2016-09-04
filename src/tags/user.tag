<my-user>
    <p>{user.name}</p>
    <form onsubmit={ upd }>
        <input name="__name">
        <button >GO</button>
    </form>

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
    });

    upd(e) {
        console.log(e);
        var m = util.getModel(e.target);
        UserAction.SetUserInfo(m);
        util.clearForm(e.target);
    }
    </script>
</my-user>