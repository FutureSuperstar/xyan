package com.xyan.frame.feature.primary.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyan.frame.feature.primary.dao.CodeDao;
import com.xyan.frame.feature.primary.model.CodeModel;
import com.xyan.frame.feature.primary.service.CodeService;
import com.xyan.frame.feature.web.exception.XyanException;
import com.xyan.frame.util.MathUtil;

/**
 * @Description  (用一句话描述用途)
 * @author wangming
 * @since 2016年3月5日 下午7:38:15
 */
@Service
public class CodeServiceImpl implements CodeService{

	@Autowired
	private CodeDao codeDao;
	
	@Override
	public Long selectPrimaryKey(String modelName) {
		Long id=null;
		try {
			if(modelName==null){
				throw new XyanException("need model name");
			}
			CodeModel model=codeDao.selectLock(modelName);
			if(model==null){
				id=0L;
				model=new CodeModel();
				model.setModelName(modelName);
				model.setValue(id+"");
				codeDao.insert(model);
			}else{
				id=MathUtil.str2Long(model.getValue())+1;
				model.setValue(id+"");
				codeDao.update(model);
			}
		} catch (XyanException e) {
			e.printStackTrace();
		}
		return id;
	}

}
