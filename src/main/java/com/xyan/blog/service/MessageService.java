package com.xyan.blog.service;

import java.util.List;

import com.xyan.blog.model.MessageModel;
import com.xyan.blog.vo.MessageVO;
import com.xyan.frame.base.service.GenericService;

/**
 *@Description：文章（博客） --Servcie
 *@Author：wangming
 *@Date:2016-05-16 10:32:51
 */
public interface MessageService extends GenericService<MessageModel, Long>{
	
	/**
	 * @Author:wangming
	 * @Description：查询显示消息
	 * @return
	 * @since 2016年8月11日下午10:03:26
	 */
	public List<MessageVO> selectShowMess();
}
