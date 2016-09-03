<my-messages>
    <p>メッセージ</p>
    <p>{messages}</p>
    <form onsubmit={ add }>
        <input name="txtMessage">
        <button >GO</button>
    </form>

    <script>
    var RiotControl = require('riotcontrol');
    var MessageStore = require('../scripts/stores/MessageStore');
    var SampleAction = require('../scripts/actions/SampleAction');
    var self = this;

    self.messages = [];
    self.messages.push("a");
    self.messages.push("b");
    self.messages.push("c");

    RiotControl.on(MessageStore.Action.Changed, function(messages){
        self.messages = messages;
    });

    add(e) {
        SampleAction.SetMessage(this.txtMessage.value);
        this.txtMessage.value = '';
    }
    </script>
</my-messages>