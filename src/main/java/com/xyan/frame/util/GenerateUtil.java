package com.xyan.frame.util;

import java.util.Random;

/**
 * @Description  
 * @author wangming
 * @since 2016年3月4日 下午1:00:35
 */
public class GenerateUtil implements UtilConstant {
	
	/**随机字符串*/
	public static String getSequence(int length,int format){
		StringBuffer sequence=new StringBuffer();
		int temp=0;
		switch (format) {
		case GENERATE_FORMAT_SMALL://小写字母
			for(int i=0;i<length;i++){
				sequence.append(smallCharArr[new Random().nextInt(26)]);
			}
			break;
		case GENERATE_FORMAT_BIG://大写字母
			for(int i=0;i<length;i++){
				sequence.append(bigCharArr[new Random().nextInt(26)]);
			}
			break;
		case GENERATE_FORMAT_NUMBER://数字
			for(int i=0;i<length;i++){
				sequence.append(numberArr[new Random().nextInt(10)]);
			}
			break;
		case GENERATE_FORMAT_CHARACTER://全英文
			for(int i=0;i<length;i++){
				 temp=new Random().nextInt(2);
				 if(temp==1){
					 sequence.append(smallCharArr[new Random().nextInt(26)]);
				 }else{
					 sequence.append(bigCharArr[new Random().nextInt(26)]);
				 }
			}
			break;
		case GENERATE_FORMAT_CHAR_ADN_NUM://英文和数字
			for(int i=0;i<length;i++){
				temp=new Random().nextInt(3);
				 if(temp==1){
					 sequence.append(smallCharArr[new Random().nextInt(26)]);
				 }else if(temp==2){
					 sequence.append(bigCharArr[new Random().nextInt(26)]);
				 }else{
					 sequence.append(numberArr[new Random().nextInt(10)]);
				 }
			}
			break;
		case GENERATE_FORMAT_SYSMBOL://符号
			for(int i=0;i<length;i++){
				sequence.append(symbolArr[new Random().nextInt(15)]);
			}
			break;

		default:
			for(int i=0;i<length;i++){
				temp=new Random().nextInt(4);
				 if(temp==1){
					 sequence.append(smallCharArr[new Random().nextInt(26)]);
				 }else if(temp==2){
					 sequence.append(bigCharArr[new Random().nextInt(26)]);
				 }else if(temp==3){
					 sequence.append(numberArr[new Random().nextInt(10)]);
				 }else{
					 sequence.append(symbolArr[new Random().nextInt(15)]);
				 }
			}
			break;
		}
		return sequence.toString();
	}
}
