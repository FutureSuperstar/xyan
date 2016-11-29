package com.xyan.component.forkjoin;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Future;
import java.util.concurrent.RecursiveTask;

/**
 * @author wangming
 * <br>fork/join<br>
 *<ul>
 * <li>fork:执行任务</li>
 * <li>join:获取结果</li>
 *</ul>
 * 继承RecursiveTask（有返回结果）。<br>重点的在compute方法中，要在这个里面完成任务分割
 */
public class CountTask extends RecursiveTask<Integer>{
	private static final long serialVersionUID = 4350303278521194975L;

	private static final int THRESHOLD=10000;//阈值
	private int start;
	private int end;
	
	public CountTask(int start,int end) {
		this.start=start;
		this.end=end;
	}
	
	@Override
	protected Integer compute() {
		int sum=0;
		//如果任务足够小，就执行任务
		boolean canCompute=(end-start)<THRESHOLD;//任务分割条件
		if (canCompute) {
			//执行任务--start
			for (int i=start;i<=end;i++) {//这里一定是小于等于，注意任务界限
				sum+=i;
			}
			//执行任务--end
		}else{//如果任务大于阈值，就分裂成两个人物。
			//迭代分割任务
			int middle=(end+start)/2;
			CountTask leftTask=new CountTask(start, middle);
			CountTask rightTask=new CountTask(middle+1, end);
			//执行子任务
			leftTask.fork();
			rightTask.fork();
			
			//拿到子任务结果
			int leftResult=leftTask.join();
			int rightResult=rightTask.join();
			//合并子任务结果
			sum=leftResult+rightResult;
		}
		return sum;
	}

	
	public static void main(String[] args) {
		long startTime=System.currentTimeMillis();
		ForkJoinPool forkJoinPool=new ForkJoinPool();
		int start=1,end=100000000;
		CountTask countTask1=new CountTask(start, end);
		Future<Integer> result1=forkJoinPool.submit(countTask1);
		try {
			System.out.println(result1.get());
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}
		long middleTime=System.currentTimeMillis();
		int sum=0;
		for (int i=start;i<=end;i++) {
			sum+=i;
		}
		System.out.println(sum);
		long endTime=System.currentTimeMillis();
		System.out.println(middleTime-startTime);
		System.out.println(endTime-middleTime);
	}
}
