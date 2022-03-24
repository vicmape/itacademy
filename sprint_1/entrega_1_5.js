///////////////////////////////////////////////////////////////////////////////
///////////////////////////////// README //////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
/*

This file delivers sprint_1, entrega1.5.

It has the needed function definitions at the beggining of the file, such as:
fileSystem, encoding/decoding and crypto functions.

Each exercice has its solution commented so it can be tested one by one.


For testing N1 E1 uncomment line executing
     // recursiveMessage();


For testing N1 E2 uncomment line executing 
    // writeFile(file, sentence);
and check that test.txt file is created.


For testing N1 E3 uncomment line executing
    // printFile(file);
and check that test.txt file is printed out via console


For testing N2 E1 uncomment line executing
    // do_gzip(file, `${file}.gz`)
    //     .then (() => {
    //         console.log("File compressed successfully.");
    //     })
    //     .catch((err) => {
    //         console.error('An error occurred:', err);
    //         process.exitCode = 1;
    //     });
and check that test.txt.gz file is created


For testing N2 E2 uncomment line executing 
    // ls();
function and check that directory is printed out via console

For testing N3 E1 uncomment line executing 
    // createEncodeFiles(file);
and check that test_hex.txt and test_base64.txt files are created

Then, uncomment 
    // cipherAndDeleteFile(fileHex);
    // cipherAndDeleteFile(fileBase64); 
to check that both files have been encrypted.

Then, uncomment 
    // decipherAndDeleteFile(fileHex);
    // decipherAndDeleteFile(fileBase64);
to check that both files have been decrypted.

Finally, uncomment 
    // console.log(hexDecode(readFile(fileHex)));
    // console.log(base64Decode(readFile(fileBase64)));
to check that everything went fine :)

*/

///////////////////////////////////////////////////////////////////////////////
///////////////////// FILE SYSTEM FUNCTIONS ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

const fs = require('fs');

function writeFile(filePath, content) {
    try {
        fs.writeFileSync(filePath, content);
        console.log(`File ${filePath} writen successfully.`);
    } catch (err){
        console.error(`Write file failed with error message: ${err.message}`);
    }
}

function readFile(filePath) {
    try {
        const data = fs.readFileSync(filePath, 'utf8');
        return data;
    } catch (err) {
        console.error(`Read file failed with error message: ${err.message}`);
    }
}

function printFile(filePath) {
    try {
        console.log(readFile(filePath));
    } catch (err) {
        console.error(`Print file failed with error message: ${err.message}`);
    }
}

function deleteFile(filePath) {
    try {
        fs.unlinkSync(filePath)
        console.log (`${filePath} deleted`);
    } catch(err) {
        console.error(err)
    }
}

///////////////////////////////////////////////////////////////////////////////
/////////////////////////// ENCODING FUNCTIONS ////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

function hexEncode(data) {
    let hex;
    let result = "";

    for (let i = 0; i < data.length; i++) {
        hex = data.charCodeAt(i).toString(16);
        result += ("000"+hex).slice(-4);
    }

    return result
}

function hexDecode(data) {

    let hexes = data.match(/.{1,4}/g) || [];
    let back = "";
    for(let j = 0; j<hexes.length; j++) {
        back += String.fromCharCode(parseInt(hexes[j], 16));
    }

    return back;
}

function base64Encode(data) {
    return Buffer.from(data).toString('base64');
}

