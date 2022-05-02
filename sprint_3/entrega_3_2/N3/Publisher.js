#!/usr/bin/env node
  
var amqp = require('amqplib/callback_api');

class Publisher{

    sendMessage(msg) {
        amqp.connect('amqp://localhost', function(error0, connection) {
            if (error0) {
                throw error0;
            }
            connection.createChannel(function(error1, channel) {
                if (error1) {
                    throw error1;
                }
        
                var queue = 'hello';
        
                channel.assertQueue(queue, {
                    durable: false
                });
        
                channel.sendToQueue(queue, Buffer.from(msg));
            });
        });
    }
}

module.exports = Publisher;