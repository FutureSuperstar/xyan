# xyan
------
*xyan*是有王明开发的一个【个人网站】。

项目使用的框架为spring+springMVC+mybatis。

项目目前需要精简代码，理清需求。



前端需求：
------
<ul>
<li>
一、首页
	展示1-2篇推荐的博客，再加上1-2两篇心路
</li>
<li>
二、文章（博客）
	分类：前端和后端、综合项目、运维、数据库
</li>
<li>
三、个人心路
	个人的情感和心里
</li>
<li>
四、留言交流
	提供联系方式以及留言（紧急留言会发送邮件到我的邮箱）
</li>
</ul>
-------

后端需求：
<ul>
<li>
	1、博客分类
</li>
<li>
	2、博客和心路新增和修改
</li>
<li>
	3、回复紧急留言
	
</li>
</ul>	


项目部署：
	1、在tomcat中server.xml的host节点中增加<Context docBase="D:\tmp" path="/img" reloadable="true"/>
	       其中docBase的目录要和application.properties中的file.upload.path保持一致，否则会导致文件上传问题。
	2、导入xyan.sql
