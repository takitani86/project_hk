package com.hk.one.dao;

import java.util.List;

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
}
