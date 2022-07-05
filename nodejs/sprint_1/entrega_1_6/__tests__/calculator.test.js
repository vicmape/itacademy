const calc = require('../app/calculator.js');

test('adds 1 + 2 + 3 to equal 6', () => {
    expect(calc.sum(1, 2, 3)).toBe(6);
});

test('rest 10 - 2 - 3 to equal 5', () => {
    expect(calc.res(10, 2, 3)).toBe(5);
});

test('mult 2 * 2 * 2 to equal 8', () => {
    expect(calc.mul(2,2,2)).toBe(8);
});

test('div 20 / 2 / 2 to equal 5', () => {
    expect(calc.div(20,2,2)).toBe(5);
});
