class FileUpload {
    //Create a control for uploading files
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
            //Disable interactivity till upload finished
            self.adapter.app.setEnabled(0);
            //Extract the file name
            this.fileName =  self.elementFile.files.item(0).name;
            //Split the file into chunks of approximately 1MB
            this.fileChunks = btoa(evt.target.result).match(/.{1,1000000}/g);

            //Setup the progress bar
            self.progressBar.max = (this.fileChunks.length + 1);
            self.progressBar.value = 0;
            self.progressContainer.hidden = false;

            //Send the setup put command telling the server the filename and number of chunks
            self.adapter.put(self.path,
                 JSON.stringify([(-1*(this.fileChunks.length)), this.fileName]))
                 .then(self.progressBar.value += 1);

            //Send the chunks including their position in the file
            var promises = [];
            for (var i = 0; i < this.fileChunks.length;i++) {
                promises.push(
                    self.adapter.put(self.path, JSON.stringify([i, this.fileChunks[i]]))
                    .then(setTimeout(function(){ self.progressBar.value += 1 }, i * 400))
                );
            }

            //When all chunks have been sent call fulfil
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
        //enable interactivity and hide the progress bar
        this.adapter.app.setEnabled(1);
        this.progressContainer.hidden = true;
    }

    onClick() {
        //read in the selected file as binary then calls readers onload function
        this.reader.readAsBinaryString(this.elementFile.files[0]);
    }

}
