// N1 E1
// Crea una funció que retorni una Promise que invoqui la funció resolve() o reject() que rep.
// Invoca-la passant-li les dues funcions de manera que imprimeixin un missatge diferent depenent de si la Promise es resol o no.

function doCombat(youWin){

    const combat = new Promise((resolve, reject) => {
        if (youWin) {
            resolve("You win!");
        } else {
            reject(new Error("You loose!"));
        }

    });

    return combat;
}

doCombat(true)
    .then ( res => { console.log(res) })
    .catch ( err => { console.log(err.message) })

doCombat(false)
    .then ( res => { console.log(res) })
    .catch ( err => { console.log(err.message) })


// N1 E2
// Crea una arrow function que rebi un paràmetre i una funció callback i li passi a la funció 
// un missatge o un altre (que s'imprimirà per consola) en funció del paràmetre rebut.

let phrase = sentence => console.log(`Peter, ${sentence}`);

const peterPhrase = (relative, callback) => {
    if (relative === "Ben") {
        callback("a great power comes with a great responsibility")
    }
    if (relative === "May") {
        callback("you let your uncle die, litle bastard!")
    }
}


peterPhrase("Ben", phrase);
peterPhrase("May", phrase);


// N2 E1
// Donats els objectes employees i salaries, crea una arrow function getEmployee() que retorni una Promise efectuant la cerca en l'objecte pel seu id.

let employees = [{
    id: 1,
    name: 'Linux Torvalds'
}, {
    id: 2,
    name: 'Bill Gates'
},{
    id: 3,
    name: 'Jeff Bezos'
}];
 
let salaries = [{
    id: 1,
    salary: 4000
}, {
    id: 2,
    salary: 1000
}, {
    id: 3,
    salary: 2000
}];


let getEmployee = (id) => {

    return new Promise((resolve, reject) => {
        for (let i = 0; i < employees.length; i++){
            if (employees[i].id === id) {
                resolve (employees[i]);
            }
        }
        reject (new Error(`This id: ${id} does not correspond to any employee`));
    });
};


for (let i = 1; i <= 4; i++) {
    getEmployee(i)
    .then (res => { console.log(res);})
    .catch (err => {console.log(err.message);})
}


// // N2 E2
// // Crea una altra arrow function getSalary() similar a l'anterior que rebi com a paràmetre un objecte employee i retorni el seu salari.
let getSalary = (employee) => {

    return new Promise ((res, rej) => {
        for (let i = 0; i < salaries.length; i++){
            if (salaries[i].id === employee.id) {
                res (salaries[i].salary);
            }
        }
        rej(new Error (`This employee ${employee} does not work for this company`));

    });
};

for (let i = 1; i <= 4; i++) {
    getEmployee(i)
    .then (res => {
        getSalary(res)
        .then (sal => {
                console.log(`This employee ${res.name} earns ${sal} $`);
            })
        .catch (err => {console.log(err.message);});
    })
    .catch (err => {console.log(err.message);});
}



// N2 E3
// Invoca la primera funció getEmployee() i després getSalary() niant l'execució de les dues promises.

// Already done in N2 E2


// N3 E1
// Fixa un element catch a la invocació del nivell anterior que capturi qualsevol error i el mostri per la consola.

// Already done in N2 E2

export.getEmployee = getEmployee;
export.getSalary = getSalary;