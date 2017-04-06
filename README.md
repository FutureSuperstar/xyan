# xyan

*xyan*是由王明开发的一个【个人博客】。

项目使用的框架为spring+springMVC+mybatis。

***

+ 前后端分别使用了不同的模板。前端主要为数据展现，后端为数据管理。
+ 前端包括文章展示，评论展示，留言。
+ 后端包括文章管理、留言管理、邮件管理、配置管理。
+ 其中留言、评论以及后台需要登录。后台为系统账户登录，其它为合作方登录。系统登录有三次错误密码机会，否则将会锁住账号。

***

### 项目部署：

1. 复制静态资源(图片,css,js,字体等)到nginx的静态资源目录下
2. 保持项目的appliation.propeties的静态资源目录和nginx一致  
3. 导入xyan.sql

***

### 访问：

+ 前端入口：localhost/xyan
+ 后端入口：localhost/xyan/admin/index

***

### 后期展望

+ 登录模块有待改进。
+ 文章的权限可以扩展到普通用户。
+ 验证码，管理员可以配置此项。

***

### 版本说明：

- 2016-12-08 <br/>这个版本采用了动静分离，静态资源是有nginx加载的。由此可以延伸，将java程序部署到内网，静止外网直接访问，提高系统的安全性(反向代理)。
