class StatusBox {
    //create a colour changing box for get only controls
    constructor(adapter, path, data) {
        this.adapter = adapter;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.value = data;
    }

    generate() {
        var ret = `
<div class="status ${(this.value == 0) ? "status-warn" : "status-ok"}" id="${this.id}">${this.id}</div>`;
        return ret;
    }

    init(){
        this.element = document.getElementById(this.id);
    }
    
    update(data) {
        //When updating ensure the colour shows the current state
        if(data === this.value) return;
        this.value = data;
        if (data == 0) {
            this.element.classList.remove("status-ok")
            this.element.classList.add("status-warn")
        } else {
            this.element.classList.add("status-ok")
            this.element.classList.remove("status-warn")
        }
    }
}
