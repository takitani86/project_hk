package com.hk.one.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

@Repository
public class OrderDao implements IOrderDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CategoryDto> selectMenuCategoryList(String username) {
		return sqlSession.selectList("Category.selectList", username);
	}

	@Override
	public List<ProductDto> selectMenuProductList(int seq) {
		return sqlSession.selectList("Product.selectMenuList", seq);
	}

	@Override
	public boolean addCategory(String mem_id, String add) {
		Map<String, String> map = new HashMap<>();
		map.put("mem_id", mem_id);
		map.put("cat_name", add);
		int success = sqlSession.insert("Category.addCategory", map);
		if (success == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	@Override
	public boolean delCategory(int seq) {
		int success = sqlSession.update("Category.delCategory", seq);
		return  success > 0 ? true:false;
	}
}
