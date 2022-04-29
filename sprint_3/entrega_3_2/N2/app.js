
const conversion = require("./decorator");

const articles = [
    {
        name: "C-shirt",
        div: "cad",
        price: 10
    },
    {
        name: "U-shirt",
        div: "usd",
        price: 10
    },
    {
        name: "J-shirt",
        div: "JPY",
        price: 10
    }
];

console.log(articles);
conversion(articles);
console.log(articles);