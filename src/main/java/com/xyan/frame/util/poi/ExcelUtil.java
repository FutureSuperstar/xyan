package com.xyan.frame.util.poi;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.xyan.frame.util.DBUtil;



public class ExcelUtil {
	
	/**
	 * 获取导入文件对象
	 * @param request
	 * @return
	 */
	public static Map<String, MultipartFile> getMultipartFile(
			HttpServletRequest request) {
		//转化请求
		MultipartHttpServletRequest re=(MultipartHttpServletRequest) request;
		//获取前台的文件，key为前台的“name”项，value为文件对象
		Map<String,MultipartFile> map=re.getFileMap();
		return map;
	}
	
	/**
	 * 导入excel文件
	 * @param request 
	 * @param param  表字段字符串，各字段以“,”隔开
	 * @param x  从excel文件的x行开始读
	 * @param y  从excel文件的y列开始读
	 * @param paramtype  表字段的数据类型
	 * @param sheetnum  从第几张表读起 
	 * @param tableName  需更新的表
	 * @return    更新的记录数
	 */
	public static int importExcelFile(HttpServletRequest request,
			String param, int x, int y,  String paramtype,
			int sheetnum, String tableName) throws Exception {
		String ctxPath=request.getSession().getServletContext().
				getRealPath("/")+File.separator+"upload-files"+File.separator;
		createDirectory(ctxPath);
		String[] params=param.split(",");
		String[] paramtypes=paramtype.split(",");
		int countNew=0;
		Map<String, MultipartFile> map = ExcelUtil.getMultipartFile(request);		
		for(Map.Entry<String, MultipartFile> entity:map.entrySet()){
			MultipartFile mf=entity.getValue();
			if(!mf.isEmpty()){
				int paramLen=params.length;
				List<String[]> list = getDataFromExcelFile(x, y, sheetnum,
						ctxPath, mf, paramLen);
				Map<String, Object> propertymap = ExcelUtil.setPropertyType(params,
						paramtypes, paramLen);
				countNew = insertDataIntoDB(param, params, countNew, tableName,
						paramLen, list, propertymap);
			}
		}
		return countNew;
	}
	
	/**
	 * 更新数据库表
	 * @param param
	 * @param params
	 * @param countNew
	 * @param tableName
	 * @param paramLen
	 * @param list
	 * @param propertymap
	 * @return
	 * @throws SQLException
	 */
	private static int insertDataIntoDB(String param, String[] params,
			int countNew, String tableName, int paramLen, List<String[]> list,
			Map<String, Object> propertymap) throws SQLException {
		if(list!=null&&list.size()>0){
			Connection conn=DBUtil.getConnection();
			PreparedStatement prep=null;
			for(String[] str: list){
				System.out.println(str);
				DynamicEntity bean=new DynamicEntity(propertymap);
				System.out.println(bean);
				String sql="insert into "+tableName+"("+param+
						") values(";
				for(int i=0;i<paramLen;i++){
					bean.setValue(params[i], str[i]);
					sql+="?,";
				}
				sql=sql.substring(0, sql.lastIndexOf(","))+")";
				System.out.println(sql);
				prep=conn.prepareStatement(sql);
				for(int i=0;i<paramLen;i++){
					prep.setObject(i+1, str[i]);
				}
				countNew+=prep.executeUpdate();
			}
		}
		return countNew;
	}
	
