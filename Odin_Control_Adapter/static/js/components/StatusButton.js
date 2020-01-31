class StatusButton {
    constructor(app, path, data) {
        this.app = app;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.value = data;
    }
    generate() {
        if (this.id === "SELECTED_FLASH_DEVICE") {
            var ret = `
<label class=lbl lbl_control >${this.id}</label>
<button id="${this.id}" type="button" class="btn btn_control_flash" >${this.value}</button>
<input id="num_${this.id}" type="number" class="input_num" min="0" max="3" value=${this.value}></button>`;
        } else {
            var ret = `
<label class=lbl lbl_control >${this.id}</label>
<button id="${this.id}" type="button" class="btn btn_control" >${this.value}</button>`;
        }
        return ret;
    }
    init(){
        this.element = document.getElementById(this.id);
        if (this.id === "SELECTED_FLASH_DEVICE") {
            this.numElement = document.getElementById(`num_${this.id}`);
            this.element.addEventListener("click", this.onClickFlash.bind(this));
        } else {
            this.element.addEventListener("click", this.onClick.bind(this));
        }
    }
    update(data) {
        if(data === this.value) return;
        this.value = data;
        this.element.innerHTML = this.value;
    }
    onClick() {
        this.app.put(this.path, +!this.value);
    }
    onClickFlash() {
        this.app.put(this.path, this.numElement.value);
    }
}
    