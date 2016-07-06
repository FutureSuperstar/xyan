package com.xyan.frame.util.jxl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class ExcelUtil {

	/**
	 * @param rowStart
	 * @param colStart
	 * @param sheetNum
	 * @param ctxPath 临时文件存放路径
	 * @param mf
	 * @return
	 */
	public static List<String[]> getData(int rowStart,int colStart,int sheetNum,String ctxPath, MultipartFile mf){
		List<String[]> list = new ArrayList<String[]>();
		Workbook workbook = null;
		File uploadFile=null;
		try {
			String fileName=mf.getOriginalFilename();
			uploadFile=new File(ctxPath+fileName);
			FileCopyUtils.copy(mf.getBytes(), uploadFile);
			workbook = Workbook.getWorkbook(uploadFile);
			Sheet sheet=workbook.getSheet(sheetNum);
			int rows=sheet.getRows();
			String[] arr=null;
			Cell[] cells=null;
			int i=0,//数组下标
				cols=0;//每行的列数
			int colIndex=0;//第几列
			for (int rowIndex = rowStart; rowIndex< rows; rowIndex++) {
				cells=sheet.getRow(rowIndex);
				cols=cells.length;
				arr=new String[cols];
				colIndex=colStart;
				i=0;
				for (Cell cell=cells[colIndex];colIndex<cols;colIndex++) {
					arr[i++]=cell.getContents();
				}
				list.add(arr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(workbook!=null){
				workbook.close();
				workbook=null;
			}
			uploadFile.deleteOnExit();
		}
		return list;
	}

}
