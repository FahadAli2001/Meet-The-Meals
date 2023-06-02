const express = require('express');
const mongoose = require('mongoose');
const Restaurant = require('../Models/restaurant')
const router = express.Router();


router.get('/all',(req,res,next)=>{
    Restaurant.find()
    .then(restu =>{
        res.status(200).json({
            "restaurant":restu
        })
    })
    .catch(err => {
        res.status(400).json({
            "error":err
        })
    })
});


router.post('/add', (req, res, next) => {
    const restaurant = new Restaurant({
        _id: new mongoose.Types.ObjectId(),
        image: req.body.image,
        name: req.body.name,
        description:req.body.description,
        dcharges:req.body.dcharges,
        dtime:req.body.dtime,
        category:req.body.category,
        menu:req.body.menu.map(menu=>({
            menu_name:menu.menu_name
        })),
        products: req.body.products.map(product => ({
            _id: new mongoose.Types.ObjectId(),
            popular: product.popular,
            status: product.status,
            pimage: product.pimage,
            pname: product.pname,
            pprice: product.pprice
        }))
    });

    restaurant.save()
        .then(savedRestaurant => {
            res.status(200).json({
                "restaurant": savedRestaurant
            });
        })
        .catch(err => {
            res.status(400).json({
                "error": err
            });
        });
});

router.put('/update/:id', (req, res, next) => {
    Restaurant.findOneAndUpdate(
        { _id: req.params.id },
        {
            $set: {
                products: req.body.products.map(product => ({
                    popular: product.popular,
                    status: product.status,
                    pimage: product.pimage,
                    pname: product.pname,
                    pprice: product.pprice
                }))
            }
        },
        { new: true } // To return the updated document
    )
    .then(updatedRestaurant => {
        res.status(200).json({
            "updated": updatedRestaurant
        });
    })
    .catch(err => {
        res.status(400).json({
            "error": err
        });
    });
});





module.exports = router;
