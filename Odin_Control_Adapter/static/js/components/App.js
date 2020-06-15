class App {
    constructor() {
        this.mount = document.getElementById("app");
        this.error_message = null;
        this.error_timeout = null;
        this.update_delay = 5;
        this.adapters = {};
        this.main_adapter="fem"

        //Retrieve metadata for each adapter
        var meta = {};
        var promises = adapters.map(
            function(adapter){
                return apiGET(adapter, "").then(
                    function(data){
                        meta[adapter] = data;
                    })
            }
        );

        //Then generate the page and start the update loop
        $.when.apply($, promises)
        .then(
            (function() {
                this.generate(meta);
                this.init(meta);
                this.updateTimer = setTimeout(this.update.bind(this), this.update_delay * 1000);
            })
        .bind(this));
    }

    //Construct page and call components to be constructed
    generate(meta) {
        this.documentBody = document.getElementsByTagName("body")[0];

        var header = document.createElement("div");
        header.classList.add("header");
        header.innerHTML = `<img class="logo" src="img/UKRI_STF_Council-Logo_Horiz-RGB.png">
        <h2>FEM-II</h2>`;
        this.mount.appendChild(header);

        //Create error bar
        var error_bar = document.createElement("div");
        error_bar.classList.add("error-bar");
        this.mount.appendChild(error_bar);
        this.error_message = document.createTextNode("");
        error_bar.appendChild(this.error_message);

        //Create progress bar
        var container = document.createElement("div");
        container.id = "femii-container";
        container.innerHTML = `<div id="prog_container" hidden>
            <label for="prog_bar">Downloading progress:</label>
            <progress id="prog_bar" value="10" max="10"></progress>
        </div>
        `;
        //Create adapters
        for(var adapter in meta) {
            adapters[adapter] = new Adapter(this, adapter);
            container.innerHTML += adapters[adapter].generate(meta[adapter]);
        }
        this.mount.appendChild(container);

        //Add footer
        var footer = document.createElement("div");
        footer.classList.add("footer");
        /*footer.innerHTML = `
<p>
Odin server: <a href="https://github.com/stfc-aeg/odin-control">github.com/stfc-aeg/odin-control</a>
<br/>API Version: ${api_version}
</p>`; */
        this.mount.appendChild(footer);
    }

    init(meta) {
        //setup all adapters
        for (var adapter in meta){
            adapters[adapter].init();
        }
    }

    update(adapter=this.main_adapter) {
        //update selected adapter controls from the server
            apiGET(adapter, "")
            .done((function(data) {
                adapters[adapter].update(data);
                if (adapter==this.main_adapter) {
                    this.updateTimer = setTimeout(this.update.bind(this), this.update_delay * 1000);
                }
            }).bind(this))
            .fail(this.setError.bind(this));
    }

    put(adapter, path, val) {
        //promisify out command
        return (apiPUT(adapter, path, val)
        .done(
            this.update(adapter)
        )
        .fail(this.setError.bind(this)))
    }

    setEnabled(state){
        //allow or block user interactivity
        if (state == 0) {
            $("#femii-container").addClass("disabled");
        } else {
            $("#femii-container").removeClass("disabled");
        }
    
    }

    setError(data) {
        //handle json versus non json errors
        if (data.hasOwnProperty("json")) {
            var json = data.responseJSON;
            if (json.hasOwnProperty("error"))
                console.log(json.error)
                this.showError(json.error);
        } else {
            this.showError(data.responseText);
        }
    }

    showError(msg) {
        //show errors on the error bar
        if (typeof msg == 'undefined') msg = 'Connection to Odin Server lost'
        if (this.error_timeout !== null)
            clearTimeout(this.error_timeout);
        this.error_message.nodeValue = `Error: ${msg}`;
        this.error_timeout = setTimeout(this.clearError.bind(this), 10000);
    }

    clearError() {
        //clear the error bar
        this.error_message.nodeValue = "";
    }
}

//Create the App() instance
function initApp() {
    var app = new App();
}