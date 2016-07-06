package com.xyan.frame.util;

import java.util.Arrays;


public class Test {
		
	private static void swap(int[] arr,int i,int j){
		arr[i]=arr[i]^arr[j];
		arr[j]=arr[i]^arr[j];
		arr[i]=arr[i]^arr[j];
	}
	
	public static void mySort(int[] arr){
		for(int i=0;i<arr.length/2;i++){
			int max=arr[arr.length-i-1];
			int min=arr[i];
			int minIndex=i;
			int maxIndex=arr.length-i-1;
			for(int j=i;j<arr.length-i;j++){
				if(max<arr[j]){
					max=arr[j];
					maxIndex=j;
				}
				if(min>arr[j]){
					min=arr[j];
					minIndex=j;
				}
			}
			System.out.println("第"+(i+1)+"次最大值："+max+"\t最小值："+min);
			System.out.println("第"+(i+1)+"次前："+Arrays.toString(arr));
			if(arr[i]==max){
				System.out.println("1");
				swap(arr, minIndex, i);
				System.out.println(min+"\t"+arr[arr.length-i-1]);
				if(min!=arr[arr.length-i-1]){
					swap(arr, arr.length-i-1, minIndex);
				}
			}else{
				swap(arr, minIndex,i);
				swap(arr, maxIndex,arr.length-i-1);
			}
			System.out.println("第"+(i+1)+"次后："+Arrays.toString(arr));
		}
	}
	
	public static void main(String[] args) throws Exception {
		int[] arr={4,1,2,3};
		mySort(arr);
		System.out.println(Arrays.toString(arr));
	}
}
