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
    .then ( res => {
        // resolve data
        console.log(res);
    })
    .catch ( err => {
        // reject data
        console.log(err.message);
    })

doCombat(false)
    .then ( res => {
        // resolve data
        console.log(res);
    })
    .catch ( err => {
        // reject data
        console.log(err.message);
    })

