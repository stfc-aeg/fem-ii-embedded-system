class Adapter {
    constructor(app, path) {
        this.app = app;
        this.id = path;
    }

    generate(data) {
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
        for(var branch in this.branches) {
            this.branches[branch].init()
        }
    }

    update(data) {
        for(var branch in this.branches) {
            this.branches[branch].update(data[branch])
        }
    }

    put(path, val) {
        return new Promise((resolve) => {
            this.app.put(this.id, path, val)
        });
    }
}