package com.xyan.frame.quartz.dao;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.feature.mybatis.annotation.MyBatisRepository;
import com.xyan.frame.quartz.model.ScheduleJobModel;

@MyBatisRepository
public interface ScheduleJobDao extends GenericDao<ScheduleJobModel, Long>{

}
