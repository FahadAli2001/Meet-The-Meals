const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const Users = require('../Models/users');
const jwt = require('jsonwebtoken');
const mongoose = require('mongoose')


router.post('/registration', (req, res, next) => {
    Users.find({ email: req.body.email })
      .then(users => {
        if (users.length > 0) {
          return res.status(200).json({
            msg: 'Email already exists'
          });
        }
  
        bcrypt.hash(req.body.password, 10, (err, hash) => {
          if (err) {
            return res.status(500).json({
              error: err
            });
          }
  
          const user = new Users({
            _id:new  mongoose.Types.ObjectId,
            name: req.body.name,
            email: req.body.email,
            password: hash,
            phonenumber: req.body.phonenumber
          });
  
          user.save()
            .then(newuser => {
              res.status(200).json({
                'user created': newuser
              });
            })
            .catch(er => {
              res.status(401).json({
                "error": err
              });
            });
        });
      })
      .catch(error => {
        console.log(error);
        res.status(400).json({
          "error": error
        });
      });
});
  

router.post("/login",(req,res)=>{
    Users.find({email:req.body.email}).exec()
    .then(user=>{
        if(user.length < 1){
            return res.status(401).json({
                "error":"user not found"
            })
        }
        bcrypt.compare(req.body.password,user[0].password,(err,result)=>{
            if(!result){
                return res.status(401).json({
                    "error":"incorrect password"
                })
            }
            if (result) {
                const token = jwt.sign({
                  _id:user[0]._id,
                    name:user[0].name,
                    email:user[0].email,
                    phonenumber:user[0].phonenumber,
                },
                 "token",
                 {
                    expiresIn:"24h"
                 }
                );

                res.status(200).json({
                  _id:user[0]._id,
                    name:user[0].name,
                    email:user[0].email,
                    phonenumber:user[0].phonenumber,
                    token:token
                })
            }
        })
    }).catch(err =>{
      console.log(err);
        res.status(500).json({
            err:err
        })
    })
});


router.get('/info/:id',(req,res,next)=>{
 
  Users.findOne({_id:req.params.id})
  .then(user=>{
    res.status(200).json({
      "data":user
    })
  })
  .catch(err=>{
    res.status(400).json({
      "err":err
    })
  })
});
  

module.exports  = router;