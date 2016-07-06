package com.xyan.frame.feature.mybatis.intercept;

import java.util.List;

/**
 * @description 分页信息
 * @author wangming
 * @date 2016年2月15日 下午2:54:52
 */
public  class Page<E> {
    private Integer pageNum;//当前页码
    private Integer pageSize;//页大小
    private Integer startRow;//起始行，插件会自动计算
    private Integer endRow;//结束行，插件会自动计算
    private Integer total;//总记录数，插件会自动计算
    private Integer pages;//总页数，插件会自动计算
    private List<E> result;//数据

    public Page() {
    	this.pageNum = 1;
        this.pageSize = 10;
        this.startRow = pageNum > 0 ? (pageNum - 1) * pageSize : 0;
        this.endRow = pageNum * pageSize;
	}
    
    public Page(Integer pageNum, Integer pageSize) {
        this.pageNum = pageNum;
        this.pageSize = pageSize;
        this.startRow = pageNum > 0 ? (pageNum - 1) * pageSize : 0;
        this.endRow = pageNum * pageSize;
    }

    public List<E> getResult() {
        return result;
    }

    public void setResult(List<E> result) {
        this.result = result;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public Integer getEndRow() {
        return endRow;
    }

    public void setEndRow(Integer endRow) {
        this.endRow = endRow;
    }

    public Integer getPageNum() {
        return pageNum;
    }

    public void setPageNum(Integer pageNum) {
        this.pageNum = pageNum;
        if(this.pageNum!=null&&this.pageSize!=null){
        	this.startRow = pageNum > 0 ? (pageNum - 1) * pageSize : 0;
        	this.endRow = pageNum * pageSize;
        }
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
        if(this.pageNum!=null&&this.pageSize!=null){
        	this.startRow = pageNum > 0 ? (pageNum - 1) * pageSize : 0;
        	this.endRow = pageNum * pageSize;
        }
    }

    public Integer getStartRow() {
        return startRow;
    }

    public void setStartRow(Integer startRow) {
        this.startRow = startRow;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "Page{" +
                "pageNum=" + pageNum +
                ", pageSize=" + pageSize +
                ", startRow=" + startRow +
                ", endRow=" + endRow +
                ", total=" + total +
                ", pages=" + pages +
                '}';
    }
}
