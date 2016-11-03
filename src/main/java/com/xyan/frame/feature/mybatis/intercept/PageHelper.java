package com.xyan.frame.feature.mybatis.intercept;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Properties;

import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.resultset.ResultSetHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.log4j.Logger;


/**
 * @description mybatis分页拦截器，目前只实现了oracle和MySQL的
 * @author wangming
 * @date 2016年2月15日 下午2:51:13
 */
@Intercepts({@Signature(type = StatementHandler.class, method = "prepare", args = {Connection.class}),
@Signature(type = ResultSetHandler.class, method = "handleResultSets", args = {Statement.class})})
@SuppressWarnings("rawtypes")
public class PageHelper implements Interceptor {
    private static final Logger logger = Logger.getLogger(PageHelper.class);
    
    //数据库类型，从配置文件中获取
    private String databaseType;
    
	public String getDatabaseType() {
		return databaseType;
	}

	public void setDatabaseType(String databaseType) {
		this.databaseType = databaseType;
	}

	private static final ThreadLocal<Page> localPage = new ThreadLocal<Page>();

    /**
     * 开始分页
     * @param pageNum
     * @param pageSize
     */
    public static void startPage(int pageNum, int pageSize) {
        localPage.set(new Page(pageNum, pageSize));
    }

    /**
     * 结束分页并返回结果，该方法必须被调用，否则localPage会一直保存下去，直到下一次startPage
     * @return
     */
    public static Page endPage() {
        Page page = localPage.get();
        localPage.remove();
        return page;
    }

    @SuppressWarnings("unchecked")
	@Override
    public Object intercept(Invocation invocation) throws Throwable {
        if (localPage.get() == null) {
            return invocation.proceed();
        }
        if (invocation.getTarget() instanceof StatementHandler) {
            StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
            MetaObject metaStatementHandler = SystemMetaObject.forObject(statementHandler);
            // 分离代理对象链(由于目标类可能被多个拦截器拦截，从而形成多次代理，通过下面的两次循环
            // 可以分离出最原始的的目标类)
            while (metaStatementHandler.hasGetter("h")) {
                Object object = metaStatementHandler.getValue("h");
                metaStatementHandler = SystemMetaObject.forObject(object);
            }
            // 分离最后一个代理对象的目标类
            while (metaStatementHandler.hasGetter("target")) {
                Object object = metaStatementHandler.getValue("target");
                metaStatementHandler = SystemMetaObject.forObject(object);
            }
            MappedStatement mappedStatement = (MappedStatement) metaStatementHandler.getValue("delegate.mappedStatement");
            //分页信息if (localPage.get() != null) {
            Page page = localPage.get();
            if(page==null){
            	 return invocation.proceed();
            }
            BoundSql boundSql = (BoundSql) metaStatementHandler.getValue("delegate.boundSql");
            // 分页参数作为参数对象parameterObject的一个属性
            String sql = boundSql.getSql();
            // 重写sql
            String pageSql = buildPageSql(sql, page);
            //重写分页sql
            metaStatementHandler.setValue("delegate.boundSql.sql", pageSql);
            Connection connection = (Connection) invocation.getArgs()[0];
            // 重设分页参数里的总页数等
            setPageParameter(sql, connection, mappedStatement, boundSql, page);
            // 将执行权交给下一个拦截器
            return invocation.proceed();
        } else if (invocation.getTarget() instanceof ResultSetHandler) {
            Object result = invocation.proceed();
            Page page = localPage.get();
            page.setResult((List) result);
            return result;
        }
        return null;
    }

    /**
     * 只拦截这两种类型的
     * <br>StatementHandler
     * <br>ResultSetHandler
     * @param target
     * @return
     */
    @Override
    public Object plugin(Object target) {
        if (target instanceof StatementHandler || target instanceof ResultSetHandler) {
            return Plugin.wrap(target, this);
        } else {
            return target;
        }
    }

    @Override
    public void setProperties(Properties properties) {

    }

    /**
     * 修改原SQL为分页SQL
     * @param sql 原始sql
     * @param page 分页信息
     * @return
     */
    private String buildPageSql(String sql, Page page) {
        StringBuilder pageSql = new StringBuilder(200);
        pageSql.append(sql);
        if ("mysql".equalsIgnoreCase(databaseType)) {  
            return getMysqlPageSql(page, pageSql);  
        } else if ("oracle".equalsIgnoreCase(databaseType)) {  
            return getOraclePageSql(page, pageSql);  
        }
		return pageSql.toString();
    }
    

	/** 
     * 获取Mysql数据库的分页查询语句 
     * @param page   分页对象 
     * @param pageSql  包含原sql语句的StringBuffer对象 
     * @return Mysql数据库分页语句 
     */  
    private String getMysqlPageSql(Page page, StringBuilder pageSql) {  
    	 // 计算第一条记录的位置，Mysql分页是通过limit进行的，而Mysql的行是从0开始的  
        pageSql.append(" limit ").append(page.getStartRow()).append(" , ").append(page.getPageSize());  
        return pageSql.toString();  
    }  
  
    /** 
     * 获取Oracle数据库的分页查询语句 
     * @param page 分页对象 
     * @param pageSql   包含原sql语句的StringBuffer对象 
     * @return Oracle数据库的分页查询语句 
     */  
    private String getOraclePageSql(Page page, StringBuilder pageSql) {  
        // 计算第一条记录的位置，Oracle分页是通过rownum进行的，而rownum是从1开始的  
        final int offset = (page.getPageNum() - 1) * page.getPageSize() + 1;  
        pageSql.insert(0, " select u.*, rownum r from ( ").append(") u where rownum < ")  
                .append(offset + page.getPageSize());  
        pageSql.insert(0, "select * from ( ").append(" ) where r >= ").append(offset);  
        return pageSql.toString();  
    }  

    /**
     * 获取总记录数
     * @param sql
     * @param connection
     * @param mappedStatement
     * @param boundSql
     * @param page
     */
    private void setPageParameter(String sql, Connection connection, MappedStatement mappedStatement,
                                  BoundSql boundSql, Page page) {
        // 记录总记录数
        String countSql = "select count(0) from (" + sql + ") ppp";
        PreparedStatement countStmt = null;
        ResultSet rs = null;
        try {
            countStmt = connection.prepareStatement(countSql);
            BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), countSql,
                    boundSql.getParameterMappings(), boundSql.getParameterObject());
            setParameters(countStmt, mappedStatement, countBS, boundSql.getParameterObject());
            rs = countStmt.executeQuery();
            Integer totalCount = 0;
            if (rs.next()) {
                totalCount = rs.getInt(1);
            }
            page.setTotal(totalCount);
            Integer totalPage = totalCount / page.getPageSize() + ((totalCount % page.getPageSize() == 0) ? 0 : 1);
            page.setPages(totalPage);
        } catch (SQLException e) {
            logger.error("Ignore this exception", e);
        } finally {
        	if(rs!=null){
        		try {
        			rs.close();
        		} catch (SQLException e) {
        			logger.error("Ignore this exception", e);
        		}
        	}
        	if(countStmt!=null){
        		try {
        			countStmt.close();
        		} catch (SQLException e) {
        			logger.error("Ignore this exception", e);
        		}
        	}
        }
    }

    /**
     * 代入参数值
     * @param ps
     * @param mappedStatement
     * @param boundSql
     * @param parameterObject
     * @throws SQLException
     */
    private void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql,
                               Object parameterObject) throws SQLException {
        ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, parameterObject, boundSql);
        parameterHandler.setParameters(ps);
    }
    
}