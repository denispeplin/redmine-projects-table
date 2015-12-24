
console.log("Hello from doc!");
$(document).ready(function() {
    $('.tree').treegrid({
        'initialState': 'collapsed',
        'saveState': true
    });
    console.log("Hello from tree!");
});