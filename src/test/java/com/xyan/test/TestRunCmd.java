package com.xyan.test;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

class StreamDrainer implements Runnable {
    private InputStream ins;

    public StreamDrainer(InputStream ins) {
        this.ins = ins;
    }

    public void run() {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(ins,"GBK"));
            String line = null;
            while ((line = reader.readLine()) != null) {
                System.out.println(Thread.currentThread().getName()+":"+line);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}

public class TestRunCmd {

    public static void main(String[] args) {
        try {
        	 String[] cmd = new String[] { "cmd.exe", "/k", "start","/b" ,"d:\\tmp\\12\\git.bat" };
        	//String cmd="net user";
        	//String cmd="git clone  https://github.com/NaNyoyo/yoyo.git";
            Process process = Runtime.getRuntime().exec(cmd);
            
            new Thread(new StreamDrainer(process.getInputStream()),"输出信息").start();
            new Thread(new StreamDrainer(process.getErrorStream()),"错误信息").start();
            
            process.getOutputStream().close();

            int exitValue = process.waitFor();
            int exitValue2= process.exitValue();
            System.out.println("返回值：" + exitValue);
            System.out.println("返回值：2" + exitValue2);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
