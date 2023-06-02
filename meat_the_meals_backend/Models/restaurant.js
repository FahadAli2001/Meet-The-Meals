const moongose = require('mongoose');

const RestaurantSchema = moongose.Schema({
    _id:moongose.Schema.Types.ObjectId,
    image:String,
    name:String,
    description:String,
    dcharges:Number,
    dtime:String,
    category:String,
    menu:[{
        menu_name:String
    }],
    products:[
        {
            _id:moongose.Schema.Types.ObjectId,
            popular:Boolean,
            status:String,
            pimage:String,
            pname:String,
            pprice:Number
        }
    ]
       
    
});

module.exports = moongose.model('restaurants',RestaurantSchema);