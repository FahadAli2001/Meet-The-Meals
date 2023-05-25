

const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    name:String,
    email:String,
    password:String,
    phonenumber:Number
});

module.exports = mongoose.model('users',UserSchema);