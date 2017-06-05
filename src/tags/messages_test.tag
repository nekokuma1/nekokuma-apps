<my-messages-test>
  <mmt-main />
  <mmt-footer />
</my-messages-test>

<mmt-main>
    <div class="panel panel-default">
        <div class="panel-heading">Let's Talk♬</div>
        <div class="panel-body pre-scrollable" name="_s_message">
            <ul class="list-unstyled">
                <li each={ messages }>{ message }</li>
            </ul>
        </div>
    </div>
    <script>
        var RiotControl = require('riotcontrol');
        var MessageStore = require('../scripts/stores/MessageStore');
        var self = this;

        self.messages = MessageStore.get().messages;

        RiotControl.on(MessageStore.Action.Changed, function(){
            self.messages = MessageStore.get().messages;
            self.update();
        });
    </script>
</mmt-main>
<mmt-footer>
    <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="container-fluid">
            <form class="navbar-form navbar-left" onsubmit={ add }>
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="何してる？" name="__message">
                    <button class="btn btn-info btn-sm">GO</button>
                </div>
            </form>
        </div>
    </nav>
    <script>
        var RiotControl = require('riotcontrol');
        var util = require('../scripts/util');
        var SampleAction = require('../scripts/actions/SampleAction');

        add(e) {
         var m = util.getModel(e.target);
            SampleAction.SetMessage(m);
            util.clearForm(e.target);
            this._s_message.scrollTop = this._s_message.scrollHeight;
        }
    </script>
</mmt-footer>

