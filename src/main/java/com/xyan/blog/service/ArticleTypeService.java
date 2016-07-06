package com.xyan.blog.service;

import java.util.List;

import com.xyan.blog.model.ArticleTypeModel;
import com.xyan.frame.base.service.GenericService;

/**
 *@Description：文章类别 --Servcie
 *@Author：wangming
 *@email：w18855525068@163.com
 *@Date:2016-06-07 14:11:45
 */
public interface ArticleTypeService extends GenericService<ArticleTypeModel, Long>{
	
	/**
	 * @param pId 父Id
	 * @return
	 */
	List<ArticleTypeModel> selectByParent(Long pId);
}
