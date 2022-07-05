# EX3-1 N3 Observer

## Enunciat
Escriu una aplicació que creï diferents objectes Usuari. L'aplicació podrà crear diferents Temes i subscriure els usuaris a ells. Quan un Usuari afegeixi un missatge a un Tema s'enviarà una alerta per la consola des del Tema. També ho mostraran per consola cadascun dels Usuaris que estiguin subscrits al Tema (rebran el missatge). Crea un Tema amb un Usuari i un altre amb dos i mostra la recepció dels missatges pels usuaris. Utilitza el mòdul events.

## Sol·lució
Es creen dues classes: User i Topic.
La classe Topic exten la classe EventEmitter i s'encarrega d'emetre els missatges que li envien els usuaris.
La classe User crea un usuari té dos métodes: subscriure's a un Topic i enviar un missatge a un Topic.

Tots els usuaris subscrits a un mateix Topic rebran tots els missatges que els usuaris enviin a aquell topic.

Per provar-ho s'ha d'executar 

    node app.js
