package com.xyan.frame.base.service;

import java.util.HashMap;
import java.util.List;

import com.xyan.frame.base.model.BaseModel;
import com.xyan.frame.feature.mybatis.intercept.Page;

/**
 * 所有自定义Service的顶级接口,封装常用的增删查改操作<p/>
 * Model : 代表数据库中的表 映射的Java对象类型<p/>
 * PK :代表对象的主键类型<p/>
 * @author 王明<p/>
 * @since 2015年11月12日<p/>
 */
public interface GenericService<Model extends BaseModel, PK> {

    /**
     * 插入单个对象
     * @param model 对象
     */
    int insert(Model model);
    
    /**
     * 插入或者更新
     * @param model
     * @return
     */
    int insertOrUpdate(Model model);

    /**
     * 更新单个对象
     * @param model 对象
     */
    int update(Model model);

    /**
     * 通过主键, 删除对象
     * @param id 主键
     */
    int delete(PK id);

    /**
     * 通过主键, 查询对象
     * @param id 主键
     * @return model 对象
     */
    Model selectByPrimaryKey(PK id);

    /**
     * 查询多个对象
     * @return 对象集合
     */
    List<Model> selectByExample(Model model);
    
     /**
      * @Author:wangming
      * @Description:查询符合条件的个数
      * @param model
      * @return
      * @since 2015年12月2日 下午4:10:21
      */
    int countByExample(Model model);
    
    /**
     *@Auhor:wangming
     *@Description:分页查询,默认查询1，10
     *@param model 查询对象
     *@param page 分页对象
     *@return 分页数据
     *@Date:2016年5月9日 下午5:33:18
     */
    Page<HashMap<String, Object>> selectByPage(Model model,Page<HashMap<String, Object>> page);
}
