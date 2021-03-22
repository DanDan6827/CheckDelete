package com.ict.db;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<VO> getList(){
		List<VO>list = new ArrayList<VO>();
		list = sqlSessionTemplate.selectList("list");
		return list;
	}
	
	public int getDelete(String id) {
		int result = 0;
		result= sqlSessionTemplate.delete("delete",id );
		return result;
	}
	
}
