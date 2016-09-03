<my-messages>
    <p>メッセージ</p>
    <form onsubmit={ add }>
        <input name="txtName">
        <button >GO</button>
    </form>

    <script>
    var RiotControl = require('riotcontrol');
    var MessageStore = require('../scripts/stores/MessageStore');
    var SampleAction = require('../scripts/actions/SampleAction');
    var self = this;

    add(e) {
        this.txtName.value = '';
    }
    </script>
</my-messages>