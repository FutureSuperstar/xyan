package com.xyan.frame.feature.primary.dao;

import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;
import com.xyan.frame.feature.primary.model.CodeModel;

@MyBatisRepository
public interface CodeDao {
	
	 /**
	  * @Author:wangming
	  * @Description:锁表
	  * @param modelName
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	public CodeModel selectLock(String modelName);
	
	 /**
	  * @Author:wangming
	  * @Description:(描述方法的用途)
	  * @param model
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	public int insert(CodeModel model);
	 /**
	  * @Author:wangming
	  * @Description:(描述方法的用途)
	  * @param model
	  * @return
	  * @since 2015年12月2日 下午4:10:21
	  */
	public int update(CodeModel model);
}
