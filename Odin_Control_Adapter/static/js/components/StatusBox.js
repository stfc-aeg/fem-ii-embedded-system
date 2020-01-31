class StatusBox {
    constructor(app, path, data) {
        this.app = app;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.value = data;
    }
    generate() {
        var ret = `
<div class="status" id="${this.id}">${this.value}</div>`;
        return ret;
    }
    init(){
        this.element = document.getElementById(this.id);
    }
    update(data) {
        if(data === this.value) return;
        this.value = data;
        this.element.innerHTML = this.value;
    }
}
