class StatusButton {
    constructor(adapter, path, data) {
        this.adapter = adapter;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.value = data;
    }

    generate() {
        var ret = `
<button id="${this.id}" type="button" class="btn ${(this.value == 0) ? "status-warn" : "status-ok"}" >${this.id}</button>`;
        return ret;
    }

    init(){
        this.element = document.getElementById(this.id);
        this.element.addEventListener("click", this.onClick.bind(this));
    }

    update(data) {
        if(data === this.value) return;
        this.value = data;
        if (data == 0) {
            this.element.classList.remove("status-ok");
            this.element.classList.add("status-warn");
        } else {
            this.element.classList.add("status-ok");
            this.element.classList.remove("status-warn");
        }
    }

    onClick() {
        this.adapter.put(this.path, JSON.stringify(!this.value));
    }
}
