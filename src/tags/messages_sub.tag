<my-messages>

<style>
body { padding-bottom: 70px; }
</style>
    <div class="panel panel-default">
        <div class="panel-heading">Let's Talk♬</div>
        <div class="panel-body pre-scrollable " name="_s_message">
            <ul>
                <li style="list-style: none; margin-left: -20px;" each={ messages }>{ message }</li>
            </ul>
        </div>
    </div>
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
    var MessageStore = require('../scripts/stores/MessageStore');
    var SampleAction = require('../scripts/actions/SampleAction');
    var self = this;

    self.messages = MessageStore.get().messages;

    RiotControl.on(MessageStore.Action.Changed, function(){
        self.messages = MessageStore.get().messages;
        self.update();
    });

    add(e) {
        //- var message = e.target[0];
        //- SampleAction.SetMessage(message.value); 
        //- var message = this.txtMessage.value; 
        //- SampleAction.SetMessage(message);
        //- this.txtMessage.value = '';

        var m = util.getModel(e.target);
        SampleAction.SetMessage(m);
        util.clearForm(e.target);
        this._s_message.scrollTop = this._s_message.scrollHeight;
    }
    </script>
</my-messages>