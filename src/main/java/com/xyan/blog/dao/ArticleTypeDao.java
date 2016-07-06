package com.xyan.blog.dao;

import java.util.List;

import com.xyan.blog.model.ArticleTypeModel;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;

/**
 * @description  文章类别 --dao层接口
 * @author wangming
 * @email：w18855525068@163.com
 * @Date:2016-06-07 14:11:45
 */
@MyBatisRepository
public interface ArticleTypeDao extends GenericDao<ArticleTypeModel, Long>{

	List<ArticleTypeModel> selectByParent(Long pId);
}