<my-alert>
    <div class="alert alert-warning" if={opts.on == 1}>
        <button type="button" class="close" onclick={ close }>&times;</button>
        {m}
    </div>

    <script>
    var self = this;

    self.on = opts.on;
    self.m = opts.m;

    close(e){
        self.on = 0;
        opts.on = 0;
        this.update();
    }
    </script>
</my-alert>