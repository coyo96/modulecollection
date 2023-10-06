let display;
let previous = null;
let operator = null;
let operatorClicked = false;

/**
 * Calculates the operation and updates the display.
 */
function performOperation() {
  let result;
  const current = parseNumber(display.value);
  previous = parseNumber(previous);

  switch(operator) {
    case '+' :
      result = previous + current;
    break;
    case '-' :
        result = previous - current;
    break;
    case '*' :
        result = previous * current;
    break;
    case '/' :
        result = previous / current;
    break;
  }

  display.value = result;
  operator = null;
}

/**
 * Parses the display value into a number (float or int).
 * @param {String} num 
 */
function parseNumber(num) {
  return num.includes('.') ? parseFloat(num) : parseInt(num);
}

/**
 * Capture the previous value and the clicked operator
 * so that an operation can be performed.
 */
function clickOperator(event) {
  operator = event.target.value;
  previous = display.value;
  operatorClicked = true;
}

/**
 * Captures a number click and updates the display value.
 * @param {Event} event 
 */
function clickNumber(event) {
  const val = event.target.value;

  if( operatorClicked ) {
    display.value = val;
    operatorClicked = false;
  } else {
    display.value == 0 ? display.value = val : display.value += val;
  }

}

function clear() {
  display.value = 0;
}

document.addEventListener('click', () => {

  display= document.getElementById('display');

 
  let numbers= document.querySelectorAll('.number');

  numbers.forEach((nums)=> {
    nums.addEventListener('click', clickNumber);
  });


  // get a reference to the decimal point button
  // add a click event listener to call the function clickNumber
  // the decimal point is part of the number so you can call clickNumber for it 
  // as you would for a number

  let decimalBtn= document.querySelector('.decimal');
  decimalBtn.addEventListener('click', clickNumber);


  // get a reference to the all clear button
  // add a click event listener to call the function clear  


  let clearbtn= document.querySelector('.all-clear');
  clearbtn.addEventListener('click', clear);

  // get a reference to all of the operators;
  // loop over each of the operators
  // add a click event listener to each operator to call the function clickOperator


  let operatorBtn= document.querySelectorAll('.operator');
  operatorBtn.forEach ((operator)=> {
    operator.addEventListener('click', clickOperator);
  });
  // add click event listener for the equal sign
  // should call the function performOperation

  let equals= document.querySelector('.equal-sign');
  equals.addEventListener('click', performOperation );
});

