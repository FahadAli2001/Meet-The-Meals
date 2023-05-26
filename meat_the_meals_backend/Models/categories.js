const mongoose = require('mongoose')

const Category = mongoose.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    image:String,
    name:String
});

module.exports = mongoose.model('categories',Category);