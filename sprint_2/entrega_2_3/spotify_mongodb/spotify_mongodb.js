db.createCollection('users');
db.createCollection('artists');

db.artists.insert({
    _id: ObjectId(),
    name:"",
    image:"",
    music_styles:[],
    albums:[
        {
            _id: ObjectId(),
            title:"",
            year:"",
            image:"",
            songs:[
                {
                    _id: ObjectId(),
                    title:"",
                    duration:"",
                    num_reproductions:""
                }
            ]
        }
    ]
});

db.users.insert({
    _id: ObjectId(),
    username:"",
    email:"",
    password:"",
    birthdate:"",
    gender:"",
    country:"",
    zipcode:"",
    user_type:"", // [free|premium]
    subscription:{
        start_date:"",
        renewal_date:"",
        payment_type:"", //[credit|paypal]
        credit_card_num:"",
        credit_card_month:"",
        credit_card_cvv:"",
        paypal_username:"",
        payments:[
            {
                _id: ObjectId(),
                date:"",
                total:""
            }
        ],
        playlists:[
            {
                _id: ObjectId(),
                title:"",
                status:"", //[active|deleted]
                creation_date:"",
                deletion_date:"",
                songs:[
                    {
                        added_by_user_id:"",
                        date:""
                    }
                ],
            }
        ],
        fav_artists_id:[],
        fav_albums_id:[],
        fav_song_id:[],
        fav_playlists:[]
    }
});