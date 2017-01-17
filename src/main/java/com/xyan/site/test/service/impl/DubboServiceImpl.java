package com.xyan.site.test.service.impl;

import com.alibaba.dubbo.config.annotation.Service;
import com.xyan.site.test.service.DubboService;

@Service(protocol="dubbo")
public class DubboServiceImpl implements DubboService {

	public String getName(){
		return "xx"+Math.random();
	}
}
