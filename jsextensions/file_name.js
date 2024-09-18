autowatch = 1;

function bang() {
    // outlet(0, getPath(patcher, '/' + this.patcher.name));
    outlet(0, getRoot(patcher).name)
}

function getPath(p, path) {
    if (p.parentpatcher) {
        path = "/" + p.parentpatcher.name + path;
        return getPath(p.parentpatcher, path);
    }
    else return path;
}

function getRoot(p) {
    if (p.parentpatcher) {
        return getRoot(p.parentpatcher);
    }
    return p;
}