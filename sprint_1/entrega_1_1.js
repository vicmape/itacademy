/******************************************************************************************/

// Nivell 1 - Exercici 1
// Crea una funció que mostri per consola el nom d'usuari al invocar-la passant-li el nom com a paràmetre.

function printName(name) {
    console.log(name);
}

printName("Victor Machado");

/******************************************************************************************/

// Nivell 2 - Exercici 1
// Mostra per consola el nom i cognoms de l'usuari mitjançant template literals, guardant-los en variables i referenciant-les en la impressió del missatge.

function printNameLiterals(name, surname) {
    console.log(`Hi there, my name is ${name} ${surname}`);
}

printNameLiterals("Victor", "Machado");

/******************************************************************************************/

// Nivell 2 - Exercici 2
// Invoca una funció que retorni un valor des de dins d'una template literal.

function getWelcomeMessage() {
    let message= "We are doing the level 2, exercise 2";
    return `${message}`;
}

console.log(getWelcomeMessage());

/******************************************************************************************/

// Nivell 3 - Exercici 1
// Crea una matriu de deu funcions i emplena-la mitjançant un bucle de manera que cada funció compti del 0 al 9 per la consola.
// Invoca cada funció de l'array iterativament.
// Haurà de mostrar-se per consola el compte del 0 al 9 deu vegades.

function count() {
    for (let i = 0; i < 10; i++) {
        console.log(i);
    }
}

var arr = Array(10).fill(count);

for(let i = 0; i < arr.length; i++) {
    console.log(`Iteration ${i+1}`);
    arr[i]();
}

/******************************************************************************************/

// Nivell 3 - Exercici 2
// Crea una funció anònima autoinvocable igualada a una variable que mostri per consola el nom de l'usuari rebut com a paràmetre.

const naming = function(name) { console.log(name); };
var x = naming("Victor");
