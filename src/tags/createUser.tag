<my-createuser>
    <p>{test}</p>
    <form onsubmit={ add }>
        <input name="txtMessage">
        <button >GO</button>
    </form>

    <script>
    var self = this;
    
    self.test = 'kame';

    add(e) {
        self.test = this.txtMessage.value; 
        this.txtMessage.value = '';
    }
    </script>
</my-createuser>