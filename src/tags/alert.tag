<my-alert>
    <div class="alert alert-warning" if={visible}>
        <button type="button" class="close" onclick={ close }>&times;</button>
        {opts.m}
    </div>

    <script>
    var self = this;
    self.visible = opts.visible;
    close(e){
        self.visible = false;
    }
    </script>
</my-alert>