# Entrega Ex3-2 N3

## Publisher - Subscriber

Utilitzant RabbitMQ com a element imprescindible crea una queue on una classe Publisher publiqui missatges que siguin llegits per una classe Subscriber. Mostra l'emissió i recepció de cada missatge en consoles diferents

## Sol·lució
Utilizant RabbitMQ s'han creat dues classes Publisher i Subscriber.
Aquestes son clases molt simples que implementent el tutorial de hello world the RabbitMQ per publicar/llegir missatges.
Es suposa que el server de Rabbit MQ esta engegat en el localhost amb el seu port per defecte.

Per provar la sol·lució s'ha d'executar

    npm i

Després s'han d'obrir dos terminal i executar

TERMINAL 1

    node app.js receiver

TERMINAL 2

    node app.js sender

D'aquesta manera, tots els missatges que s'enviin a través del terminal del sender es veuran escrits en l'altre terminal.