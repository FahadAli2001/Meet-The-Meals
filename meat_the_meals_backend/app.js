const express = require('express');
const mongoo = require('mongoose')
const bodyParser = require('body-parser');
const app = express();






mongoo.connect('mongodb+srv://fahad2001:fahad2001@cluster0.knrcws8.mongodb.net/?retryWrites=true&w=majority');

mongoo.connection.on('connected',connected=>{
    console.log("Mongoo DB connected sucessfully");
});

mongoo.connection.on('err',err=>{
    console.log("Mongo DB not connected " + err);
});

const UserRoute = require('./Routes/users');

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());



app.use('/user',UserRoute);


app.use((req,res)=>{
    res.status(404).json({
        "Error":"Url not found"
    })
});

app.use((req,res)=>{
    res.status(500).json({
        "error":"internal server error"
    })
})

app.listen(3000,()=>{
    console.log('Server is connected on port 3000');
});



