autowatch = 1;

function getLocationInRoot() {
    var patcher = this.patcher;
    var totalOffset = [0, 0, patcher.box.rect[2], patcher.box.rect[3]];

    while (patcher && patcher.box) {
        var rect = patcher.box.rect; // Get position in parent patcher

        // Accumulate offsets (left, top) while ignoring (right, bottom)
        totalOffset[0] += rect[0]; // Left offset
        totalOffset[1] += rect[1]; // Top offset

        // Move up to the parent patcher
        patcher = patcher.parentpatcher;
    }

    outlet(0, totalOffset);
}

function getPresentationLocationInRoot() {
    var patcher = this.patcher;
	var obj_rect = patcher.box.getboxattr("presentation_rect");
    var totalOffset = [0, 0, obj_rect[2], obj_rect[3]];

    while (patcher && patcher.box) {
        var rect = patcher.box.getboxattr("presentation_rect");

        // Accumulate offsets (left, top) while ignoring (right, bottom)
        totalOffset[0] += rect[0]; // Left offset
        totalOffset[1] += rect[1]; // Top offset

        // Move up to the parent patcher
        patcher = patcher.parentpatcher;
    }

    outlet(0, totalOffset);
}