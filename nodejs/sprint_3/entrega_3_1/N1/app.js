const {
  readdir,
  readFile,
  writeFile
} = require("fs/promises");

const {
  join
} = require("path");

const inbox = join(__dirname, "inbox");
const outbox = join(__dirname, "outbox");

const reverseText = str =>
  str
  .split("")
  .reverse()
  .join("");

async function reverse () {
  try {
    const files = await readdir(inbox);
    for (const file of files) {
      const data = await readFile(join(inbox, file), "utf8");
      await writeFile(join(outbox, file), reverseText(data));
      console.log(`${file} was successfully saved in the outbox!`);
    }
  } catch(err){
    console.error(err);
  }
}

reverse();