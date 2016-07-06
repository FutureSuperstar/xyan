package com.xyan.frame.grab.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.grab.dao.PageDao;
import com.xyan.frame.grab.model.PageModel;
import com.xyan.frame.grab.service.PageService;

/**
 *@Description：抓取的页面 -- Servcie实现类
 *@Author：wangming
 *@Date:2016-04-14 15:43:51
 */
@Service
@Transactional
public class PageServiceImpl extends GenericServiceImpl<PageModel, Long> implements PageService{

 	
	@Autowired
	private PageDao  pageService;//抓取的页面
	
	
	@Override
	public GenericDao<PageModel, Long> getDao() {
		return  pageService;
	}
}
