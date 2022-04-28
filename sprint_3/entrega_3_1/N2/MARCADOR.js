// Class Marcador.
// It stores players and its scores
class Marcador {
    constructor() {
        this.jugadors = [];
        this.puntuacions = []; 

        if(typeof Marcador.instance === "object") {
            return Marcador.instance;
        }

        Marcador.instance = this;
        return this;
    }

    resetMarcador() {
        this.jugadors = [];
        this.puntuacions = [];
    }

    showMarcador() {
        for (let i = 0; i < this.jugadors.length; i++) {
            let result = this.jugadors[i].padEnd(8) + " POINTS: " + this.puntuacions[i]; 
            console.log(result);
        }
    }
}

module.exports = Marcador;