	/**
	 * 从文件中获取需要导入的数据
	 * @param x
	 * @param y
	 * @param sheetnum 第几个sheet
	 * @param ctxPath
	 * @param mf 文件
	 * @param paramLen
	 * @return
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	public static List<String[]> getDataFromExcelFile(int x, int y,
			int sheetnum, String ctxPath, MultipartFile mf, int paramLen)
			throws IOException, FileNotFoundException {
		String fileName=mf.getOriginalFilename();
		File uploadFile=new File(ctxPath+fileName);
		List<String[]> list=null;
		FileCopyUtils.copy(mf.getBytes(), uploadFile);
		if(fileName.endsWith(".xls")){
			list=ExcelUtil.getDataFromXlsExcelFile(x, y, paramLen,sheetnum, ctxPath, fileName);
		}else if(fileName.endsWith(".xlsx")){
			list=ExcelUtil.getDataFromXlsxExcelFile(x, y, paramLen, sheetnum, ctxPath, fileName);
		}else{
			throw new RuntimeException("文件格式不对");
		}
		uploadFile.delete();
		return list;
	}

	/**
	 * 匹配数据库表字段类型
	 * @param params 表字段数组
	 * @param paramtypes 字段类型
	 * @param paramLen  字段长度
	 * @return
	 * @throws ClassNotFoundException
	 */
	private static Map<String, Object> setPropertyType(String[] params,
			String[] paramtypes, int paramLen) throws ClassNotFoundException {
		Map<String,Object> propertymap=new HashMap<String, Object>();
		for(int i=0;i<paramLen;i++){
			if(paramtypes[i].equalsIgnoreCase("data")){
				propertymap.put(ExcelUtil.fmtDate(ExcelUtil.parseDate(params[i])), 
						Class.forName("java.util."+
								ExcelUtil.toUpperCaseFirstOne(paramtypes[i])));
			}
			propertymap.put(params[i], Class.forName("java.lang."+
					ExcelUtil.toUpperCaseFirstOne(paramtypes[i])));
		}
		return propertymap;
	}
	/**
	 * 首字母小写
	 * @param s
	 * @return
	 */
    public static String toLowerCaseFirstOne(String s)
    {
        if(Character.isLowerCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder()).append(Character.toLowerCase(s.charAt(0))).append(s.substring(1)).toString();
    }
    /**
     * 首字母大写
     * @param s
     * @return
     */
    public static String toUpperCaseFirstOne(String s)
    {
        if(Character.isUpperCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder()).append(Character.toUpperCase(s.charAt(0))).append(s.substring(1)).toString();
    }
	/**
	 * 通过映射给实体类对象赋值
	 * @param te
	 * @param beanmap
	 * @throws NoSuchMethodException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	public static void setFieldValue(Object obj, Map<String, String> beanmap)
			throws NoSuchMethodException, IllegalAccessException,
			InvocationTargetException {
		Class<?> cls=obj.getClass();
		Method[] methods=cls.getDeclaredMethods();
		Field[] fields=cls.getDeclaredFields();
		for(Field field:fields){
			String fieldSetName=parSetName(field.getName());
			if (!checkSetMet(methods, fieldSetName)) {
				continue;
			}
			Method fieldSetMet = cls.getMethod(fieldSetName, field.getType());
			String value =beanmap.get(field.getName());
			if (null != value && !"".equals(value)) {
				String fieldType = field.getType().getSimpleName();
				if ("String".equals(fieldType)) {
					fieldSetMet.invoke(obj, value);
				} else if ("Date".equals(fieldType)) {
					Date temp = parseDate(value);
					fieldSetMet.invoke(obj, temp);
				} else if ("Integer".equals(fieldType) || "int".equals(fieldType)) {
					Integer intval = Integer.parseInt(value);
					fieldSetMet.invoke(obj, intval);
				} else if ("Long".equalsIgnoreCase(fieldType)) {
					Long temp = Long.parseLong(value.substring(0, value.indexOf(".")));
					fieldSetMet.invoke(obj, temp);
				} else if ("Double".equalsIgnoreCase(fieldType)) {
					Double temp = Double.parseDouble(value);
					fieldSetMet.invoke(obj, temp);
				} else if ("Boolean".equalsIgnoreCase(fieldType)) {
					Boolean temp = Boolean.parseBoolean(value);
					fieldSetMet.invoke(obj, temp);
				} else if ("BigDecimal".equalsIgnoreCase(fieldType)) {
					BigDecimal temp = BigDecimal.valueOf(Double.parseDouble(value));
					fieldSetMet.invoke(obj, temp);
				} else {
					System.out.println("not supper type" + fieldType);
				}
			}
		}
	}
	
	/**
	 * 表字段匹配Excel数据
	 * @param params
	 * @param str
	 * @return
	 */
	public static  Map<String, String> matchParamToData(String[] params, String[] str) {
		Map<String,String> beanmap=new HashMap<String, String>();
		for(int i=0;i<str.length;i++){
			beanmap.put(params[i], str[i]);
		}
		return beanmap;
	}

