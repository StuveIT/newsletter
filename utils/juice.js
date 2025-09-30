const juice = require('juice');
const readline = require('readline');

let data = "";
async function main() {
  for await (const chunk of process.stdin) data += chunk;

  // process all the data and write it back to stdout
  process.stdout.write(juice(data));
}

main();
