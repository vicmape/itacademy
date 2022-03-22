// N1 E1
// Mostra per la consola el resultat d'una arrow function autoinvocable que sumi dos nombres.

const arrowFuncSum = (a, b) => a + b;

console.log(arrowFuncSum(2,3));

/******************************************************************************/

// N2 E1
// Crea una arrow function que, rebent un paràmetre, retorni un objecte amb un atribut que tingui com a valor el paràmetre rebut.

const arrowFuncObj = (param) => ({name: param});
let myObj = arrowFuncObj("Victor");

console.log("This is the object: ", myObj);
console.log(`This is the object attribute's value: ${myObj["name"]}`);

/******************************************************************************/

// N2 E2
// Crea una classe Persona que rebi un paràmetre 'nom' al ser instanciada.
// La classe inclourà un mètode dirNom que imprimeixi per consola el paràmetre 'nom'.
// Invoca el mètode dirNom des de fora de la classe.

class Persona {
    constructor (nom) {
        this.name = nom;
    }
    
    dirNom() {
        console.log(this.name);
    }
}

const p1 = new Persona("Victor");
const p2 = new Persona("Kirito");

p1.dirNom();
p2.dirNom();

/******************************************************************************/

// N3 E1
// Escriu una function creadora d'objectes que faci instàncies d'una classe abstracta.
// Invoca-la amb diferents definicions.

class Animal {
    constructor(name) {
        if (this.constructor === Animal) {
            throw new Error("Abstract class Animal can't be instantiated.");
        }
        this.name = name;
    }

    printName() {
        console.log(`This animal is called ${this.name}`);
    }
}

function createAnimalInstance() {
    return Animal.prototype;
}

let dog = createAnimalInstance();
dog.name = "Ruffy";
dog.printName();

let cat = createAnimalInstance();
cat.name = "Kyo";
cat.printName();

console.log("*** THE END ***");
