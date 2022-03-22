// let greeting = name => console.log(`Hello ${name}`);

// const userInfo = (firstName, lastName, callback) => {
//     const fullname = `${firstName} ${lastName}`;
//     callback(fullname);
// }

// userInfo("Victor", "Machado", greeting);
const hasMeeting = true;

const meeting = new Promise((resolve, reject) => {
    if (!hasMeeting) {
        const meetingDetails = {
            name: "Marketing",
            location:"skype"
        }
        resolve(meetingDetails);
    } else {
        reject(new Error("Meeting already scheduled"));
    }
});

const addToCalendar = meetingDetails => {
    const calendar = `${meetingDetails.name} scheduled on ${meetingDetails.location}`;
    return Promise.resolve(calendar);
}


// meeting
//     .then (addToCalendar)
//     .then ( res => {
//         // resolve data
//         console.log("Meeting scheduled");
//         console.log (res);
//     })
//     .catch ( err => {
//         // reject data
//         console.log(err.message);
//     })


async function myMeeting() {
    try {
        const meetingDetails = await meeting;
        const message = await addToCalendar(meetingDetails);
        console.log(message);
    } catch (err){
        console.log(err.message);
    }
}

myMeeting();
