package com.xyan.frame.base.dao;

import java.util.List;

import com.xyan.frame.base.model.BaseModel;


/**
 * 所有自定义Dao的顶级接口, 封装常用的增删查改操作,
 * 自己的dao可以继承GenericDao.也可以不继承，随需求定。
 * <p/>
 * BaseModel: 表的基类，必须都包含一个ID的主键 <p/>
 * Model : 代表数据库中的表 映射的Java对象类型 <p/>
 * PK :代表对象的主键类型 <p/>
 *
 * @author Wangming
 * @since 2014年6月9日 下午6:14:06
 */
public interface GenericDao<Model extends BaseModel,PK> {

    /**
     * 插入单个对象
     * @param model 对象
     */
    int insert(Model model);
    
    /**
     * 更新单个对象
     * @param model 对象
     */
    int update(Model model);

    /**
     * 通过主键, 删除对象
     * @param id 主键
     */
    int deleteByPrimaryKey(PK id);

    /**
     * 通过主键, 查询对象
     * @param id 主键
     * @return
     */
    Model selectByPrimaryKey(PK id);
    
    /**
     * 根据例子查询对象
     * @param Model 例子对象
     * @return
     */
    List<Model> selectByExample(Model model);
    
    /**
     * 根据例子查询符合条件的个数
     * @param example
     * @return 条数
     */
    int countByExample(Model model);
}
