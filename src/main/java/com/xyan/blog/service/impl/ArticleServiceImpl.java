package com.xyan.blog.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.blog.dao.ArticleDao;
import com.xyan.blog.dao.ArticleTypeDao;
import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.model.ArticleTypeModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.common.enums.ArticleType;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.feature.mybatis.intercept.Page;

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
	@Autowired
	private ArticleTypeDao  articleTypeDao;//文章分类
	
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

	@Override
	public Page<HashMap<String, Object>> selectTalkByPage(ArticleVO vo, Page<HashMap<String, Object>> page) {
		vo.setTypeId(ArticleType.TYPE_TALK.getCode());
		List<ArticleTypeModel> typeList=articleTypeDao.selectByParent(ArticleType.TYPE_TALK.getCode());
		List<Long> typeIds=new LinkedList<>();
		for (ArticleTypeModel articleTypeModel : typeList) {
			typeIds.add(articleTypeModel.getId());
		}
		typeIds.add(ArticleType.TYPE_TALK.getCode());
		vo.setTypeIds(typeIds);
		vo.setTypeId(null);
		return super.selectByPage(vo, page);
	}

	@Override
	public Page<HashMap<String, Object>> selectLifeByPage(ArticleVO vo, Page<HashMap<String, Object>> page) {
		vo.setTypeId(ArticleType.TYPE_LIFE.getCode());
		List<ArticleTypeModel> typeList=articleTypeDao.selectByParent(ArticleType.TYPE_LIFE.getCode());
		List<Long> typeIds=new LinkedList<>();
		for (ArticleTypeModel articleTypeModel : typeList) {
			typeIds.add(articleTypeModel.getId());
		}
		typeIds.add(ArticleType.TYPE_LIFE.getCode());
		vo.setTypeIds(typeIds);
		vo.setTypeId(null);
		return super.selectByPage(vo, page);
	}

	@Override
	public Page<HashMap<String, Object>> selectTechnologyByPage(ArticleVO vo, Page<HashMap<String, Object>> page) {
		vo.setTypeId(ArticleType.TYPE_TECHNOLOGY.getCode());
		List<ArticleTypeModel> typeList=articleTypeDao.selectByParent(ArticleType.TYPE_TECHNOLOGY.getCode());
		List<Long> typeIds=new LinkedList<>();
		for (ArticleTypeModel articleTypeModel : typeList) {
			typeIds.add(articleTypeModel.getId());
		}
		typeIds.add(ArticleType.TYPE_TECHNOLOGY.getCode());
		vo.setTypeIds(typeIds);
		vo.setTypeId(null);
		return super.selectByPage(vo, page);
	}
	
}
