<my-messages>
    <p>メッセージ</p>
    <ul>
        <li style="list-style: none;" each={ messages }>{ message }</li>
    </ul>
    <form onsubmit={ add }>
        <input name="txtMessage">
        <button>GO #{ messages.length + 1 }</button>
    </form>

    <script>
    var RiotControl = require('riotcontrol');
    var MessageStore = require('../scripts/stores/MessageStore');
    var SampleAction = require('../scripts/actions/SampleAction');
    var self = this;

    self.messages = [];

    RiotControl.on(MessageStore.Action.Changed, function(messages){
        self.messages = messages;
    });

    add(e) {
        var message = e.target[0]
        SampleAction.SetMessage(message.value);
        this.txtMessage.value = '';
    }
    </script>
</my-messages>