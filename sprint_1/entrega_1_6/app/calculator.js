
// This function sums all given elements
function sum(...args) {
    return args.reduce((a, b) => a + b, 0);
}

// This function performs: first_element - second_element - ... - last_element
function res(a, ...args) {
    return args.reduce((b, c) => b - c, a);
}

// This function multiplies all given elements
function mul(...args) {
    return args.reduce((a, b) => a * b, 1);
}

// This function performs: first_element / second_element / ... / last_element
function div(a, ...args) {
    return args.reduce((b, c) => b / c, a);
}

module.exports = {sum, res, mul, div};