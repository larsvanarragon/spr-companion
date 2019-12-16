var loadedTikzJax = false;
var timer;

// Anonymous "self-invoking" function
(function() {
    var startingTime = new Date().getTime();
    // Load the script
    var script = document.createElement("SCRIPT");
    script.src = 'http://tikzjax.com/v1/tikzjax.js';
    script.type = 'text/javascript';
    script.onload = function() {
    	var $ = window.jQuery;
      $(function() {
            var endingTime = new Date().getTime();
            var tookTime = endingTime - startingTime;
            loadedTikzJax = true;
            console.log("Loaded TikzJax in " + tookTime + " milliseconds!");
        });
    };
    document.getElementsByTagName("head")[0].appendChild(script);
})();

$('body').on("DOMSubtreeModified", function() {
    var scripts = document.getElementsByTagName('script');
    var tikzScripts = Array.prototype.slice.call(scripts).filter(
        (e) => (e.getAttribute('type') === 'text/tikz'));
    
    if (tikzScripts.length > 0 && loadedTikzJax) {
        clearTimeout(timer);
        timer = setTimeout(doExecuteTikz, 1000);
    }
});

async function doExecuteTikz() {
    await window.onload();
}