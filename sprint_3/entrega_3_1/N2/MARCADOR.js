// Class MARCADOR.
// It stores players and its scores
class MARCADOR {
    constructor() {
        this.jugadors = [];
        this.puntuacions = []; 

        if(typeof MARCADOR.instance === "object") {
            return MARCADOR.instance;
        }

        MARCADOR.instance = this;
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

module.exports = {MARCADOR};
