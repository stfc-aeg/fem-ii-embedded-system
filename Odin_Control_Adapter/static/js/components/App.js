class App {
    constructor() {
        this.mount = document.getElementById("app");
        this.error_message = null;
        this.error_timeout = null;
        this.update_delay = 10;

        apiGET("")
        .done((function (data) {
            this.meta = data;
            this.generate();
            this.init();
            this.updateTimer = setTimeout(this.update.bind(this), this.update_delay * 1000);
        }).bind(this))
        .fail(this.setError.bind(this));

    }

    //Construct page and call components to be constructed
    generate() {
        this.documentBody = document.getElementsByTagName("body")[0];

        //Create error bar
        var error_bar = document.createElement("div");
        error_bar.classList.add("error-bar");
        this.mount.appendChild(error_bar);
        this.error_message = document.createTextNode("");
        error_bar.appendChild(this.error_message);

        //
        var container = document.createElement("div");
        container.id = "femii-container";
        container.innerHTML = "";
        this.branches = {}
        for(var branchName in this.meta) {
            this.branches[branchName] = new Branch(this, branchName, this.meta[branchName]);
            container.innerHTML += this.branches[branchName].generate();
        }
        this.mount.appendChild(container);

        //Add footer
        var footer = document.createElement("div");
        footer.classList.add("footer");
        footer.innerHTML = `
<p>
    Odin server: <a href="https://github.com/stfc-aeg/odin-control">github.com/stfc-aeg/odin-control</a>
</p>
<p>
    API Version: ${api_version}
</p>`;
        this.mount.appendChild(footer);
    }

    init() {
        for(var branchName in this.meta) {
            this.branches[branchName].init();
        }   
    }

    update() {
        apiGET("")
            .done((function(data) {
                for(var branchName in this.branches) {
                    this.branches[branchName].update(data[branchName]);
                }
                this.updateTimer = setTimeout(this.update.bind(this), this.update_delay * 1000);
            }).bind(this))
            .fail(this.setError.bind(this));
    }

    put(path, val) {
        apiPUT(path, val)
            .done(
                clearTimeout(this.updateTimer),
                this.update()
            )
            .fail(this.setError.bind(this));
        return;
    }
    
    setError(data) {
        if (data.hasOwnProperty("json")) {
            var json = data.responseJSON;
            if (json.hasOwnProperty("error"))
                this.showError(json.error);
        }
        else {
            this.showError(data.responseText);
        }
    }

    showError(msg) {
        if (this.error_timeout !== null)
            clearTimeout(this.error_timeout);
        this.error_message.nodeValue = `Error: ${msg}`;
        this.error_timeout = setTimeout(this.clearError.bind(this), 5000);
    }

    clearError() {
        this.error_message.nodeValue = "";
    }
}

//Create the App() instance
function initApp() {
    var app = new App();
}