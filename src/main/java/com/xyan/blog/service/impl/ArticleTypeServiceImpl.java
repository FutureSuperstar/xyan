package com.xyan.blog.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.blog.dao.ArticleTypeDao;
import com.xyan.blog.model.ArticleTypeModel;
import com.xyan.blog.service.ArticleTypeService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;

/**
 *@Description： 文章类别-- Servcie实现类
 *@Author：wangming
 *@email：w18855525068@163.com
 *@Date:2016-06-07 14:11:45
 */
@Service
@Transactional
public class ArticleTypeServiceImpl  extends GenericServiceImpl<ArticleTypeModel, Long> implements ArticleTypeService{

 	private static final Logger logger = LoggerFactory.getLogger(ArticleTypeServiceImpl.class);
 	
	@Autowired
	private ArticleTypeDao articleTypeDao;//

	@Override
	public GenericDao<ArticleTypeModel, Long> getDao() {
		return articleTypeDao;
	}

	@Override
	public List<ArticleTypeModel> selectByParent(Long pId) {
		return articleTypeDao.selectByParent(pId);
	}
	
	
}
