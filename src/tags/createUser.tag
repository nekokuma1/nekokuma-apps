<my-createuser>
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

    upd(e) {
        var m = util.getModel(this);
        UserAction.SetUserInfo(m);
    }
    </script>
</my-createuser>