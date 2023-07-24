const db = require('../db')

exports.writeBlogs = (req,res) =>{
    const data = req.body
 
    const sql = 'insert into article_table set ?'
    db.query(sql,{username:data.username,time:data.time,html:data.main,description:data.description,title:data.title,cname:data.cname,text:data.text},(err,results)=>{
        if(err) return res.cc(err)
        return res.send({
            code:0,
            message:'保存成功'
        })
    })
}
exports.addClassify = (req,res) =>{
    const data = req.body
    const sql = 'insert into article_classify_table set ?'
    db.query(sql,{cname:data.cName},(err,results)=>{
        if(err) return res.cc(err) 
        res.send({
            code:0,
            message:'添加分类成功'
        })
    })
}
exports.getClassifyList = (req,res) =>{
    const sql = 'select * from article_classify_table'
    db.query(sql,(err,results)=>{
        if(err) return res.cc(err)
        return res.send({
            code:0,
            message:'分类列表数据获取成功',
            data:results
        })
    })
}
exports.delClassify = (req,res) =>{
    const data = req.body
    
    const sql = 'delete from article_classify_table where cid = ?'
    db.query(sql,data.cid,(err,results)=>{
        if(err) return res.cc(err)
        return res.send({
            code:0,
            message:'删除成功'
        })
    })
}
exports.updClassify = (req,res) =>{
    const data = req.body
    const sql = 'update article_classify_table set ? where cid = ?'
    db.query(sql,[{cname:data.cname},data.cid],(err,results)=>{
        if(err) return res.cc(err)
        return res.send({
            code:0,
            message:'修改成功'
        })
    })
}
exports.getArticleList = (req,res) =>{
    const sql = 'select * from article_table'
    db.query(sql,(err,results)=>{
        if(err) return res.cc(err)
        res.send({
            code:0,
            message:'文章列表获取成功',
            data:results
        })
    })
}
exports.delArticle = (req,res) => {
    const data = req.body
    const sql = 'delete from article_table where id = ?'
    db.query(sql,data.id,(err,results)=>{
        if(err) return res.cc(err)
        return res.send({code:0,message:'删除成功'})
    })
}
exports.updArticle = (req,res) => {
    const data = req.body
    console.log(data);
    const sql = 'update article_table set ? where id = ?'
    db.query(sql,[{html:data.html,text:data.text},data.id],(err,results)=>{
        if(err) return res.cc(err)
        if(results.affectedRows!==1) return res.cc('修改失败，发送未知错误')
        return res.send({code:0,message:'文章修改成功',data:{results}})
    })
}