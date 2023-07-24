const db = require('../db/index')
const jwtToken = require('jsonwebtoken')
const bcrypt = require('bcryptjs')
const config = require('../config')
const jwtKey = `${process.env.TOKEN_KEY}`;
const fs = require('fs')

exports.reqPhotos = (req,res) =>{
    const sql = `select * from user_pic`
    db.query(sql,(err,results)=>{
        if(err) res.cc(err)
        res.json({
            code:0,
            message:"数据获取成功",
            data:results
        })
    })
}

exports.delPhoto = (req,res) =>{
    
    const data = req.body
    const sql = `delete from user_pic where id='${data.picId}'`
    const selectSql = `select * from user_pic where id='${data.picId}'`
    db.query(selectSql,(err,results)=>{
        if(err) res.cc(err)
        if(!results[0]) return res.cc('没有找到对应的图片')
        let url = `.${results[0].userimg}`
        // let url = `http:127.0.0.1${results[0].userimg}`
    
        fs.unlink(url, (err) => {
            if (err) {
              console.error(err);
              return;
            }
            db.query(sql,(err,result)=>{
                if(err) res.cc(err)
                res.send({
                    code:0,
                    message:'删除成功'
                })
            })
            //文件删除成功
            console.log('文件删除成功');
          });
    })
    
}

exports.uploadPhotoWall = (req,res) =>{
    const file = req.file
    const data = req.body
    console.log(file);
    const fileName = file.filename
    let des = file.destination.slice(1)
    const sql = `insert into user_pic (username,userimg) values('${data.username}','${des}/${file.filename}')`
    db.query(sql,(err,results)=>{
        if(err) res.cc(err)
        if(results.affectedRows!==1) return res.cc('未知错误，存储失败！')
        // if(fileName.indexOf('.jpg'||'.jpeg'||'.png'||'.svg')===-1) return res.cc('文件格式有误！')
         
        
        return res.send({
            code:0,
            message:'图片上传成功'
        })
    })
}