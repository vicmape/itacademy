const User = require('./User');
const Topic = require('./Topic');

// Create Users
const user1 = new User("user 1");
const user2 = new User("user 2");
const user3 = new User("user 3");

// Create topics
const topic1 = new Topic("topic 1");
const topic2 = new Topic("topic 2");

// Subscribe users to topics
user1.subscribe(topic1);
user2.subscribe(topic2);
user3.subscribe(topic2);

// Send messages
console.log()
user1.sendMessage(topic1, "hola");
console.log()
user2.sendMessage(topic2, "pajarito");
console.log()
user3.sendMessage(topic2, "sin cola");

