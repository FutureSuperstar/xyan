package com.xyan.frame.base.service.impl;

import java.util.HashMap;
import java.util.List;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.model.BaseModel;
import com.xyan.frame.base.service.GenericService;
import com.xyan.frame.feature.mybatis.intercept.Page;
import com.xyan.frame.feature.mybatis.intercept.PageHelper;
import com.xyan.frame.feature.primary.service.impl.CodeServiceImpl;
import com.xyan.frame.util.SpringUtil;

/**
 * GenericService的实现类, 其他的自定义 ServiceImpl, 继承自它,可以获得常用的增删查改操作,
 * 未实现的方法有 子类各自实现
 * <p/>
 * Model : 代表数据库中的表 映射的Java对象类型
 * PK :代表对象的主键类型
 *
 * @author StarZou
 * @since 2014年6月9日 下午6:14:06
 */
public abstract class GenericServiceImpl<Model extends BaseModel, PK> implements GenericService<Model, PK> {

    /**
     * 定义成抽象方法,由子类实现,完成dao的注入
     * @return GenericDao实现类
     */
    public abstract GenericDao<Model, PK> getDao();

    /**
     * 插入单个对象
     * @param model 对象
     */
    public int insert(Model model) {
    	CodeServiceImpl codeService=(CodeServiceImpl) SpringUtil.getBean("codeServiceImpl");
    	Long id=codeService.selectPrimaryKey(model.getClass().getSimpleName());
    	model.setId(id);
        return getDao().insert(model);
    }

    /**
     * 更新单个对象
     * @param model 对象
     */
    public int update(Model model) {
        return getDao().update(model);
    }

    public int insertOrUpdate(Model model) {
    	if(model.getId()==null){
    		return this.insert(model);
    	}else{
    		return this.update(model);
    	}
    }
    /**
     * 通过主键, 删除对象
     * @param id 主键
     */
    public int delete(PK id) {
        return getDao().deleteByPrimaryKey(id);
    }

    /**
     * 通过主键, 查询对象
     * @param id 主键
     * @return
     */
    public Model selectByPrimaryKey(PK id) {
        return getDao().selectByPrimaryKey(id);
    }
    
    public List<HashMap<String,Object>> selectByExample(Model model){
    	return getDao().selectByExample(model);
    }
    
    public List<Model> selectModelByExample(Model model){
    	return getDao().selectModelByExample(model);
    }
    
    public int countByExample(Model model){
    	return getDao().countByExample(model);
    }
    
    @SuppressWarnings("unchecked")
	@Override
	public com.xyan.frame.feature.mybatis.intercept.Page<HashMap<String, Object>> selectByPage(Model model,Page<HashMap<String, Object>> page) {
    	if(page==null){
    		page=new Page<HashMap<String,Object>>(1, 10);
    	}
    	PageHelper.startPage(page.getPageNum(), page.getPageSize());
    	getDao().selectByExample(model);
		return PageHelper.endPage();
	}
}
