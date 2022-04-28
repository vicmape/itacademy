const marc = require('./MARCADOR');
const jug = require('./JUGADOR');

// Class joc.
// It extends class marcador. It's in charge of managin the game: add players, start/stop game, maintain the scoreboard
class JOC {
    constructor(nom) {
        this.nom = nom;
        this.game_started = 0;
        this.game_ended = 0;
        this.marcador = new marc.MARCADOR();
    }

    // Function: Start the game + show the scoreboard
    start() {
        if (this.game_ended){
            console.log(`GAME ${this.nom} ALREADY ENDED`);
        }else if (this.game_started){
            console.log(`GAME ${this.nom} ALREADY STARTED`);
        } else {
            this.game_started = 1;
            console.log(`\nGAME ${this.nom} STARTED`);
        }
    }
    
    // Function: End the game + show the scoreboard + find the winner.
    end() {
        if (this.game_ended){
            console.log(`GAME ${this.nom} ALREADY ENDED.`);
        } else if (!this.game_started){
            console.log(`GAME ${this.nom} NOT STARTED YET!`);
        } else {
            this.game_ended = 1;
            console.log(`${this.nom} ENDED`);
        }

        // Show final scores
        console.log(`${this.nom} FINAL SCORES: `);
        this.marcador.showMarcador();

        // show the winner
        const max = Math.max(...this.marcador.puntuacions);
        const index = this.marcador.puntuacions.indexOf(max);
        console.log(`\nTHE WINNER OF ${this.nom} IS: ${this.marcador.jugadors[index]}!`)

        // reset del marcador actual
        this.marcador.resetMarcador();
    }
    
    
    // Function: add a player to the current game.
    addJugador(jugador) {

        if (this.game_started) {
            console.log("GAME ALREADY STARTED, WAIT FOR NEXT GAME");
            return;
        }

        if (this.game_ended) {
            console.log("GAME ALREADY ENDED");
            return;
        }

        if (jugador instanceof jug.JUGADOR) {    
            this.marcador.jugadors.push(jugador.nom);
            this.marcador.puntuacions.push(0);
        } else {
            console.log(`Error: ${jugador} is not JUGADOR object`);
        }
    }
    
    // Function: a players add a point to its score
    jugadorSuma(jugador) {
        if (this.game_started && !this.game_ended) {
            let index = this.marcador.jugadors.indexOf(jugador.nom);
            if  (index != -1) {
                this.marcador.puntuacions[index]++;
            }
        }
    }
    
    // Function: a player rest a point to its score
    jugadorResta(jugador) {
        if (this.game_started && !this.game_ended) {
            let index = this.marcador.jugadors.indexOf(jugador.nom);
            if  (index != -1) {
                this.marcador.puntuacions[index]--;
            }
        }
    }

};

module.exports = {JOC};