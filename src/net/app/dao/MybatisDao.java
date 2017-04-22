package net.app.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.test.context.jdbc.Sql;

import net.app.po.Page;

@Repository
public class MybatisDao {
     
	@Autowired
	SqlSessionFactory sessionFactory;
	
	//保存
	public int save(String key,Object object){
		int i=0;
		SqlSession session=sessionFactory.openSession();
		try {
			i=session.insert(key,object);
			session.commit();
		} catch (Exception e) {
            session.rollback();
            e.printStackTrace();
		}finally {
			session.close();
		}
		    return i;
	}
	//批量保存
	public void saveList(String key,List list){
		SqlSession session =sessionFactory.openSession();
		try {
			for (int i = 0; i < list.size(); i++) {
				 session.insert(key,list.get(i));
			}
			session.commit();
		} catch (Exception e) {
            session.rollback();
            e.printStackTrace();
		}finally{
			session.close();
		}
	}
	//修改
	public int update(String key,Object object){
		int i=0;
		SqlSession session=sessionFactory.openSession();
		try {
			i=session.update(key,object);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return i;
	}
	//删除
	public int  delete(String key,Serializable id) {
		int i=0;
		SqlSession session=sessionFactory.openSession();
		try {
			i=session.delete(key,id);
			session.commit();
		} catch (Exception e) {
            session.rollback();
            e.printStackTrace();
		}finally {
			session.close();
		}
		return i;
	}
	//删除
	public void  delete(String key,Object object) {
		SqlSession session=sessionFactory.openSession();
		try {
			session.delete(key,object);
			session.commit();
		} catch (Exception e) {
            session.rollback();
            e.printStackTrace();
		}finally {
			session.close();
		}
	}
	//查询
	public <T> T get(String key,Object params){
		SqlSession session=sessionFactory.openSession();
		try {
			T t=session.selectOne(key,params);
			session.close();
			return t;
		} catch (Exception e) {
            e.printStackTrace();
            session.close();
            return null;
		}
	}
	//查询集合
	public <T> List<T> getList(String key){
		SqlSession session=sessionFactory.openSession();
		try {
			List<T> t=session.selectList(key);
		    session.close();
		    return t;
		} catch (Exception e) {
		     e.printStackTrace();
	            session.close();
	            return null;
		}
		
	}
	//查询集合
	public <T> List<T> getList(String key,Object params){
		SqlSession session=sessionFactory.openSession();
		try {
			List<T> t=session.selectList(key,params);
		    session.close();
		    return t;
		} catch (Exception e) {
		     e.printStackTrace();
	            session.close();
	            return null;
		}
		
	}
	//分页查询
	public Page getListByPage(String key,Map<String,Object> params,int limit, int offset){
		Page page=new Page();
		page.setLimit(limit);
		page.setOffset(offset);
		params.put("PAGE", page);
		List<Object> result=null;
		SqlSession session=sessionFactory.openSession();
		try {
			result=session.selectList(key,params);
			session.close();
		} catch (Exception e) {
            e.printStackTrace();
            session.close();
		}
		page.setRows(result);
		return page;
	}
	//分页查询
	 public Page getListByPage(String key, Map<String, Object> params, Page page) {
	        params.put("_PAGE", page);

	        if (null != page.getSort() && !"".equals(page.getSort())) {
	            params.put("_ORDER_STR", page.getSort() + " " + page.getOrder());
	        }

	        List<Object> result = null;
	        SqlSession session = sessionFactory.openSession();
	        try {
	        	//key,相当于映射文件中的id
	        	//params,指定和映射文件中所匹配的parameterType类型的参数
	        	//result,是与映射文件中所匹配的resultType类型的对象
	            result = session.selectList(key, params);
	            session.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	            session.close();
	        }
	        page.setRows(result);
	        return page;
	    }
}
