package com.xyan.common.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.xyan.frame.base.web.JsonResult;
import com.xyan.frame.util.FileUtil;
import com.xyan.frame.util.PropertiesUtil;

@Controller
@RequestMapping("attach")
public class AttachController {
	
	@RequestMapping(value="/viewPic")
	public void viewPic(HttpServletRequest request,
            HttpServletResponse response,String path,String name) throws IOException{
		String basePath =PropertiesUtil.getProperties("file.upload.path");
		name=new String(name.getBytes("iso-8859-1"),"utf-8");
		File file = new File(basePath+path+File.separator+name);
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0L);
		response.setHeader("Content-Length", file.length() + "");
		InputStream in = new FileInputStream(file);
		OutputStream out = response.getOutputStream();
		try {
			byte[] buffer = new byte[64 * 1024];
			int b;
			while ((b = in.read(buffer)) > -1) {
				out.write(buffer, 0, b);
			}

			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
			throw new IOException();
		} finally {
			in.close();
			out.close();
		}
        return;
	}
	
	@RequestMapping(value="wangEditor/upload")
	public void ueConfig(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String imageUrl=PropertiesUtil.getProperties("image.url");
		String basePath =PropertiesUtil.getProperties("file.upload.path");//上传路径
		//String basePath=request.getSession().getServletContext().getRealPath("/").replace("xyan", imageUrl)+"upload\\";
		
		String now=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		
		MultipartRequest multipartRequest = (MultipartRequest) request;
		MultipartFile mfile = (MultipartFile) multipartRequest.getFileMap().values().toArray()[0];
		// 文件全名称
		String fileName = mfile.getOriginalFilename();
		// 文件后缀
		String suffix = fileName.substring(fileName.lastIndexOf(".")+1);
		String prefix=fileName.substring(0, fileName.lastIndexOf("."));
		// 真正文件夹
		String realFolder = basePath+now+"/";
		// 真正文件路径
		String realFile = realFolder+fileName;
		prefix=UUID.randomUUID().toString();
		prefix=FileUtil.getFileName(realFolder, fileName, suffix, prefix);
		realFile=realFolder+prefix+"."+suffix;
		// 保存文件
		FileUtil.writeFile(mfile.getBytes(), realFile);
		
		response.setContentType("text/plain;charset=utf-8");
		//输出文件访问路径
		response.getWriter().write(imageUrl+"/"+now+"/"+prefix+"."+suffix);
	}
	
	@RequestMapping(value="upload", method = RequestMethod.POST)
	@ResponseBody
	public JsonResult upload(
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		JsonResult jsonResult=null;
		try {
			MultipartRequest multipartRequest = (MultipartRequest) request;
			Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
			for (MultipartFile attach : fileMap.values()) {
				//对文件进行处理
				System.out.println(attach.getOriginalFilename());
			}
			jsonResult=new JsonResult(JsonResult.SERVER_SUCCESS,true);
		}catch(Exception e) {
			e.printStackTrace();
			jsonResult=new JsonResult(JsonResult.SERVER_SUCCESS,false,e);
		}
		return jsonResult;
	}
	
	
}
