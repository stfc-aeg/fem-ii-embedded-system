class FileUpload {
    constructor(adapter, path, data) {
        this.adapter = adapter;
        this.id = path.split("/").reverse()[0];
        this.path = path;
        this.value = data;
        this.reader = new FileReader();    
    }

    generate() {
        var ret = `
<div>
    <label id ="lbl_${this.id}" class=lbl lbl_control >Bin File to Upload</label>
    <input id="file_${this.id}" name="file1" type="file" class="input_file"()></input>
    <button id="btn_${this.id}" type="submit" class="btn" >Upload</button>
</div>`;

        return ret;
    }

    init() {
        const self = this;
        this.elementFile = document.getElementById(`file_${this.id}`);
        this.elementBtn = document.getElementById(`btn_${this.id}`);
        this.progressContainer = document.getElementById(`prog_container`);
        this.progressBar = document.getElementById(`prog_bar`);
    
        this.elementBtn.addEventListener("click", this.onClick.bind(this));
        this.reader.onload = function(evt) {
            self.adapter.app.setEnabled(0);
            this.fileName =  self.elementFile.files.item(0).name;
            this.fileChunks = btoa(evt.target.result).match(/.{1,1000000}/g);
            self.progressBar.max = (this.fileChunks.length + 1);
            self.progressBar.value = 0;
            self.progressContainer.hidden = false;
            self.adapter.put(self.path,
                 JSON.stringify([(-1*(this.fileChunks.length)), this.fileName]))
                 .then(self.progressBar.value += 1);
            var promises = [];
            for (var i = 0; i < this.fileChunks.length;i++) {
                promises.push(
                    self.adapter.put(self.path, JSON.stringify([i, this.fileChunks[i]]))
                    .then(setTimeout(function(){ self.progressBar.value += 1 }, i * 400))
                );
            }
            $.when.apply($, promises)
                .then(self.fulfil())
        };
    }
    
    update(data) {
        if (data === this.value) return;
        this.value = data;
        this.element.innerHTML = this.value;
    }

    fulfil(){
        this.adapter.app.setEnabled(1);
        this.progressContainer.hidden = true;
    }

    onClick() {
        this.reader.readAsBinaryString(this.elementFile.files[0]);
    }

}
