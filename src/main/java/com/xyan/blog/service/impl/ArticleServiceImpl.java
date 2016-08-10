package com.xyan.blog.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.blog.dao.ArticleDao;
import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;

/**
 *@Description：文章（博客） -- Servcie实现类
 *@Author：wangming
 *@Date:2016-05-16 10:32:51
 */
@Service
@Transactional
public class ArticleServiceImpl extends GenericServiceImpl<ArticleModel, Long> implements ArticleService{

 	
	@Autowired
	private ArticleDao  articleDao;//文章（博客）
	
	@Override
	public GenericDao<ArticleModel, Long> getDao() {
		return  articleDao;
	}
	
	@Override
	public int insert(ArticleModel model) {
		
		//默认值
		model.setUserId(1L);
		//初始值
		model.setCreateTime(new Date());
		model.setUpdateTime(new Date());
		model.setReadCount(1);
		model.setCommentCount(1);
		return super.insert(model);
	}
	
	@Override
	public int update(ArticleModel model) {
		model.setUpdateTime(new Date());
		return super.update(model);
	}
}
