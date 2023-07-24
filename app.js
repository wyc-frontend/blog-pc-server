const express = require('express')
const app = express()
const port = 9000
const cors = require('cors')
const jwt = require('express-jwt')
const joi = require('joi')
const bodyParser = require('body-parser')
const multer = require("multer")
const userHandler = require("./router_handler/user")
const blogHandler = require("./router_handler/blogPublic")
const db = require('./db/index')

const jsonwebtoken = require('jsonwebtoken')
const jwtKey = require('./config')

//webSocket

const ws = require('nodejs-websocket')

const TYPE_ENTER = 0
const TYPE_LEAVE = 1
const TYPE_MSG = 2
const SEND_MSG = 0
const RECEIVE_MSG = 1
/*    type:消息的类型      0:进入      1:离开      2:正常message  */

// 记录当前连接上来的用户数量
let count = 0

// connect 代表每个连接到服务器的用户，都会有一个connect对象
const server = ws.createServer(connect => {
  console.log(connect,'connect对象');
  count++
  connect.userName = connect.path.split('?')[1]
  connect.img = connect.path.split('?')[2]
  const username = decodeURI(connect.userName)
  // 1.告诉所有用户，有人加入了聊天室
  broadcast({
    type: TYPE_ENTER,
    msg: `${username}进入了聊天室`,
    time: new Date().toLocaleTimeString(),
    img: connect.img,
    special: 0,
    countNum: count
  })
  // 每当接受到用户传递数据过来(客户端的send方法)，text事件就会被触发
  connect.on('text', data => {

    // 2.当我们接收到某个用户的数据,广播给所有用户

    const name = data.split('-')[0]
    const msg = data.split('-')[1]
    if (name === username) {
      broadcast({
        img: connect.img,
        type: TYPE_MSG,
        msg: msg,
        name: username,
        time: new Date().toLocaleTimeString()
      })
    }

  })

  // 关闭连接时触发
  connect.on('close', data => {
    console.log('关闭连接');

    // 3.有人离开了,广播给所有用户
    count--
    broadcast({
      type: TYPE_LEAVE,
      msg: `${username}离开了聊天室`,
      time: new Date().toLocaleTimeString(),
      img: connect.img,
      special: 1,
      countNum: count
    })
  })
  // 发生异常
  connect.on('error', data => {
    console.log("发生异常",data);
  })
})

// 广播,给所有的用户发送消息  connections(这个数组里,保存了每个连接)
function broadcast(msg) {
  server.connections.forEach(connect => {
    connect.send(JSON.stringify(msg))
  })
}

server.listen(3000, () => {
  console.log('Server started Complete: ws://127.0.0.1:3000');
})



const storage = multer.diskStorage({
  // 存储位置
  destination: function (req, file, cb) {
    cb(null, './public/images');
  },
  // 文件名
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now() + '.' + file.mimetype.split('/')[1]);
  }
});
const storageWall = multer.diskStorage({
  // 存储位置
  destination: function (req, file, cb) {
    cb(null, './public/photoWall');
  },
  // 文件名
  filename: function (req, file, cb) {
    cb(null, file.fieldname + '-' + Date.now() + '.' + file.mimetype.split('/')[1]);
  }
});
const upload = multer({ storage: storage });
const uploadWall = multer({ storage: storageWall })
//映射本地静态资源根路径
app.use('/public', express.static('public'));

app.use(bodyParser.urlencoded({ extended: false }))

app.use(bodyParser.json())
//使用cors解决跨域
app.use(cors())

app.use(express.urlencoded({ extended: false }))

// 响应数据的中间件
app.use(function (req, res, next) {
  // status = 0 为成功； status = 1 为失败； 默认将 status 的值设置为 1，方便处理失败的情况
  res.cc = (err, status = 1) => {
    res.send({
      // 状态
      status,
      // 状态描述，判断 err 是 错误对象 还是 字符串
      message: err instanceof Error ? err.message : err,
    })
  }

  next()
})

//拦截器
app.all('/*', function (req, res, next) {

  if (req.url != '/api/login' && req.url != '/api/register' && req.url != '/api/userinfo' && req.url != '/api/exit') {

    const sql = 'select token from user where username = ?'
    
    
    if (req.headers.uname) {
      const uname = decodeURI(req.headers.uname)
      db.query(sql, uname, (err, results) => {
        if (err) return res.cc(err)

        let token = results[0].token
        
        if (token) {
          jsonwebtoken.verify(req.headers.authorization, jwtKey.jwtSecretKey, (err, payload) => {
            if (!err) {
              //校验token是否一致
              if (token === req.headers.authorization) {
                next()
              } else {
                return res.send({
                  code: 2,
                  message: '账号在其它ip登录'
                })
              }
            } else {
              return res.send({
                code: 403,
                message: '登录超时'
              })
            }

          })

        }

      })
    } else {
      next()
    }



  } else {
    next()
  }

})





// 设置图片上传接口
app.post('/upload', upload.single('img'), userHandler.imgUpload)
app.post('/upload/photowall', uploadWall.single('img'), blogHandler.uploadPhotoWall)
const useRouter = require('./router')


app.use('/api', useRouter)
app.get('/', (req, res) => {
  res.send('Hello World!')
})

//处理错误的中间件
app.use(function (err, req, res, next) {
  //数据验证失败
  if (err instanceof joi.ValidationError) return res.cc(err)
  // 捕获身份认证失败的错误
  if (err.name === 'UnauthorizedError') return res.cc('身份认证失败！')
  //未知错误
  res.cc(err)
})
app.listen(port, () => {
  console.log(`Example app listening on port ${port}!`)

})