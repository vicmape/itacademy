const Jugador =  require("./Jugador");
const Joc =  require("./Joc");

// Crear jugadors
let jugador1 = new Jugador('victor');
let jugador2 = new Jugador('javi');
let jugador3 = new Jugador('ona');
let jugador4 = new Jugador('paula');


// Crear joc 1
let joc1 = new Joc("JOC 1");

// Afegir jugadors al joc 1
joc1.addJugador(jugador1);
joc1.addJugador(jugador2);
joc1.addJugador(jugador3);
joc1.addJugador(jugador4);

// Start joc 1
joc1.start();

// JOC 1: victor + 3
joc1.jugadorSuma(jugador1);
joc1.jugadorSuma(jugador1);
joc1.jugadorSuma(jugador1);

// JOC 1: javi + 3
joc1.jugadorSuma(jugador2);
joc1.jugadorSuma(jugador2);
joc1.jugadorSuma(jugador2);

// JOC 1: ona + 1
joc1.jugadorSuma(jugador3);

// JOC 1: paula + 1
joc1.jugadorSuma(jugador4);

// JOC 1: javi - 5
joc1.jugadorResta(jugador2);
joc1.jugadorResta(jugador2);
joc1.jugadorResta(jugador2);
joc1.jugadorResta(jugador2);
joc1.jugadorResta(jugador2);

// End joc 1
joc1.end();


// Crear joc 2
let joc2 = new Joc("JOC 2");

// Afegir jugadors al joc 2
joc2.addJugador(jugador1);
joc2.addJugador(jugador2);

// Start joc 2
joc2.start();

// JOC 2: victor + 2
joc2.jugadorSuma(jugador1);
joc2.jugadorSuma(jugador1);

// JOC 2: javi + 1
joc2.jugadorSuma(jugador2);

// End joc 2
joc2.end();