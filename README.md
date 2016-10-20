# xyan
------
*xyan*是由王明开发的一个【个人网站】。

项目使用的框架为spring+springMVC+mybatis。

------------------------------
前后端分别使用了不同的模板。前端主要为数据展现，后端为数据管理。
前端包括文章展示，评论展示，留言。
后端包括文章管理、留言管理、邮件管理、配置管理。
其中留言、评论以及后台需要登录。后台为系统账户登录，其它为合作方登录。系统登录有三次错误密码机会，否则将会锁住账号。

------------------------------
项目部署：
	1、在tomcat中server.xml的host节点中增加<Context docBase="D:\tmp" path="/img" reloadable="true"/>
	       其中docBase的目录要和application.properties中的file.upload.path保持一致，否则会导致文件上传问题。
	2、导入xyan.sql
------------------------------
访问：
	前端入口：localhosst:8080/xyan
	后端入口：localhosst:8080/xyan/admin/index
