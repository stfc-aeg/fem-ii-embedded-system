class Branch {
    constructor(adapter, path) {
        this.adapter = adapter;
        this.id = path;
    }

    generate(data) {
        this.leaves = {}
        var sorted = [];
        var body = `
<div id=${this.id}">
    <h3>${this.id.replace(/^\w/, c => c.toUpperCase())}</h3>
    <div class="branch-container">`

        for(var leaf in data) {
            this.path = `${this.id}/${leaf}`;
            if (this.id == "status"){
                this.leaves[leaf] = new StatusBox(this.adapter, this.path, data[leaf]);
            } else if (this.id == "control"){
                if (this.path == "control/SELECTED_FLASH_DEVICE") {
                    this.leaves[leaf] = new NumberButton(this.adapter, this.path, data[leaf]);
                } else {
                    this.leaves[leaf] = new StatusButton(this.adapter, this.path, data[leaf]);
                }
            } else if (this.id == "reset"){
                this.leaves[leaf] = new Button(this.adapter, this.path, data[leaf]);
            } else if (this.path == "files/program"){
                this.leaves[leaf] = new FileSelect(this.adapter, this.path, data[leaf]);           
            } else {
                this.leaves[leaf] = new FileUpload(this.adapter, this.path, data[leaf]);                          
            }
            sorted.push({path:this.path, body:this.leaves[leaf].generate()});
        }

        sorted = sorted.sort(function(a, b){return ((a.path<b.path)?-1:1)})
        var includesSELECTED_FLASH_DEVICE = null;
        while (sorted.length > 0) {
            if (sorted[0].path == "control/SELECTED_FLASH_DEVICE"){
                includesSELECTED_FLASH_DEVICE = sorted.shift().body;
            } else {
                body += sorted.shift().body;
            }
        }

        if (includesSELECTED_FLASH_DEVICE) {
            body  += `
    </div>
    <div class="branch-container">
    ${includesSELECTED_FLASH_DEVICE}`
        }

        body += `
    </div>
</div>`
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