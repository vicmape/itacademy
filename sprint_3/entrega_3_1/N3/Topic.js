const EventEmitter = require('events')

class Topic extends EventEmitter {
    constructor(name){
        super();
        this.name = name;
    }

    messageReceived(message){
        this.emit(this.name, message);
    }
}

module.exports = Topic;
