
class User {
    constructor(name) {
        this.name = name;
    }

    subscribe(topic) {
        console.log(`${this.name} subscribed to ${topic.name}`)
        topic.on(topic.name, arg => {
            console.log(`${this.name} RECEIVED message "${arg}" from ${topic.name}`);
        }) 
    }

    sendMessage(topic, message) {
        console.log(`${this.name} SEND message "${message}" to ${topic.name}`);
        topic.messageReceived(message);
    }
}

module.exports = User;
