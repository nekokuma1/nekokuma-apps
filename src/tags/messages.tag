<my-messages>
    <p>メッセージ</p>
    <div class="panel panel-default">
        <div class="panel-heading">Let's Talk♬</div>
        <div class="panel-body">
            <ul>
                <li style="list-style: none; margin-left: -20px;" each={ messages }>{ message }</li>
            </ul>
        </div>
    </div>
    <form onsubmit={ add }>
        <input name="__message">
        <button>GO</button>
    </form>

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
    }
    </script>
</my-messages>