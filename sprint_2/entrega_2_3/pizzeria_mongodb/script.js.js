// ******************************************************
// youtube
// ******************************************************


db.createCollection('clients');
db.createCollection('productes');
db.createCollection('botigues');

db.clients.insert({
    _id:"",
	nom:"",
	cognom1:"",
	cognom2:"",
	adresa:"",
	codi_postal:"",
	localitat:"",
	provincia:"",
	telf:"",
	comanda:[
		{
            id:"",
			data:"",
            hora:"",
            a_domicili:"",
            productes_id:[
                {
                    producte_id:"",
                    quantitat:""
                },
                {
                    producte_id:"",
                    quantitat:""
                }
            ],
            repartidor:"",
            data_repartiment:"",
            hora_repartiment:"",
            preu_total:""
		}
	]
});

db.productes.insert({
    _id:"",
    nom:"",
    descripcio:"",
    categoria:"",
    imatge:"",
    preu:""
});

db.botigues.insert({
    _id:"",
    adresa:"",
    codi_postal:"",
    localitat:"",
    provincia:"",
    empleats:[
        {
            nom:"",
            cognom1:"",
            cognom2:"",
            nif:"",
            tel:"",
            tipus_treball:""
        },
        {
            nom:"",
            cognom1:"",
            cognom2:"",
            nif:"",
            tel:"",
            tipus_treball:""
        }
    ]
});