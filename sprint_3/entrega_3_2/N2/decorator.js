const CONVERSION = require('./currency_conversions.json');

function conversion(articles) {
    articles.forEach(art => {
        let currencyConversion = art.div.toUpperCase() + "_EUR";
        let coef = CONVERSION[currencyConversion];
        art.coef = coef;
        art.price_eur = art.price * coef;
    });
}

module.exports = conversion;