class Branch {
    constructor(app, path, data) {
        this.app = app;
        this.id = path;
        this.data = data;
    }
    generate() {
        this.leaves = {}
        var body = `
<div id=${this.id}>
    <h3>${this.id}</h3>`
        for(var leaf in this.data) {
            this.path = `${this.id}/${leaf}`;
            if (this.id == "status"){
                this.leaves[leaf] = new StatusBox(this.app, this.path, this.data[leaf]);
            } else if (this.id == "control"){
                this.leaves[leaf] = new StatusButton(this.app, this.path, this.data[leaf]);
            } else {
                this.leaves[leaf] = new Button(this.app, this.path, this.data[leaf]);
            }
            body += this.leaves[leaf].generate();
        }           
        body += `</div>`
        return body
    }
    init(){
        for(var leaf in this.leaves) {
            this.leaves[leaf].init()
        }
    }
    update(data) {
        for(var leaf in this.leaves) {
            this.leaves[leaf].update(data[leaf])
        }
    }
}