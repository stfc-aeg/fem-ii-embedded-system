class Adapter {
    constructor(app, path) {
        this.app = app;
        this.id = path;
    }

    generate(data) {
        //create a container for the adapter then fill it with the parmeter tree branches
        this.branches = {};
        var body = `
        <div id=${this.id}">`
        for(var branchName in data) {
            this.branches[branchName] = new Branch(this, branchName);
            body += this.branches[branchName].generate(data[branchName]);
        }
        return body;
    }

    init(){
        //setup the branches
        for(var branch in this.branches) {
            this.branches[branch].init()
        }
    }

    update(data) {
        //update the branches
        for(var branch in this.branches) {
            this.branches[branch].update(data[branch])
        }
    }

    put(path, val) {
        //put command for known adapter
        return new Promise((resolve) => {
            this.app.put(this.id, path, val)
        });
    }
}