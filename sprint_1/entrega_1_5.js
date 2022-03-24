
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
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////


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

const filePath = './test.txt';
const sentence = 'Saitama beats Goku. Prove me wrong.';

writeFile(filePath, sentence);


// N1 E3
// Crea una funció que, en executar-la, escrigui una frase en un fitxer.


/*


printFile(filePath);


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

do_gzip(filePath, `${filePath}.gz`)
    .then (() => {
        console.log("File compressed successfully.");
    })
    .catch((err) => {
        console.error('An error occurred:', err);
        process.exitCode = 1;
    });


// N2 E2
// Crea una funció que llisti per la consola el contingut del directori d'usuari de l'ordinador utilizant Node Child Processes.

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

*/

///////////////////////////////////////////////////////////////////////////////
/////////////////////////// UTILS FUNCTIONS ///////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

String.prototype.hexEncode = function(){
    let hex;
    let result = "";

    for (let i = 0; i < this.length; i++) {
        hex = this.charCodeAt(i).toString(16);
        result += ("000"+hex).slice(-4);
    }

    return result
}

String.prototype.hexDecode = function(){

    let hexes = this.match(/.{1,4}/g) || [];
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
// N3 E1


// Crea una altra funció que desencripti i descodifiqui els fitxers de l'apartat anterior tornant a generar una còpia de l'inicial
// Inclou un README amb instruccions per a l'execució de cada part

let fileHex = './test_hex.txt';
let fileBase64 = './test_base64.txt';

// Crea una funció que creï dos fitxers codificats en hexadecimal i en base64 respectivament, a partir del fitxer del nivell 1
function createEncodeFiles(filePath) {
    let myStr = readFile(filePath);
    //console.log(myStr);
    let myStrHex = myStr.hexEncode();
    //console.log(myStrHex);
    let myStrBase64 = base64Encode(myStr);
    //console.log(myStrBase64);

    writeFile(fileHex, myStrHex);
    writeFile(fileBase64, myStrBase64);
}

createEncodeFiles(filePath);

// Crea una funció que guardi els fitxers del punt anterior, ara encriptats amb l'algorisme aes-192-cbc, i esborri els fitxers inicials
// NOTA: He utilitzat l'algoritme aes-256-cbc, en comptes del deprecat aes-192-cbc

function cipherAndDeleteFile(filePath) {
    let data = readFile(filePath);
    let encrypted_data = encrypt(data);
    writeFile(`${filePath}.enc`, encrypted_data);

}


cipherAndDeleteFile(fileHex);
cipherAndDeleteFile(fileBase64);

/*
const phrase = "who let the dogs out";

let encrypted_key = encrypt(phrase);
console.log(encrypted_key);

let original_phrase = decrypt(encrypted_key);
console.log(original_phrase);
*/



/*
let myStr = "abc";
console.log(myStr);

let myStrHex = myStr.hexEncode();
console.log(myStrHex);

let myStrHexDec = myStrHex.hexDecode();
console.log(myStrHexDec);

let myStrBase64 = base64Encode(myStr);
console.log(myStrBase64);

let mystrBase64Dec = base64Decode(myStrBase64)
console.log(mystrBase64Dec);
*/

