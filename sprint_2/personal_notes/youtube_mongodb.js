
db.createCollection('users');

db.test.insertMany([
    {
        _id: ObjectId("000000000000000000000001"),
        username:"victor",
        email:"victor@gmail.com",
        password:"1234",
        birthdate:"2000-01-01",
        gender:"male",
        country:"ESP",
        zipcode:"08030",
        videos:[
            {
                id: ObjectId("100000000000000000000001"),
                titol:"titulo 1",
                descripcio:"descripcio 1",
                grandaria:"10",
                nom:"nom 1",
                durada:"10:00",
                thumbnail:"1",
                num_reproduccions:"123",
                likes:[
                    {
                        user_id:ObjectId("000000000000000000000001"),
                        data:"2022-04-27",
                        hora:"12.00"
                    }
                ],
                dislikes:[
                    {
                        user_id:ObjectId("000000000000000000000002"),
                        data:"2022-04-27",
                        hora:"13.00"
                    }
                ],
                status: "public", // public, ocult, privat
                tags:["chachi", "mainstream"],
                publication_date:"2022-04-27",
                publication_time:"12.00",
                comments:[
                    {
                        id:ObjectId("200000000000000000000002"),
                        user_id:ObjectId("000000000000000000000002"),
                        text:"Vaya mierda de video",
                        data:"2022-04-27",
                        hora:"12.00",
                        likes:[
                            {
                                user_id:ObjectId("000000000000000000000001"),
                                data:"2022-04-27",
                                hora:"12.00"
                            }
                        ],
                        dislikes:[
                            {
                                user_id:ObjectId("000000000000000000000002"),
                                data:"2022-04-27",
                                hora:"12.00"
                            }
                        ],
                    }
                ]
            },
        ],
        channel_id:ObjectId("300000000000000000000001"),
        channel_nom:"victor channel 1",
        channel_desc:"descripcio victor channel 1",
        channel_creacio:"2022-04-27",
        channels_subscribed:[ObjectId("300000000000000000000002")],
        playlists:[
            {
                playlist_name:"fiestuki",
                creation_date:"2022-04-27",
                estat:"privat", //public ó privat
                videos_id:[]
            }
        ]
    },
    {
        _id: ObjectId("000000000000000000000002"),
        username:"victor",
        email:"victor@gmail.com",
        password:"1234",
        birthdate:"2000-01-01",
        gender:"male",
        country:"ESP",
        zipcode:"08030",
        videos:[
            {
                id: ObjectId("100000000000000000000002"),
                titol:"titulo 2",
                descripcio:"descripcio 2",
                grandaria:"10",
                nom:"nom 2",
                durada:"10:00",
                thumbnail:"1",
                num_reproduccions:"123",
                likes:[
                    {
                        user_id:ObjectId("000000000000000000000002"),
                        data:"2022-04-27",
                        hora:"12.00"
                    }
                ],
                dislikes:[
                    {
                        user_id:ObjectId("000000000000000000000001"),
                        data:"2022-04-27",
                        hora:"13.00"
                    }
                ],
                status: "ocult", // public, ocult, privat
                tags:["chachi", "mainstream"],
                publication_date:"2022-04-27",
                publication_time:"12.00",
                comments:[
                    {
                        id:ObjectId("200000000000000000000002"),
                        user_id:ObjectId("000000000000000000000001"),
                        text:"Vaya mierda de video",
                        data:"2022-04-27",
                        hora:"12.00",
                        likes:[
                            {
                                user_id:ObjectId("000000000000000000000002"),
                                data:"2022-04-27",
                                hora:"12.00"
                            }
                        ],
                        dislikes:[
                            {
                                user_id:ObjectId("000000000000000000000001"),
                                data:"2022-04-27",
                                hora:"12.00"
                            }
                        ],
                    }
                ]
            },
        ],
        channel_id:ObjectId("300000000000000000000001"),
        channel_nom:"victor channel 1",
        channel_desc:"descripcio victor channel 1",
        channel_creacio:"2022-04-27",
        channels_subscribed:[ObjectId("300000000000000000000002")],
        playlists:[
            {
                playlist_name:"fiestuki",
                creation_date:"2022-04-27",
                estat:"privat", //public ó privat
                videos_id:[ObjectId("100000000000000000000002")]
            }
        ]
    }
]);