class NumberButton {
    //create a number selector with button for SELECTED_FLASH control
    constructor(adapter, path, data) {
        this.adapter = adapter;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.value = data;
    }

    generate() {
        var ret = `
<div>
    <label id ="lbl_${this.id}" class=lbl lbl_control >${this.id}: ${this.value}</label>
    <input id="num_${this.id}" type="number" class="input_num" min="0" max="3" value=${this.value}></button>
    <button id="btn_${this.id}" type="submit" class="btn" >Update</button>
</div>`;

        return ret;
    }

    init(){
        this.elementLbl = document.getElementById(`lbl_${this.id}`);
        this.elementNum = document.getElementById(`num_${this.id}`);
        this.elementBtn = document.getElementById(`btn_${this.id}`);
        this.elementBtn.addEventListener("click", this.onClick.bind(this));

    }

    update(data) {
        if(data === this.value) return;
        this.value = data;
        this.elementLbl.innerHTML = `${this.id}: ${this.value}`;
    }

    onClick() {
        this.adapter.put(this.path, this.elementNum.value);
    }
}
    