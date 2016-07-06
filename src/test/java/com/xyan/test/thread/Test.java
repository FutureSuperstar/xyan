package com.xyan.test.thread;

/**
* Java线程：并发协作-生产者消费者模型
*
* @author ssss 2009-11-4 14:54:36
*/
public class Test {
        public static void main(String[] args) {
                Godown godown = new Godown(30);
                Consumer c1 = new Consumer(50, godown,"张三");
                Consumer c2 = new Consumer(20, godown,"李四");
                Consumer c3 = new Consumer(30, godown,"王五");
                Consumer c4 = new Consumer(30, godown,"王二麻子");
                Producer p1 = new Producer(10, godown,"上海");
                Producer p2 = new Producer(10, godown,"北京");
                Producer p7 = new Producer(80, godown,"武汉");
                Producer p3 = new Producer(80, godown,"南京");
                Producer p4 = new Producer(80, godown,"苏州");

                c1.start();
                c2.start();
                c3.start();
                c4.start();
                p3.start();
                p4.start();
                p1.start();
                p2.start();
                p7.start();
        }
}

/**
* 仓库
*/
class Godown {
        public static final int max_size = 100; //最大库存量
        public int curnum;     //当前库存量

        Godown() {
        }

        Godown(int curnum) {
                this.curnum = curnum;
        }

        /**
         * 生产指定数量的产品
         *
         * @param neednum
         */
        public synchronized void produce(int neednum,String name) {
                //测试是否需要生产
                while (neednum + curnum > max_size) {
                        System.out.println(name+"要生产的产品数量" + neednum + "超过剩余库存量" + (max_size - curnum) + "，暂时不能执行生产任务!");
                        try {
                                //当前的生产线程等待
                                wait();
                        } catch (InterruptedException e) {
                                e.printStackTrace();
                        }
                }
                //满足生产条件，则进行生产，这里简单的更改当前库存量
                curnum += neednum;
                System.out.println(name+"已经生产了" + neednum + "个产品，现仓储量为" + curnum);
                //唤醒在此对象监视器上等待的所有线程
                notifyAll();
        }

        /**
         * 消费指定数量的产品
         *
         * @param neednum
         */
        public synchronized void consume(int neednum,String name) {
                //测试是否可消费
                while (curnum < neednum) {
                        try {
                                //当前的生产线程等待
                                wait();
                        } catch (InterruptedException e) {
                                e.printStackTrace();
                        }
                }
                //满足消费条件，则进行消费，这里简单的更改当前库存量
                curnum -= neednum;
                System.out.println(name+"已经消费了" + neednum + "个产品，现仓储量为" + curnum);
                //唤醒在此对象监视器上等待的所有线程
                notifyAll();
        }
}

/**
* 生产者
*/
class Producer extends Thread {
        private int neednum;                //生产产品的数量
        private Godown godown;            //仓库
        private String name;
        Producer(int neednum, Godown godown,String name) {
                this.neednum = neednum;
                this.godown = godown;
                this.name=name;
        }

        public void run() {
                //生产指定数量的产品
                godown.produce(neednum,name);
        }
}

/**
* 消费者
*/
class Consumer extends Thread {
		private String name;
        private int neednum;                //生产产品的数量
        private Godown godown;            //仓库

        Consumer(int neednum, Godown godown,String name) {
                this.neednum = neednum;
                this.godown = godown;
                this.name=name;
        }

        public void run() {
                //消费指定数量的产品
                godown.consume(neednum,name);
        }
}