	/**
	 * 从.xls文件中获取数据
	 * @param x 读取excel文件的行起点
	 * @param y	读取excel文件的列起点
	 * @param paramLen 表字段数量
	 * @param sheetnum 第几张表
	 * @param ctxPath  存放路径
	 * @param fileName  文件名
	 * @return
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	private static List<String[]> getDataFromXlsExcelFile(int x, int y, int paramLen,int sheetnum,
			 String ctxPath, String fileName) throws IOException, FileNotFoundException {
		List<String[]> list=new ArrayList<String[]>();
		HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(ctxPath+fileName));
		HSSFSheet sheet=wb.getSheetAt(sheetnum);
//		int rows = sheet.getPhysicalNumberOfRows();
		int rows = sheet.getLastRowNum();
		String[] bean;
		HSSFRow row;
		short format;
		for(int i=x;i<=rows;i++){
			bean=new String[paramLen];
			row=sheet.getRow(i);
//			int cells = row.getPhysicalNumberOfCells();
			for(int j=y;j<paramLen;j++){
				HSSFCell cell=row.getCell(j);
				String value=null;
				if(cell!=null){
					if(cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC){//日期处理
						format = cell.getCellStyle().getDataFormat();  
						SimpleDateFormat sdf = null;
						if(format == 14 || format == 31 || format == 57 || format == 58){  
							//日期  
							sdf = new SimpleDateFormat("yyyy-MM-dd");  
						}else if (format == 20 || format == 32) {  
							//时间  
							sdf = new SimpleDateFormat("HH:mm");  
						}else if(format == 181){
							sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
						}
						double dvalue = cell.getNumericCellValue();  
						Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(dvalue);
						if(sdf==null){
							if(dvalue%1.0==0){
								value = Integer.toString((int)dvalue);
							}else{
								value = "" + dvalue;
							}
						}else{
							value = sdf.format(date);  
						}
					}else{
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_FORMULA:
							//处理带公式的单元格
							try {  
								value = String.valueOf(cell.getStringCellValue());  
							} catch (IllegalStateException e) {  
								value = String.valueOf(cell.getNumericCellValue());  
							}  
							break;
						case Cell.CELL_TYPE_NUMERIC:
							value = "" + cell.getNumericCellValue();break;
						case Cell.CELL_TYPE_STRING:
							value = "" + cell.getStringCellValue();break;
						default:
						}
					}
				}
				bean[j]=value;
			}
			list.add(bean);
		}
		return list;
	}

	/**
	 * 从.xlsx文件中获取数据
	 * @param x 读取excel文件的行起点
	 * @param y	读取excel文件的列起点
	 * @param paramLen 表字段数量
	 * @param sheetnum 第几张表
	 * @param ctxPath  存放路径
	 * @param fileName  文件名
	 * @return
	 * @throws IOException
	 * @throws FileNotFoundException
	 */
	private static List<String[]> getDataFromXlsxExcelFile(int x, int y, int paramLen,
			int sheetnum,String ctxPath, String fileName)
			throws IOException, FileNotFoundException {
		
		List<String[]> list=new ArrayList<String[]>(64);
		XSSFWorkbook xwb=new XSSFWorkbook(new FileInputStream(ctxPath+fileName));
		XSSFSheet sheet=xwb.getSheetAt(sheetnum);
//		int rows = sheet.getPhysicalNumberOfRows();
		int rows = sheet.getLastRowNum();
		String[] bean;
		XSSFRow row;
		short format;
		for(int i=x;i<=rows;i++){
			bean=new String[paramLen];
			row=sheet.getRow(i);
//			int cells = row.getPhysicalNumberOfCells();
			for(int j=y;j<paramLen;j++){
				XSSFCell cell=row.getCell(j);
				String value=null;
				if(cell!=null){
					if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC){//日期处理
						format = cell.getCellStyle().getDataFormat();
						SimpleDateFormat sdf = null;
						if(format == 14 || format == 31 || format == 57 || format == 58){  
							//日期  
							sdf = new SimpleDateFormat("yyyy-MM-dd");  
						}else if (format == 20 || format == 32) {  
							//时间  
							sdf = new SimpleDateFormat("HH:mm");  
						}else if(format == 181){
							sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
						}
						double dvalue = cell.getNumericCellValue();  
						Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(dvalue);
						if(sdf==null){
							if(dvalue%1.0==0){
								value = Integer.toString((int)dvalue);
							}else{
								value = "" + dvalue;
							}
						}else{
							value = sdf.format(date);  
						}
					}else{
						switch (cell.getCellType()) {
						case Cell.CELL_TYPE_FORMULA:
							//处理带公式的单元格
							try {  
								value = String.valueOf(cell.getStringCellValue());  
							} catch (IllegalStateException e) {  
								try {
									value = String.valueOf(cell.getNumericCellValue());  
								} catch (Exception e2) {
									cell.setCellType(Cell.CELL_TYPE_STRING);
									value=cell.getStringCellValue();
								}
							}  
							break;
						case Cell.CELL_TYPE_NUMERIC:
							value = "" + cell.getNumericCellValue();break;
						case Cell.CELL_TYPE_STRING:
							value = "" + cell.getStringCellValue();break;
						default:
						}
					}
				}
				bean[j]=value;
				
			}
			list.add(bean);
		}
		return list;
	}
	
	/**
	 * 数据库每条记录与字段匹配，封装到map
	 * @param map
	 * @param bean 实体类对象
	 */
	public static void matchDataToParams(List<Map<String, String>> map, Object bean) {
		Class<?> cls = bean.getClass();
		Map<String, String> valueMap = new HashMap<String, String>();
		// 取出bean里的所有方法
		Method[] methods = cls.getDeclaredMethods();
		Field[] fields = cls.getDeclaredFields();
		for (Field field : fields) {
			try {
				String fieldType = field.getType().getSimpleName();
				String fieldGetName = ExcelUtil.parGetName(field.getName());
				if (!ExcelUtil.checkGetMet(methods, fieldGetName)) {
					continue;
				}
				Method fieldGetMet = cls.getMethod(fieldGetName, new Class[] {});
				Object fieldVal = fieldGetMet.invoke(bean, new Object[] {});
				String result = null;
				if ("Date".equals(fieldType)) {
					result = ExcelUtil.fmtDate((Date) fieldVal);
				}else{
					if (null != fieldVal) {
						result = String.valueOf(fieldVal);
					}
				}
				valueMap.put(field.getName(), result);
			} catch (Exception e) {
				continue;
			}
		}
		map.add(valueMap);
	}
	
	/**
	 * 把数据写到excel文件中
	 * @param filepath 存放数据的文件路径
	 * @param sheetName  excel文件中的表名
	 * @param sheetnum  excel文件中第几张表
	 * @param tableName  需要导出数据的数据库表
	 * @param x 从excel表中第x行开始存放表
	 * @param y 从excel表中第y列开始存放表
	 * @param param  表字段名，以逗号隔开
	 * @throws SQLException
	 * @throws IOException
	 */
	public static void writeToExcelFile(String filepath,String sheetName, 
			Integer sheetnum, String tableName, int x, int y,String param
			) throws SQLException, IOException {
		filepath = checkDuplicateFile(filepath);
		String[] params=param.split(",");
		List<Object> list = getDataFromDB(tableName, params);
		Workbook wb =null;
		if(filepath.endsWith(".xls")){
			wb = new HSSFWorkbook();
		}else if(filepath.endsWith(".xlsx")){
			wb = new XSSFWorkbook();
		}
		ExcelUtil.writeExcelFile(filepath,sheetName, sheetnum, x, y, params,list, wb);
	}
	
	/**
	 * 从数据库中获取数据
	 * @param tableName 
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	private static List<Object> getDataFromDB(String tableName, String[] params)
			throws SQLException {
		String sql="select * from "+tableName;
		Connection conn=DBUtil.getConnection();
		PreparedStatement prep=conn.prepareStatement(sql);
		ResultSet rs=prep.executeQuery();
		List<Object> list=new ArrayList<Object>();
		while(rs.next()){
			Object[] arr=new Object[params.length];
			for(int i=0;i<params.length;i++){
				arr[i]=rs.getObject(params[i]);
			}
			list.add(arr);
		}
		return list;
	}
	/**
	 * 检查文件名是否正确
	 * @param fileName
	 * @return
	 */
	private static String checkDuplicateFile(String fileName) {
		if(fileName.endsWith("\\")){
			fileName+=new Date().getTime();
		}
		if(!fileName.endsWith(".xls")&&!fileName.endsWith(".xlsx")){
			fileName+=".xls";
		}
		File[] files;
		if(fileName.contains("\\")){
			String path=fileName.substring(0, fileName.lastIndexOf("\\"));
			files=new File(path).listFiles();
		}else{
			files=new File(new File("").getAbsolutePath()).listFiles();
		}
		for(File sub:files){
			if(sub.getName().equalsIgnoreCase(fileName.substring(fileName.lastIndexOf("\\")+1))){
				fileName=fileName.substring(0, fileName.lastIndexOf("."))+"_"+new Date().getTime()+fileName.substring(fileName.lastIndexOf("."));
			}
		}
		return fileName;
	}
	/**
	 * 把数据记录写入excel文件
	 * @param filename  文件名
	 * @param sheetName	 excel表名
	 * @param sheetnum  excel表数量
	 * @param x	从表的第x行写起
	 * @param y 从表的第y行写起
	 * @param params  数据库表字段
	 * @param list	实体类对象集合
	 * @param map 字段与数据map映射集合
	 * @param wb  
	 * @throws IOException
	 */
	private static void writeExcelFile(String filename,String sheetName, Integer sheetnum,
			 int x, int y, String[] params,List<Object> list, Workbook wb) throws IOException {
		FileOutputStream out = new FileOutputStream(filename);
		Sheet s = wb.createSheet();
		Row r = null;
		Cell c = null;
		int paramLen=params.length;
		wb.setSheetName(sheetnum,sheetName);
		System.out.println(list.size());
		for (int rownum = x; rownum < list.size(); rownum++)
		{	
		    r =  s.createRow(rownum);
		    Object[] arr=(Object[]) list.get(rownum-x);
		    for (int cellnum =y; cellnum <paramLen; cellnum ++)
		    {
		        c = r.createCell(cellnum);
		        c.setCellValue( arr[cellnum-y].toString());
		    }
		}
		wb.write(out);
		out.close();
	}

	/**
	 * 创建目录
	 * @param ctxPath
	 */
	public static void createDirectory(String ctxPath) {
		File file=new File(ctxPath);
		if(!file.exists()){
			file.mkdir();
		}
	}
	/**
	 * 格式化string为Date
	 * @param datestr
	* @return date
	*/
	public static Date parseDate(String datestr) {
		if (null == datestr || "".equals(datestr)) {
			return null;
		}
		try {
			String fmtstr = null;
			if (datestr.indexOf(':') > 0) {
				fmtstr = "yyyy-MM-dd HH:mm:ss";
			} else {
				fmtstr = "yyyy-MM-dd";
			}
			SimpleDateFormat sdf = new SimpleDateFormat(fmtstr, Locale.UK);
			return sdf.parse(datestr);
		} catch (Exception e) {
			return null;
		}
	}
	
	/**
	* 日期转化为String
	* @param date
	* @return date string
	*/
	public static String fmtDate(Date date) {
		if (null == date) {
			return null;
		}
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss",Locale.US);
			return sdf.format(date);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	* 判断是否存在某属性的 set方法
	* @param methods
	* @param fieldSetMet
	* @return boolean
	*/
	public static boolean checkSetMet(Method[] methods, String fieldSetMet) {
		for (Method met : methods) {
			if (fieldSetMet.equals(met.getName())) {
				return true;
			}
		}
		return false;
	}

	/**
	* 判断是否存在某属性的 get方法
	* @param methods
	* @param fieldGetMet
	* @return boolean
	*/
	public static boolean checkGetMet(Method[] methods, String fieldGetMet) {
		for (Method met : methods) {
			if (fieldGetMet.equals(met.getName())) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 拼接某属性的 get方法
	 * @param fieldName
	 * @return String
	 */
	public static String parGetName(String fieldName) {
		if (null == fieldName || "".equals(fieldName)) {
			return null;
		}
		return "get" + fieldName.substring(0, 1).toUpperCase()
			+ fieldName.substring(1);
	}

	/**
	 * 拼接在某属性的 set方法
	 * @param fieldName
	 * @return String
	 */
	public static String parSetName(String fieldName) {
		if (null == fieldName || "".equals(fieldName)) {
			return null;
		}
		return "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
	}
}

