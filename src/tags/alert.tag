<my-alert>
    <div each={alerts} class="alert alert-warning" >
        <button type="button" class="close" onclick={ close }>&times;</button>
        {m}
    </div>

    <script>
    var self = this;
    var RiotControl = require('riotcontrol');
    var AlertStore = require('../scripts/stores/AlertStore');


    self.alerts = AlertStore.get();

    RiotControl.on(AlertStore.Action.Changed, function(){
        self.alerts = AlertStore.get();
        self.update();
    });

    self.visible = opts.visible;
    close(e){
        AlertStore.trigger(AlertStore.Action.Remove, e.item.id);
    }
    </script>
</my-alert>