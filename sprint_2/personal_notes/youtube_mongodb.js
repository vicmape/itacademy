
db.createCollection('users');
db.createCollection('videos');

db.users.insert({
    _id:"1",
    username:"victor",
    email:"victor@gmail.com",
    password:"1234",
    birthdate:"2000-01-01",
    gender:"male",
    country:"ESP",
    zipcode:"08030",
    videos_published_id:[1, 3],
    channels:[
        {
            id:"1",
            nom:"victor channel 1",
            descripcio:"victor channel 1",
            data_creacio:"2022-04-27",
        }
    ],
    channels_subscribed:[
        {
            user_id:"2",
            channel_id:"2"
        }
    ],
    playlists:[
        {
            playlist_name:"fiestuki",
            creation_date:"2022-04-27",
            estat:"privat", //public ó privat
            videos_id:[1,2,3]
        }
    ]
});

db.videos.insert({
    _id:"1",
    titol:"1",
    descripcio:"1",
    grandaria:"1",
    nom:"1",
    durada:"1",
    thumbnail:"1",
    num_reproduccions:"123",
    likes:[
        {
            user_id:"2",
            data:"2022-04-27",
            hora:"12.00"
        }
    ], //users_id
    dislikes:[
        {
            user_id:"1",
            data:"2022-04-27",
            hora:"13.00"
        }
    ], //users_id
    status: "public", // public, ocult, privat
    tags:["chachi", "mainstream"],
    owner_id:"1",
    publication_date:"2022-04-27",
    publication_time:"12.00",
    comments:[
        {
            id:"1",
            user_id:"1",
            text:"Vaya mierda de video",
            data:"2022-04-27",
            hora:"12.00",
            likes:[
                {
                    user_id:"2",
                    data:"2022-04-27",
                    hora:"12.00"
                }
            ],
            dislikes:[
                {
                    user_id:"6",
                    data:"2022-04-27",
                    hora:"12.00"
                }
            ],
        }
    ]
});