package com.xyan.blog.dao;

import java.util.List;

import com.xyan.blog.model.MessageModel;
import com.xyan.blog.vo.MessageVO;
import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;

/**
 * @description 消息 --dao层接口
 * @author wangming
 * @email：18136442251@163.com
 * @Date:2016-05-30 15:25:02
 */
@MyBatisRepository
public interface MessageDao extends GenericDao<MessageModel, Long>{
	
	/**
	 * @Author:wangming
	 * @Description:查询显示消息
	 * @return
	 * @since 2016年8月11日下午10:03:11
	 */
	public List<MessageVO> selectShowMess();

}