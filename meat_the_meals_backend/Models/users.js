
const { default: mongoose } = require('mongoose');
const mongoo = require('mongoose');

const UserSchema = mongoo.Schema({
    _id:mongoose.Schema.Types.ObjectId,
    name:String,
    email:String,
    password:String,
    phonenumber:Number
});

module.exports = mongoo.model('users',UserSchema);