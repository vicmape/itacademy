
db.dropDatabase();

db.createCollection('proveidors');
db.createCollection('clients');

db.proveidors.insert({
	nom:"p2",
	address:{
		street:"calle 1",
		num:"1",
		pis:"1",
		porta:"1",
		ciutat:"ciudad 1",
		codi_postal:"1",
		pais:"pais 1"
	},
	telf:"1",
	fax:"1",
	nif:"1",
	ulleres:[
		{
			id:"id 1",
			marca:"marca 1",
			grad_esq:"grad_esq 1",
			grad_der:"grad_der1",
			montura:"montura1",
			color_mont:"color_mont_1",
			color_vid:"color1", 
            preu:"precio 1"
		},
		{
			id:"id 1 2",
			marca:"marca 1 2",
			grad_esq:"grad_esq 1",
			grad_der:"grad_der1",
			montura:"montura1",
			color_mont:"color_mont_1",
			color_vid:"color1", 
            preu:"precio 1 2"
		},
		{
			id:"id 1 3",
			marca:"marca 1 3",
			grad_esq:"grad_esq 1",
			grad_der:"grad_der1",
			montura:"montura1",
			color_mont:"color_mont_1",
			color_vid:"color1", 
            preu:"precio 1 3"
		}
	]
});

db.proveidors.insert({
	nom:"p2",
	address:{
		street:"calle 2",
		num:"2",
		pis:"2",
		porta:"2",
		ciutat:"ciudad 2",
		codi_postal:"2",
		pais:"pais 2"
	},
	telf:"2",
	fax:"2",
	nif:"2",
	ulleres:[
		{
			id:"id 2",
			marca:"marca 2",
			grad_esq:"grad_esq 2",
			grad_der:"grad_der2",
			montura:"montura2",
			color_mont:"color_mont_2",
			color_vid:"color2", 
            preu:"precio 2"
		}
	]
});

db.clients.insert({
	nom:"nom 1",
	address:{
		street:"street 1",
		num:"num 1",
		pis:"pis 1",
		porta:"porta 1",
		ciutat:"ciutat 1",
		codi_postal:"codi_postal 1",
		pais:"pais 1"
	},
	telf:"telf 1",
	email:"email 1",
	data_registre:"data_registre 1",
	recomanat:"recomanat 1",
	compres:[
		{
			ulleres_id:["id 1", "id 2"],
			empleat:"empleat 1",
			data:"data 1",
			preu_total:"preu_total 1"
		}
	]
});


db.clients.insert({
	nom:"nom 2",
	address:{
		street:"street 2",
		num:"num 2",
		pis:"pis 2",
		porta:"porta 2",
		ciutat:"ciutat 2",
		codi_postal:"codi_postal 2",
		pais:"pais 2"
	},
	telf:"telf 2",
	email:"email 2",
	data_registre:"data_registre 2",
	recomanat:"recomanat 2",
	compres:[
		{
			ulleres_id:["id 2", "id 2"],
			empleat:"empleat 2",
			data:"data 2",
			preu_total:"preu_total 2"
		}
	]
});
