package com.xyan.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author wangming
 *权限管理--角色管理
 */
@Controller
@RequestMapping("/admin/authority/role")
public class RoleController {
	
	@RequestMapping(method=RequestMethod.GET)
	public String role(){
		return "/admin/authority/role";
	}
}
