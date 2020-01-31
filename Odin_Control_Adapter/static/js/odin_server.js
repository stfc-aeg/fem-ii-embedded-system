var api_version = "0.1";
var adapter = "femii"

function initAPI()
{
    //Get the current api version and adapters

    return $.ajax("/api", {
        method: "GET",
    })

    .then( 
        function(data)
        {
            api_version = data.api_version;
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
            adapter = data.adapters[0];
        }
    );
}

function apiGET(path, metadata=false)
{
    return $.ajax(`api/${api_version}/${adapter}/${path}`, {
        method: "GET",
        dataType: "json",
        accepts: {
            json: metadata ? "application/json;metadata=true" : "application/json"
        }
    });
}

function apiPUT(path, data)
{
    return $.ajax(`api/${api_version}/${adapter}/${path}`, {
        method: "PUT",
        contentType: "application/json",
        processData: false,
        data: JSON.stringify(data)
    });
}