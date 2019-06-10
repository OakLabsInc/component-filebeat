// quick and dirty log generator
const fs = require('fs');
var os = require("os");
var hostname = os.hostname();

function timestamp(){
    return Math.floor(Date.now());
} 

function logmetric(message) {
    logentry = '{"time":' + timestamp() + ',"hostname":"' + hostname + '","msg":' + message + '}';
    fs.appendFile("/persistent/app-metrics.log", logentry + '\n', function (err) {
        if (err) {
            return console.log(err);
        }
        if (process.env.NODE_ENV !== 'production') {
                console.log("Wrote heartbeat to file: " + logentry);
          }
    });
}

function heartbeat() {
    logmetric('{"hearbeat":"Bump."}');
}

setInterval(heartbeat, 1 * 1000); // do this every second
