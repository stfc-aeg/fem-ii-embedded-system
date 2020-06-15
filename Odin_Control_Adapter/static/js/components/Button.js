class Button {
    //create a button for set only controls
    constructor(adapter, path, data) {
        this.adapter = adapter;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.value = data;
    }

    generate() {
        var ret = `
<button id="${this.id}" type="reset" class="btn" >${this.id}</button>`;
        return ret;
    }

    init(){
        //add a click event to the button
        this.element = document.getElementById(this.id);
        this.element.addEventListener("click", this.onClick.bind(this));
    }

    update(data) {
        if(data === this.value) return;
        this.value = data;
        this.element.innerHTML = this.value;
    }

    onClick() {
        this.adapter.put(this.path, true);
    }
}
