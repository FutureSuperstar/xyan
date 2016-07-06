package com.xyan.frame.quartz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.quartz.dao.ScheduleJobDao;
import com.xyan.frame.quartz.model.ScheduleJobModel;
import com.xyan.frame.quartz.service.ScheduleJobService;

@Service
public class ScheduleJobServiceImpl extends GenericServiceImpl<ScheduleJobModel, Long> implements ScheduleJobService{

	@Autowired
	private ScheduleJobDao scheduleJobDao;
	
	@Override
	public GenericDao<ScheduleJobModel, Long> getDao() {
		return scheduleJobDao;
	}

}
