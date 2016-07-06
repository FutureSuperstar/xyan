package com.xyan.site.test.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xyan.frame.quartz.common.JobUtils;
import com.xyan.frame.quartz.model.ScheduleJobModel;
import com.xyan.frame.quartz.service.ScheduleJobService;
import com.xyan.site.test.model.MyTestModel;
import com.xyan.site.test.model.OtherModel;
import com.xyan.site.test.model.TestModel;
import com.xyan.site.test.service.TestService;

@Controller
@RequestMapping(value = "test")
public class TestController {

	private static Logger logger=Logger.getLogger(TestController.class);
	@Autowired
	private TestService service;
	
	@Autowired
	private ScheduleJobService jobServicee;
	
	@RequestMapping(value = "testJob")
	@ResponseBody
	public String testJob() throws SchedulerException {
		logger.warn("xxxxxxxxxxxxx");
		List<ScheduleJobModel> jobList=jobServicee.selectByExample(null);
		JobUtils.addJob(jobList);
		return "test";
	}
	
	@RequestMapping(value = "pauseJob")
	@ResponseBody
	public String pauseJob() throws SchedulerException {
		ScheduleJobModel job=jobServicee.selectByPrimaryKey(3L);
		JobUtils.pauseJob(job);
		return "test";
	}
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String test() {
		return "/test/test";
	}
	
	@RequestMapping(value="kindeditor",method = RequestMethod.GET)
	public String kindeditor() {
		return "/test/kindeditor";
	}
	
	@RequestMapping(value="ueditor",method = RequestMethod.GET)
	public String ueditor() {
		return "/test/ueditor";
	}
	
	
	
	
	

	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "insert")
	@ResponseBody
	public String insert(HttpServletRequest request,TestModel[] arrays,MyTestModel myTestModel,OtherModel otherModel) {
		Map map=request.getParameterMap();
		System.out.println(map);
		System.out.println(myTestModel);
		System.out.println(otherModel.toString());
		return "test";
	}

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public String upload(HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String responseStr = "";
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
		// 文件保存路径 ctxPath本地路径

		String ctxPath = request.getSession().getServletContext()
				.getRealPath("/")
				+ File.separator + "uploadFiles";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");

		String ymd = sdf.format(new Date());

		ctxPath += File.separator + ymd + File.separator;

		System.out.println("ctxpath=" + ctxPath);

		// 创建文件夹

		File file = new File(ctxPath);

		if (!file.exists()) {

			file.mkdirs();

		}

		String fileName = null;

		for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {

			// 上传文件

			MultipartFile mf = entity.getValue();

			fileName = mf.getOriginalFilename();// 获取原文件名

			System.out.println("filename=" + fileName);

			File uploadFile = new File(ctxPath + fileName);

			try {

				FileCopyUtils.copy(mf.getBytes(), uploadFile);

				responseStr = "上传成功"+fileName;

			} catch (IOException e) {

				responseStr = "上传失败";

				e.printStackTrace();

			}finally{
				System.out.println(responseStr+"\t"+fileName);
			}

		}

		return responseStr;

	}
	

	
}

