
const Joi = require('joi');
const express = require('express');

const app = express();

app.use(express.json());

app.use(function (req, res, next) {
    res.header('Cache-Control', 'private, no-cache, no-store, must-revalidate');
    res.header('Expires', '-1');
    res.header('Pragma', 'no-cache');
    next()
});

/*
https://www.youtube.com/watch?v=pKd0Rpw7O48

app.get()
app.post()
app.put()
app.delete()
*/

const courses = [
    { id: 1, name: 'course1'},
    { id: 2, name: 'course2'},
    { id: 3, name: 'course3'}
];

app.get('/', (req, res)=>{
    res.send('Hello World');
});

app.get('/api/courses', (req, res) => {
    res.send(courses);
});

app.get('/api/courses/:id', (req, res) => {
    const course = courses.find(c =>c.id = parseInt(req.params.id));
    if (!course)  return res.status(404).send('The course with the given ID was not found')
    res.send(course);
});

// app.get('/api/courses/:year/:month', (req, res) => {
//     res.send(req.params);
// });

//http://localhost:3000/api/courses/2018/1?Sortby=name
// app.get('/api/courses/:year/:month', (req, res) => {
//     res.send(req.query);
// });

app.post('/api/courses', (req, res) => {

    const schema = {
        name: Joi.string().min(3).required()
    };

    const result = Joi.validate(req.body, schema);

    if (result.error) {
        res.status(400).send(result.error.details[0].message);
        return;
    }

    const course = {
        id: courses.length + 1,
        name: req.body.name
    };
    courses.push(course);
    res.send(course);
});


app.put('/api/courses/', (req, res) => {
    const course = courses.find(c =>c.id = parseInt(req.params.id));
    if (!course)  return res.status(404).send('The course with the given ID was not found') // 404 - Resource not found

    const { error } = validateCourse(req.body);

    if (error) {
        res.status(400).send(error.details[0].message); // 400 - Bad request
        return;
    }

    course.name = req.body.name;

    res.send(course);

});

app.delete('/api/courses/:id', (req, res) => {
    const course = courses.find(c =>c.id = parseInt(req.params.id));
    if (!course)  return res.status(404).send('The course with the given ID was not found') // 404 - Resource not found

    const index = courses.indexOf(course);
    courses.splice(index, 1);

    res.send(course);

});


function validateCourse(course){
    const schema = {
        name: Joi.string().min(3).required()
    };

    return Joi.validate(course, schema);
}


const port = process.env.PORT || 3000;
app.listen(port , () => console.log(`Listening on port ${port}...`));
