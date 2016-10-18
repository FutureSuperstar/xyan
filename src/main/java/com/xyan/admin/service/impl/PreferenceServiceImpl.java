package com.xyan.admin.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import com.xyan.admin.dao.PreferenceDao;
import com.xyan.admin.model.PreferenceModel;
import com.xyan.admin.service.PreferenceService;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;

/**
 *@Description：邮件 -- Servcie实现类
 *@Author：wangming
 *@email：18136442251@163.com
 *@Date:2016-06-14 11:02:12
 */
@Service
@Lazy(false)
@Transactional
public class PreferenceServiceImpl extends GenericServiceImpl<PreferenceModel, Long> implements PreferenceService{
	
	@Autowired
	private PreferenceDao  preferenceDao;//配置
	
	@Override
	public GenericDao<PreferenceModel, Long> getDao() {
		return preferenceDao;
	}

	@Override
	public String selectValue(String name, String kind) {
		if(StringUtils.isBlank(kind)||StringUtils.isBlank(name)){
			return null;
		}else{
			PreferenceModel model=new PreferenceModel(name,kind);
			List<PreferenceModel> dbList=preferenceDao.selectModelByExample(model);
			if(CollectionUtils.isEmpty(dbList)||dbList.size()<1){
				return null;
			}
			return dbList.get(0).getValue();
		}
	}

}
