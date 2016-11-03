package com.xyan.blog.service;

import java.util.HashMap;

import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.frame.base.service.GenericService;
import com.xyan.frame.feature.mybatis.intercept.Page;

/**
 *@Description：文章（博客） --Servcie
 *@Author：wangming
 *@Date:2016-05-16 10:32:51
 */
public interface ArticleService extends GenericService<ArticleModel, Long>{
	
	Page<HashMap<String, Object>> selectTalkByPage(ArticleVO vo,Page<HashMap<String, Object>> page);
	Page<HashMap<String, Object>> selectLifeByPage(ArticleVO vo,Page<HashMap<String, Object>> page);
	Page<HashMap<String, Object>> selectTechnologyByPage(ArticleVO vo,Page<HashMap<String, Object>> page);
}
