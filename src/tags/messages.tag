<my-messages>
    <p>メッセージ</p>
    <form onsubmit={ add }>
        <input name="txtMessage">
        <button >GO</button>
    </form>

    <script>
    var RiotControl = require('riotcontrol');
    var MessageStore = require('../scripts/stores/MessageStore');
    var SampleAction = require('../scripts/actions/SampleAction');
    var self = this;

    add(e) {
        SampleAction.SetNekoMessage(this.txtMessage.value);
        this.txtMessage.value = '';
    }
    </script>
</my-messages>