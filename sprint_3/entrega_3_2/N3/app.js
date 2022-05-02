// Import Publisher and Subscriber classes
const Publisher = require('./Publisher');
const Subscriber = require('./Subscriber');

// Import readline for command line input
var readline = require('readline');
var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Function to recursive ask for new message
function recursiveAsyncReadLine (publisher) {
  rl.question('Write and press Enter to send: ', function (msg) {
    publisher.sendMessage(msg);
    recursiveAsyncReadLine(publisher);
  });
};

// Take the argument to see if we are sender or receiver
var args = process.argv.slice(2);

if (args[0] != null){
    if (args[0] === 'receiver'){
        var subscriber = new Subscriber();
        subscriber.receiveMessages();
    } else if (args[0] === 'sender') {
        var publisher = new Publisher();
        recursiveAsyncReadLine(publisher);
    } else {
        console.log('Wrong argument. Options available: [sender|receiver]');
    }
} else {
    console.log('Wrong argument. Options available: [sender|receiver]');
}