function base64Decode(data) {
    return Buffer.from(data, 'base64').toString('utf8');
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////// CRYPTO FUNCTIONS ////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

const crypto = require('crypto');
const ENC_KEY = "bf3c199c2470cb477d907b1e0917c17b"; // set random encryption key
const IV = "0123456789123456"; // set random initialisation vector


var encrypt = ((val) => {
    let cipher = crypto.createCipheriv('aes-256-cbc', ENC_KEY, IV);
    let encrypted = cipher.update(val, 'utf8', 'base64');
    encrypted += cipher.final('base64');
    return encrypted;
  });
  
  var decrypt = ((encrypted) => {
    let decipher = crypto.createDecipheriv('aes-256-cbc', ENC_KEY, IV);
    let decrypted = decipher.update(encrypted, 'base64', 'utf8');
    return (decrypted + decipher.final('utf8'));
  });


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


// CONSTANTS
const file = './test.txt';
const fileHex = './test_hex.txt';
const fileBase64 = './test_base64.txt';
const sentence = 'Saitama beats Goku. Prove me wrong.';


// N1 E1
// Crea una funció que imprimeixi recursivament un missatge per la consola amb demores d'un segon.
let i = 1;
function recursiveMessage() {
    setTimeout(() => {
        console.log(`Seconds counter: ${i++}`);
        recursiveMessage();
    }, 1000);
}

//recursiveMessage();


// N1 E2
// Crea una funció que, en executar-la, escrigui una frase en un fitxer.

//writeFile(file, sentence);


// N1 E3
// Crea una altra funció que mostri per consola el contingut del fitxer de l'exercici anterior.

//printFile(file);


// N2 E1
// Crea una funció que comprimeixi el fitxer del nivell 1.

const { createGzip } = require('zlib');
const { pipeline } = require('stream');
const { promisify } = require('util');
const {
  createReadStream,
  createWriteStream
} = require('fs');
const pipe = promisify(pipeline);

async function do_gzip(input, output) {
  const gzip = createGzip();
  const source = createReadStream(input);
  const destination = createWriteStream(output);
  await pipe(source, gzip, destination);
}

// do_gzip(file, `${file}.gz`)
//     .then (() => {
//         console.log("File compressed successfully.");
//     })
//     .catch((err) => {
//         console.error('An error occurred:', err);
//         process.exitCode = 1;
//     });


// N2 E2
// Crea una funció que llisti per la consola el contingut del directori d'usuari de l'ordinador utilizant Node Child Processes.

function ls() {
    const { spawn } = require('child_process');
    const ls = spawn('dir', ["C:\\users\\formacio"], {shell: true});
    
    ls.stdout.on('data', (data) => {
      console.log(`stdout: ${data}`);
    });
    
    ls.stderr.on('data', (data) => {
      console.error(`stderr: ${data}`);
    });
    
    ls.on('close', (code) => {
      console.log(`child process exited with code ${code}`);
    });
}

//ls()


// N3 E1

// Crea una funció que creï dos fitxers codificats en hexadecimal i en base64 respectivament, a partir del fitxer del nivell 1
function createEncodeFiles(file) {
    let myStr = readFile(file);
    let myStrHex = hexEncode(myStr);
    let myStrBase64 = base64Encode(myStr);

    writeFile(fileHex, myStrHex);
    writeFile(fileBase64, myStrBase64);
}

//createEncodeFiles(file);

// Crea una funció que guardi els fitxers del punt anterior, ara encriptats amb l'algorisme aes-192-cbc, i esborri els fitxers inicials
// NOTA: He utilitzat l'algoritme aes-256-cbc, en comptes del deprecat aes-192-cbc

function cipherAndDeleteFile(file) {
    let data = readFile(file);
    let encrypted_data = encrypt(data);
    writeFile(`${file}.enc`, encrypted_data);
    deleteFile(file);
}

// cipherAndDeleteFile(fileHex);
// cipherAndDeleteFile(fileBase64);


// Crea una altra funció que desencripti i descodifiqui els fitxers de l'apartat anterior tornant a generar una còpia de l'inicial
function decipherAndDeleteFile(file) {

    let encrypted_data = readFile(`${file}.enc`);
    let data = decrypt(encrypted_data);
    writeFile(file, data);
    deleteFile(`${file}.enc`);
}

// decipherAndDeleteFile(fileHex);
// decipherAndDeleteFile(fileBase64);


// Final check that all went fine
// console.log(hexDecode(readFile(fileHex)));
// console.log(base64Decode(readFile(fileBase64)));
