const fs = require('fs');
const path = require('path');

// First, get the contents of the input file for today's puzzle
const inputFilePath = path.join('day2.txt');
const inputFileContents = fs.readFileSync(inputFilePath, 'utf-8');

// Next, let's put every line in the input file into an array
const input = inputFileContents.split('\n');
// If the last line is blank, remove it
if (input[input.length - 1].trim() === '') {
  input.pop();
}

var arr = input[0].split(",").map(Number)

function checker(noun, verb){
  arr[1] = noun;
  arr[2] = verb;

  for (i=0; i+=4; arr.length){
    if(arr[i]===1){
      let sum = arr[arr[i+1]] + arr[arr[i+2]]
      arr[arr[i+3]] = sum
    }
    else if(arr[i]===2){
      let product = arr[arr[i+1]] * arr[arr[i+2]]
      arr[arr[i+3]] = product
    }
    else if(arr[i]===99){
      console.log("halting")
      break;
    }
    else {
      console.log("somethign went wrong")
      break;
    }
  }
  return arr[0]
}

for (x=0; x < 1000; x++){
  for (y=0; y < 1000; y++){
    let result = checker(x, y)
    if (result === 19690720){
      console.log(x);
      console.log(y);
      break;
    }
    else {
      arr = input[0].split(",").map(Number)
    }
  }
}
