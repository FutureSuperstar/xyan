package com.xyan.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.feature.web.MediaTypes;
import com.xyan.frame.security.model.ResourceModel;
import com.xyan.frame.security.service.ResourceService;

/**
 * @author wangming
 *权限管理--资源管理
 */
@Controller
@RequestMapping("/admin/authority/resource")
public class ResourceController {
	
	@Autowired
	private ResourceService resourceService;
	
	/**
	 * 进入资源管理页面
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET)
	public String role(){
		return "/admin/authority/resource";
	}
	
	/**
	 * 保存
	 * @param model
	 * @return
	 */
	@RequestMapping(value="save",method=RequestMethod.POST,produces=MediaTypes.JSON_UTF_8)
	@ResponseBody
	public ResponseModel save(ResourceModel model){
		ResponseModel responseModel=new ResponseModel();
		resourceService.save(model);
		responseModel.setSuccess(true);
		responseModel.setLogin(true);
		return responseModel;
	}
	
	@RequestMapping(value="treeData",method=RequestMethod.POST,produces=MediaTypes.JSON_UTF_8)
	@ResponseBody
	public List<ResourceModel> treeData(ResourceModel model){
		if(model.getpId()==null&&model.getId()==null){
			model.setpId(-1L);
		}else{
			model.setpId(model.getId());
			model.setId(null);
		}
		List<ResourceModel> list=resourceService.selectByExample(model);
		return list;
	}
}


