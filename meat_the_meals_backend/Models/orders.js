const mongoose = require('mongoose');

const orderSchema = mongoose.Schema({
    _id: mongoose.Schema.Types.ObjectId,
    user_id:String,
    name: String,
    address: String,
    contact_number: Number,
    email: String,
    total: Number,
    date: {
      type: Date,
      default: Date.now
    },
    restaurant_name:String,
    status: String,
    order: [{
      item_name: String,
      quantity: Number,
       
    }]
  });


module.exports = mongoose.model('Orders',orderSchema)