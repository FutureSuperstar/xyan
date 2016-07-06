package com.xyan.frame.grab.dao;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;
import com.xyan.frame.grab.model.PageModel;

/**
 * @description 抓取的页面 --dao层接口
 * @author wangming
 * @Date:2016-04-14 15:41:58
 */
@MyBatisRepository
public interface PageDao extends GenericDao<PageModel, Long>{

	
}