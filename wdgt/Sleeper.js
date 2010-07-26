var sleepTO;
var updateTO;

//window.widget.remove = init;
window.onfocus = focus;
window.onblur = blur;

function focus() {
    document.getElementById("entry").style.opacity = 1.0;
    document.getElementById("status").style.opacity = 1.0;
    document.getElementById("cancel-button").style.opacity = 1.0;
    setTimeout("document.getElementById(\"amount\").focus()",100);
}
function blur() {
    document.getElementById("entry").style.opacity = 0.75;
    document.getElementById("status").style.opacity = 0.75;
    document.getElementById("cancel-button").style.opacity = 0.75;
}

function init() {
    document.getElementById("entry").style.display = "block";
    document.getElementById("status").style.display = "none";
    document.getElementById("cancel-button").style.display = "none";
    clearTimeout(updateTO);
    clearTimeout(sleepTO);
}

function setDelay() {
    var amount = parseInt(document.getElementById("amount").value);
    var multiplier = parseInt(document.getElementById("unit").value);

    if( isNaN(amount*multiplier) ) { return; }
   
    document.getElementById("entry").style.display = "none";
    document.getElementById("status").style.display = "block";
    document.getElementById("cancel-button").style.display = "block";
    sleepTO = setTimeout("sleep()", amount*multiplier*60*1000);
    update(amount*multiplier);
}

function update(delayInMinutes) {
    document.getElementById("status").innerHTML = 'Sleeping in '+delayInMinutes+' minute' + (delayInMinutes==1 ? '' : 's');
    updateTO = setTimeout("update("+(delayInMinutes-1)+")", 60*1000);
}

function sleep() {
    init();
    Sleeper.sleepIn();
}
