const mongoose = require('mongoose');
const express = require('express');
const router = express.Router();
const Category = require('../Models/categories');

router.get('/all',(req,res,next)=>{
   
    Category.find()
        .then(cate =>{
            res.status(200).json({
                "categories":cate
            })
        
        })
        .catch(err =>{
            res.status(400).json({
                "error":err
            })
        })
   
});

router.post('/add',(req,res,next)=>{
    const category = new Category({
        _id:new mongoose.Types.ObjectId,
        image:req.body.image,
        name:req.body.name
    });

    category.save()
    .then(cate =>{
        res.status(200).json({
            "category":cate
        })
    })
    .catch(err=>{
        res.status(400).json({
            "error":err
        })
    });
});


module.exports = router;