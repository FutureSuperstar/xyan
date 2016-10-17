package com.xyan.frame.security.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xyan.frame.base.dao.GenericDao;
import com.xyan.frame.base.service.impl.GenericServiceImpl;
import com.xyan.frame.security.dao.ResourceDao;
import com.xyan.frame.security.model.ResourceModel;
import com.xyan.frame.security.model.RoleModel;
import com.xyan.frame.security.service.ResourceService;

@Service
public class ResourceServiceImpl extends GenericServiceImpl<ResourceModel, Long> implements ResourceService{

	@Autowired
	private ResourceDao resourceDao;
	
	@Override
	public GenericDao<ResourceModel, Long> getDao() {
		return resourceDao;
	}

	@Override
	public List<ResourceModel> selectUserResource(Long userId) {
		return resourceDao.selectUserResource(userId);
	}

	@Override
	public boolean check(String url, Long userId) {
		if(userId==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public List<String> queryRoleResource(List<RoleModel> roles) {
		
		return resourceDao.queryRoleResource(roles);
	}

	
	
	@Override
	public ResourceModel getResourceTree(Long rootId) {
		ResourceModel root=null;
		if(rootId==-1){
			root=new ResourceModel();
		}else{
			root=resourceDao.selectByPrimaryKey(rootId);
		}
		List<ResourceModel> children=this.getChildren(rootId);
		for (ResourceModel resourceModel : children) {
			List<ResourceModel> child=this.getChildren(resourceModel.getId());
			for (ResourceModel resourceModel2 : child) {
				List<ResourceModel> child2=this.getChildren(resourceModel2.getId());
				for (ResourceModel resourceModel3 : child2) {
					List<ResourceModel> child3=this.getChildren(resourceModel3.getId());
					resourceModel3.setSonResource(child3);
				}
				resourceModel2.setSonResource(child2);
			}
			resourceModel.setSonResource(child);
		}
		root.setSonResource(children);
		return root.setSonResource(children);
	}
	
	private List<ResourceModel> getChildren(Long pId){
		ResourceModel rootQuery=new ResourceModel();
		rootQuery.setpId(pId);
		List<ResourceModel> childList=resourceDao.selectModelByExample(rootQuery);
		return childList;
	}

	@Override
	public void save(ResourceModel model) {
		if(model.getId()==null){
			//先更新父节点
			ResourceModel parentModel=new ResourceModel();
			parentModel.setId(model.getpId());
			parentModel.setLeaf("0");//不是叶子节点
			this.update(parentModel);
			model.setLeaf("1");
			this.insert(model);
		}else{
			this.update(model);
		}
	}
}
