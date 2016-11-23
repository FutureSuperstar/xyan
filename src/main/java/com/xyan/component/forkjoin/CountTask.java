package com.xyan.component.forkjoin;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.Future;
import java.util.concurrent.RecursiveTask;

public class CountTask extends RecursiveTask<Integer>{
	private static final long serialVersionUID = 4350303278521194975L;

	private static final int THRESHOLD=2;//阈值
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
		boolean canCompute=(end-start)<THRESHOLD;
		if (canCompute) {
			System.out.println("不用分割，可以执行任务啦："+start+":"+end);
			for (int i=start;i<=end;i++) {//这里一定是小于等于，注意任务界限
				sum+=i;
			}
		}else{//如果任务大于阈值，就分裂成两个人物。
			System.out.println("任务需要分割哟："+start+":"+end);
			int middle=(end+start)/2;
			CountTask leftTask=new CountTask(start, middle);
			CountTask rightTask=new CountTask(middle+1, end);
			//执行子任务
			leftTask.fork();
			rightTask.fork();
			//拿到子任务结果
			int leftResult=leftTask.join();
			int rightResult=rightTask.join();
			sum=leftResult+rightResult;
		}
		System.out.println("本次任务结果："+sum);
		return sum;
	}

	
	public static void main(String[] args) {
		ForkJoinPool forkJoinPool=new ForkJoinPool();
		CountTask countTask1=new CountTask(1, 4);
		Future<Integer> result1=forkJoinPool.submit(countTask1);
		try {
			System.out.println(result1.get());
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}
	}
}
