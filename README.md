# SKSmtp

[基于IMB-Swift](https://github.com/IBM-Swift/Swift-SMTP)

注册smtp服务
```
    let smtpConfig =  SKSmtpConfig.init(hostname: "", email: "", password: "")
    
    services.register(smtpConfig)
    try services.register(SKSmtpProvider())
    
```
获取使用
```    
    public func sendCode(req: Request) throws-> EventLoopFuture<String> {

        let result = req.eventLoop.newPromise(String.self)
        let smtp: SKSmtp =  try req.make(SKSmtp.self)
          let result = req.eventLoop.newPromise(String.self)
                    
                    smtp.send(mail, completion: { (error) in
                        print(error as Any)
                        if let error = error {
                            result.fail(error: error)
                        }else{
                            result.succeed(result: skVer.message)
                        }
                    })
                    return result.futureResult
       }
````
