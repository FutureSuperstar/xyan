package com.xyan.common.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xyan.frame.util.PropertiesUtil;

@Controller
@RequestMapping("attach")
public class AttachController {
	
	@RequestMapping(value="/viewPic")
	public void viewPic(HttpServletRequest request,
            HttpServletResponse response,String path,String name) throws IOException{
		String basePath =PropertiesUtil.getProperties("file.upload.path");
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
}
