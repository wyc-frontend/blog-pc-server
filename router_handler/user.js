const db = require('../db/index')
const jwtToken = require('jsonwebtoken')
const bcrypt = require('bcryptjs')

const jwtKey = require('../config');

exports.loginFn = (req, res) => {
    //接收表单数据
    const info = req.body
    //定义查询用户名的sql语句
    const sql = 'select * from user_admin where username=?'
    db.query(sql, info.username, (err, results) => {
        if (err) return res.cc(err)
        if (results.length !== 1) return res.cc('用户名不存在')
        //判断用户输入的密码是否和数据库一致
        const compareResult = bcrypt.compareSync(info.password, results[0].password)
        if (!compareResult) return res.cc('请检查你输入的密码!')
        //登录成功，生成token字符串
        const user = { ...results[0], password: '', user_pic: '' }
        const tokenStr = jwtToken.sign(user, jwtKey.jwtSecretKey, {
            expiresIn: '10h'     //token有效期限10小时
        })
        res.send({
            status: 0,
            message: '登录成功',
            data: {
                token: 'Bearer' + '-' + tokenStr,
                username: results[0].username
            }
        })
    })
}
exports.regFn = (req, res) => {
    const userInfo = req.body

    const sqlStr = 'select * from user_admin where username=?'

    db.query(sqlStr, userInfo.username, (err, result) => {
        if (err) {  //sql语句执行失败
            return res.cc(err)
        }
        if (result.length > 0) {  //用户名被占用
            return res.cc('此用户名已被使用')
        }

        userInfo.password = bcrypt.hashSync(userInfo.password, 10)   //给密码加密
        //定义添加新用户的sql
        const sqlAddUser = 'insert into user_admin set ?'
        db.query(sqlAddUser, { username: userInfo.username, password: userInfo.password }, (err, result) => {
            if (err) {  //sql执行失败
                return res.send({ status: 1, message: err.message })
            }
            if (result.affectedRows !== 1) {
                return res.send({ status: 1, message: '添加用户失败,请稍后重试' })
            }

            return res.send({ status: 0, message: '注册成功!' })
        })
    })
}
exports.loginWebFn = (req, res) => {
    //接收表单数据
    const info = req.body
    //定义查询用户名的sql语句
    
    const sql = 'select * from user where username=?'

    
    db.query(sql, info.username, (err, results) => {
        if (err) return res.cc(err)
        if (results.length !== 1) return res.cc('用户名不存在')
      
        //判断用户输入的密码是否和数据库一致
        const compareResult = bcrypt.compareSync(info.password, results[0].password)
        if (!compareResult) return res.cc('请检查你输入的密码!')
        //登录成功，生成token字符串
        const user = { ...results[0] }
        const tokenStr = jwtToken.sign(user, jwtKey.jwtSecretKey, {
            expiresIn: '10h'     //token有效期限10小时
        })
     
        const addSql = 'update user set token = ? where username = ?'
        db.query(addSql,[tokenStr,info.username],(err,result)=>{
            if(err) return res.cc(err)
        
        })
        res.send({
            status: 0,
            message: '登录成功',
            username: info.username,
            token: tokenStr,
            userId: user.id
        })
    })




}
exports.regWebFn = (req, res) => {
    const userInfo = req.body

    const sqlStr = 'select * from user where username=?'

    db.query(sqlStr, userInfo.username, (err, result) => {
        if (err) {  //sql语句执行失败
            return res.cc(err)
        }
        if (result.length > 0) {  //用户名被占用
            return res.cc('此用户名已被使用')
        }

        userInfo.password = bcrypt.hashSync(userInfo.password, 10)   //给密码加密
        //定义添加新用户的sql
        const sqlAddUser = 'insert into user set ?'
        db.query(sqlAddUser, { username: userInfo.username, password: userInfo.password }, (err, result) => {
            if (err) {  //sql执行失败
                return res.send({ status: 1, message: err.message })
            }
            if (result.affectedRows !== 1) {
                return res.send({ status: 1, message: '添加用户失败,请稍后重试' })
            }
            console.log(result);
            return res.send({ status: 0, message: '注册成功!', data:{userId:result.insertId}})
        })
    })
}
exports.imgUpload = (req, res) => {
    // 获取文件
    const file = req.file;
    let des = file.destination.slice(1)
    const sql = `update user set userpic = '${des}/${file.filename}' where username = '${req.body.userName}'`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)
        if (results.affectedRows !== 1) return res.cc('未知错误，存储失败！')
        // 设置响应类型及状态码
        res.json({
            code: 0,
            msg: '上传成功',
            data: { url: '/' + file.path, uName: req.body.username }

        })

    })

}
exports.userInfo = (req, res) => {
    const data = req.body
    const sql = `select * from user where username = '${data.username}'`
    db.query(sql, (err, results) => {
        if (err) return res.cc(err)  //sql语句执行出错
        // console.log(results[0]);
        // if(results[0].id) return res.cc('没有查询到该用户名！')
            res.json({
            code: 0,
            message: '数据获取成功',
            data: results[0]
        })
    })
    // jwtToken.verify(token, jwtKey, (err, payload)=>{ // 验证成功的话，会得到真正的负载内容payload

    // 	if(err) return res.sendStatus(403); // 解析token错误的话，即验证错误时，返回403
    // 	// 如果解析正确的话，继续走下面的程序   
    // 	//res.json({message: '身份认证成功！',payload}) // 此处举例，但没有必要返回这个负载内容payload

    // })


}
exports.exitLoginWeb = (req,res) =>{
    const sql = `update user set token=null where username = '${req.body.username}'`
    db.query(sql,(err,results)=>{
        if(err) return res.cc(err)
        

        res.send({
            code:0,
            message:'退出成功'
        })
    })
}
exports.msgBoard = (req,res) => {
    const data = req.body
    const sql = 'insert into messageboard set ?'
    db.query(sql,{uname:data.uName,msg:data.msg,time:data.time,img:data.img},(err,results)=>{
        if(err) return res.cc(err)
        res.send({
            code:0,
            message:'操作成功'
        })
    })
}
exports.delMsgBoard = (req,res) => {
    const data = req.body

    const sql = 'delete from messageboard where id = ?'
    db.query(sql,data.id,(err,results)=>{
        if(err) return res.cc(err)
        if(results.affectedRows===0) return res.send({code:3,message:'没有找到对应留言'})
        console.log(results);
        return res.send({
            code:0,
            message:'删除成功'
        })
    })
}
exports.replyMsg = (req,res) => {
    const data = req.body
    const sql = 'insert into reply_table set ?'
    const sql1 = 'update messageboard set ? where id = ?'
    
    db.query(sql,{username:data.uName,img:data.img,msg:data.msg,time:data.time,fid:data.id},(err,results)=>{
        if(err) return res.cc(err)
        db.query(sql1,[{replysts:1},data.id],(err,result)=>{
            if(err) return res.cc(err)
            return res.send({
                code:0,
                message:'操作成功'
            })
        })

    })
}
exports.getMsgBoardData = (req,res) => {
    const sql = 'select * from messageboard'
    db.query(sql,(err,results)=>{
        if(err) return res.cc(err)
        res.send({
            code:0,
            message:"查询数据成功",
            data:{
                results,
                total:results.length
            }
        })
    })
}
exports.getReplyMsgData = (req,res) => {
    const sql = 'select * from reply_table'
    db.query(sql,(err,results)=>{
        if(err) return res.cc(err)
        res.send({
            code:0,
            message:"查询数据成功",
            data:{
                results
            }
        })
    })
}
exports.updateUser = (req,res) => {
    const data = req.body
    const sql = 'update user set ? where id = ?'
    console.log(data);
    data.pwd = bcrypt.hashSync(data.pwd, 10)
    db.query(sql,[{username:data.userName,password:data.pwd},data.id],(err,results)=>{
        if(err) return res.cc(err)
        console.log(results);
        return res.send({
            code:0,
            message:'用户信息更新成功,请重新登录',
            // data:{
            //     username:results[0].username,
            
            // }
        })
        
    })
}
