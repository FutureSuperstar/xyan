package com.xyan.blog.dao;

import com.xyan.blog.model.MessageModel;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;

/**
 * @description 消息 --dao层接口
 * @author wangming
 * @email：w18855525068@163.com
 * @Date:2016-05-30 15:25:02
 */
@MyBatisRepository
public interface MessageDao extends GenericDao<MessageModel, Long>{

 }