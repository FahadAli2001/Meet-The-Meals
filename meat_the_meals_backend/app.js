const express = require('express');
const mongoose = require("mongoose")
const bodyParser = require('body-parser');

const app = express();




// mongodb://localhost:27017/

// mongodb+srv://fahad2001:fahad2001@cluster0.knrcws8.mongodb.net/?retryWrites=true&w=majority
mongoose.connect('mongodb://0.0.0.0:27017/meatTheMeals', { useNewUrlParser: true, useUnifiedTopology: true });


const db = mongoose.connection;

db.on('open', () => {
    console.log('MongoDB connected successfully');
});

db.on('error', (err) => {
    console.log('MongoDB connection error:', err);
});

db.on('disconnected', () => {
    console.log('MongoDB disconnected');
});

const UserRoute = require('./Routes/users');
const CategoryRoute = require('./Routes/categories');
const RestaurantRoute = require('./Routes/restaurant');
const OrderRoute = require('./Routes/orders')

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());


app.use('/user',UserRoute);
app.use('/category',CategoryRoute);
app.use('/restaurant',RestaurantRoute);
app.use('/order',OrderRoute);


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



