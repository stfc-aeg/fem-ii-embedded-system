//Provides basic functions for the odin server
var api_version = "0.1";
var adapters = [];

function initAPI() {
    //Get the current api version and adapters

    return $.ajax("/api", {
        method: "GET",
    })

    .then( 
        function(data)
        {
            api_version = JSON.parse(data)["api"];
        }
    )
       
    .then( 
        function ()
        {
            return $.ajax(`/api/${api_version}/adapters`, {
                method: "GET",
            });
        }
    )

    .then(
        function(data)
        {
            adapters = data.adapters;
        }
    );
}

function apiGET(adapter, path, metadata=false) {
    // constructs an ajax get command for the given adapter and path
    return $.ajax(`api/${api_version}/${adapter}/${path}`, {
        method: "GET",
        dataType: "json",
        accepts: {
            json: metadata ? "application/json;metadata=true" : "application/json"
        }
    });
}

function apiPUT(adapter, path, data) {
    // constructs an ajax put command for the given adapter, path and data
    return $.ajax(`api/${api_version}/${adapter}/${path}`, {
        method: "PUT",
        contentType: "application/json",
        processData: false,
        data: data
    });
}