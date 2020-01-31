class Button {
    constructor(app, path, data) {
        this.app = app;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.value = data;
    }
    generate() {
        var ret = `
<button id="${this.id}" type="button" class="btn btn_reset" >${this.id}</button>`;
        return ret;
    }
    init(){
        this.element = document.getElementById(this.id);
        this.element.addEventListener("click", this.onClick.bind(this));
    }
    update(data) {
        if(data === this.value) return;
        this.value = data;
        this.element.innerHTML = this.value;
    }
    onClick() {
        this.app.put(this.path, true);
    }
}
