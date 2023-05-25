const mongoose = require('mongoose');
const express = require('express');
const router = express.Router();
const Category = require('../Models/categories');

router.get('/',(req,res,next)=>{
    console.log("dataaaa");
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


module.exports = router;