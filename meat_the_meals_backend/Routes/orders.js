const express = require('express');
const router = express.Router();
const mongoose = require('mongoose');
const OrdersModel = require('../Models/orders')


router.get('/all',(req,res,next)=>{
    OrdersModel.find().then((order)=>{
        res.status(200).send(order)
    })
    .catch(err=>{
        res.status(404).send(err)
    })
});

router.post('/add',(req,res,next)=>{
    const order =new OrdersModel({
        _id:new mongoose.Types.ObjectId,
        name:req.body.name,
        user_id:req.body.user_id,
        address:req.body.address,
        contact_number:req.body.contact_number,
        email:req.body.email,
        total:req.body.total,
        status:req.body.status,
        restaurant_name:req.body.restaurant_name,
        order:req.body.order.map(orders =>({
            item_name:orders.item_name,
            quantity:orders.quantity,
            
        }))
    });

    order.save()
    .then((result)=>{
        res.status(200).json({
            'order':result
        })
    })

    .catch(err=>{
        res.status(404).json({
            'error_msg':err
        })
    });
});

module.exports  =router;