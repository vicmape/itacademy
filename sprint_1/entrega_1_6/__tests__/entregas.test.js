
///////////////////////////////////////////////////////////////////////////////
/////////////////////////////// NIVELL 1 //////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

//Crea els tests corresponents per verificar el funcionament de l'exercici
// Async / Await Nivell 1 - Exercici 1

test('Get salary of Linus Torvalds (id = 1) to equal 4000', () => {
    const e_1_4 = require('../../entrega_1_4');
    return expect(e_1_4.getEmployee(1).then(res => e_1_4.getSalary(res))).resolves.toBe(4000);
});

test('Get salary of Linus Torvalds (id = 2) to equal 4000', () => {
    const e_1_4 = require('../../entrega_1_4');
    return expect(e_1_4.getEmployee(2).then(res => e_1_4.getSalary(res))).resolves.toBe(1000);
});

test('Get salary of Linus Torvalds (id = 3) to equal 4000', () => {
    const e_1_4 = require('../../entrega_1_4');
    return expect(e_1_4.getEmployee(3).then(res => e_1_4.getSalary(res))).resolves.toBe(2000);
});



// Crea els tests corresponents per verificar el funcionament de l'exercici
// Async / Await Nivell 2 - Exercici 1

test('make delayed promise', () => {
    const e_1_4 = require('../../entrega_1_4');
    return expect(e_1_4.delayedProm()).resolves.toBe("Promise solved after 2 sec");
});


// Crea els tests corresponents per verificar el funcionament de l'exercici
// Promises & Callbacks Nivell 2 - Exercici 3

// NOTE: this is already tested in previous exercise "Crea els tests corresponents per verificar el funcionament de l'exercici Async / Await Nivell 1 - Exercici 1"



// Verifica mitjançant tests l'execució de l'exercici Async / Await Nivell 2 Exercici 1 utilitzant Jest Fake Timers.

test('waits 1 second before ending the game', () => {
    jest.useFakeTimers();
    jest.spyOn(global, 'setTimeout');

    const e_1_4 = require('../../entrega_1_4');
    e_1_4.asyncFunc();

    expect(setTimeout).toHaveBeenCalledTimes(1);
    expect(setTimeout).toHaveBeenLastCalledWith(expect.any(Function), 2000);

    jest.useRealTimers();
});


///////////////////////////////////////////////////////////////////////////////
/////////////////////////////// NIVELL 2 //////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

// Crea un mock que comprovi les crides al constructor de la classe Persona i al seu mètode decirNombre en l'exercici Classes & Arrow Functions - Nivell 2 Exercici 2

test('Check constructor of class Persona', () => {

    const e_1_2 = require('../../entrega_1_2');
    jest.mock('../../entrega_1_2');

    // Check persona constructor
    const persona = new e_1_2.Persona();
    expect(e_1_2.Persona).toHaveBeenCalledTimes(1);

    // Check dirNom function call
    const spyDirNom = jest.spyOn(persona, 'dirNom');
    persona.dirNom();
    expect(spyDirNom).toHaveBeenCalledTimes(1);

});
