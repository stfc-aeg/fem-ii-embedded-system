class FileSelect {
    //Adds control for programming the selected flash on the FEM with the selected bin file
    constructor(adapter, path, data) {
        this.adapter = adapter;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.values = data;
    }

    generate() {
        var ret = `
<div>
    <label id ="lbl1_${this.id}" class=lbl lbl_control >${this.id}</label>
    <select id="sel_${this.id}" class="select"></select>
    <label id ="lbl2_${this.id}" class=lbl lbl_control >Select Flash</label>
    <input id="num_${this.id}" type="number" class="input_num" min="1" max="4" value=1></input>
    <button id="btn_${this.id}" type="submit" class="btn">Configure</button>
</div>`;

        return ret;
    }

    init() {
        this.elementSel = document.getElementById(`sel_${this.id}`);
        this.elementNum = document.getElementById(`num_${this.id}`);
        this.elementBtn = document.getElementById(`btn_${this.id}`);
        this.elementBtn.addEventListener("click", this.onClick.bind(this));
        this.populateSel();
    }

    update(data) {
        if (data === this.values) return;
        this.values = data;
        this.populateSel();
    }

    onClick() {
        this.payload = [this.elementSel.options[this.elementSel.selectedIndex].text, this.elementNum.value]
        this.adapter.put(this.path, JSON.stringify(this.payload));
    }

    populateSel() {
        this.elementSel.innerHTML = ``;
        for (var i in this.values) {
            var option = document.createElement("option");
            option.text = this.values[i]
            this.elementSel.add(option)
        }
    }
}
