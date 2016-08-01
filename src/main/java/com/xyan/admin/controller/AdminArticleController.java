package com.xyan.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xyan.blog.model.ArticleModel;
import com.xyan.blog.model.ArticleTypeModel;
import com.xyan.blog.service.ArticleService;
import com.xyan.blog.service.ArticleTypeService;
import com.xyan.blog.vo.ArticleVO;
import com.xyan.frame.base.web.ResponseModel;
import com.xyan.frame.feature.mybatis.intercept.Page;
import com.xyan.frame.feature.web.MediaTypes;

/**
 * @author wangming
 *文章管理
 */
@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {
	
	private Logger logger=Logger.getLogger(AdminArticleController.class);
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private ArticleTypeService articleTypeService;
	
	
	/**
	 * 文章列表
	 * @return
	 */
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index(){
		return new ModelAndView("/admin/article/article").addObject("articleList", articleService.selectByExample(null));
	}
	
	@RequestMapping(value="pageData",method=RequestMethod.POST)
	public ModelAndView pageData(ArticleVO query,Page<HashMap<String, Object>> page){
		logger.warn("/admin/article/pageData");
		return new ModelAndView("/admin/article/articleData")
			.addObject("page", articleService.selectByPage(query, page));
	}
	
	/**
	 * 新增文章
	 * @return
	 */
	@RequestMapping(value="add",method=RequestMethod.GET)
	public String toAdd(){
		return "/admin/article/articleAdd";
	}
	
	@RequestMapping(value="edit",method=RequestMethod.GET)
	public ModelAndView toEdit(Long id){
		ArticleModel model=articleService.selectByPrimaryKey(id);
		ArticleTypeModel typeModel=articleTypeService.selectByPrimaryKey(model.getTypeId());
		return new ModelAndView("/admin/article/articleAdd")
			.addObject("typeName", typeModel!=null?typeModel.getName():"")
			.addObject("model", model);
	}
	
	/**
	 * 文章类别
	 * @return
	 */
	@RequestMapping(value="dialog/open",method=RequestMethod.GET)
	public String dialog(){
		return "/admin/article/articleType";
	}
	
	@RequestMapping(value="dialog/img",method=RequestMethod.POST)
	public ModelAndView img(String url){
		return new ModelAndView("/admin/article/articleImg").addObject("url", url);
	}
	
	/**
	 * 保存文章
	 * @param articleModel
	 * @param attributes
	 * @return
	 */
	@RequestMapping(value="save",method=RequestMethod.POST)
	public String save(ArticleModel articleModel,HttpServletRequest request,RedirectAttributes attributes){
		if(articleModel.getId()==null){
			articleService.insert(articleModel);
		}else{
			articleService.update(articleModel);
		}
		attributes.addFlashAttribute("message", "保存成功");
		return "redirect:/admin/article";
	}
	
	/**
	 * 文章树
	 * @param pId
	 * @return
	 */
	@RequestMapping(value="getChildren",method=RequestMethod.GET,produces=MediaTypes.JSON_UTF_8)
	@ResponseBody
	public List<ArticleTypeModel> getChildren(Long pId){
		if(pId==null){
			pId=0L;
		}
		List<ArticleTypeModel> list=articleTypeService.selectByParent(pId);
		List<ArticleTypeModel> tmpList=null;
		for (ArticleTypeModel articleTypeModel : list) {
			tmpList=articleTypeService.selectByParent(articleTypeModel.getId());
			articleTypeModel.setIsParent(!CollectionUtils.isEmpty(tmpList));
		}
		return list;
	}
	
	/**
	 * 保存文章类别
	 * @param dataId 
	 * @param datapId
	 * @param dataName
	 * @return
	 */
	@RequestMapping(value="saveType",method=RequestMethod.POST,produces=MediaTypes.JSON_UTF_8)
	@ResponseBody
	public ResponseModel saveType(String dataId,String datapId,String dataName){
		ArticleTypeModel model=parseArticleType(dataId, datapId, dataName);
		if(model.getId()==null){
			articleTypeService.insert(model);
		}else if(articleTypeService.selectByPrimaryKey(model.getId())==null){
			articleTypeService.insert(model);
		}else{
			articleTypeService.update(model);
		}
		return new ResponseModel(true);
	}
	
	private ArticleTypeModel parseArticleType(String dataId,String datapId,String dataName){
		ArticleTypeModel model=null;
		if(StringUtils.isBlank(dataName)){
			throw new RuntimeException("名称不能为空");
		}
		String reg="^\\d+$";
		if(datapId.matches(reg)){
			model=new ArticleTypeModel();
			model.setpId(Long.parseLong(datapId));
			if(dataId.matches(reg)){
				model.setId(Long.parseLong(dataId));
			}
		}else{
			throw new RuntimeException("系统故障，丢失父级！");
		}
		model.setName(dataName);
		return model;
	}
	
	
}
