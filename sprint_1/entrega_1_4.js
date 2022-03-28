// N1 E1
// Donats els objectes employees i salaries, crea una arrow function getEmployee que retorni una Promise efectuant la cerca en l'objecte pel seu id.
// Crea una altra arrow function getSalary que rebi com a paràmetre un objecte employee i retorni el seu salari.

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

const getEmployee = (id) => { 

    return new Promise((resolve, reject) => {
        let employee = employees.find(employee => employee.id === id)
        if (employee != undefined) {
            resolve(employee);
        } else {
            reject(new Error(`Error: id ${id} does not correspond to any employee`));
        }
    });

}

const getSalary = (employee) => {
    return salaries.find(id => id.id == employee.id).salary;
}

// employees.length + 1 to generate an error in the calls
// for (let i = 0; i < employees.length + 1; i++) {
//     try {

//         getEmployee(i)
//         .then(res => {
//             console.log(res);
//             console.log(`Salary: ${getSalary(res)}`);
//         })
//         .catch(err => console.log(err.message));
//     } catch (err) {
//         console.log ("This catch here is for top level error catching");
//     }
// }


// N1 E2
// Crea una funció asíncrona que rebi un id d'empleat i imprimeixi per pantalla el nom de l'empleat i el seu salari, usant les funcions que has definit a l'exercici anterior.

async function myEmployee(id) {
    try {
        const employee = await getEmployee(id);
        const salary = await getSalary(employee);
        console.log(`name: ${employee.name}, salary: ${salary}`);
    } catch (err) {
        console.log(err.message);

    }
}
// myEmployee(1);
// myEmployee(2);
// myEmployee(3);
// myEmployee(4);


// N2 E1
// Crea una nova funció asíncrona que cridi a una altra que retorni una Promise que efectuï la seva funció resolve() després de 2 segons de la seva invocació.

function makeDelayedPromise() {
    return new Promise((resolve, reject) => {
        setTimeout( () => {
            resolve("Promise solved after 2 sec");
        }, 2000);
    });  
}

async function asyncFunc() {
    try {
        const delayedPromise = await makeDelayedPromise();
        console.log(delayedPromise);
    } catch(err) {
        console.log(err.message);
    }
}

//asyncFunc();

// N3 E1
// Captura tots els errors possibles dels nivells 1 i 2.

// Already done.
exports.getEmployee = getEmployee;
exports.getSalary = getSalary;
exports.delayedProm = makeDelayedPromise;
exports.asyncFunc = asyncFunc;
