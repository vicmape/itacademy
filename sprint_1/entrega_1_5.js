// N1 E1
// Crea una funció que imprimeixi recursivament un missatge per la consola amb demores d'un segon.
let i = 1;
function recursiveMessage() {
    setTimeout(() => {
        console.log(`Seconds counter: ${i++}`);
        recursiveMessage();
    }, 1000);
}

// NOTE: this call is commented out because is a pain in the ass for doing the other exercices.

//recursiveMessage();

// N1 E2
// Crea una funció que, en executar-la, escrigui una frase en un fitxer.

const filePath = './truth.txt';
const sentence = 'Saitama beats Goku. Prove me wrong.';

function writeFile(filePath, content) {
    const fs = require('fs');
    try {
        fs.writeFileSync('./truth.txt', content);
        console.log("File writen successfully.");
    } catch (err){
        console.error(`Write file failed with error message: ${err.message}`);
    }
}
    
writeFile(filePath, sentence);


// N1 E3
// Crea una funció que, en executar-la, escrigui una frase en un fitxer.

function printFile(filePath) {

    const fs = require('fs')
    try {
        const data = fs.readFileSync(filePath, 'utf8');
        console.log(data);
    } catch (err) {
        console.error(`Read file failed with error message: ${err.message}`);
    }
}

printFile(filePath);