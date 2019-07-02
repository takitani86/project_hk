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
	public class ProductDao implements IProductDao {
		
		private String namespace="Product.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProductDto> getAllProductList() {
		return sqlSession.selectList(namespace+"selectProductList");
	}

	@Override
	public ProductDto getProduct(ProductDto dto) {
		return sqlSession.selectOne(namespace+"selectProductOne",dto);
	}

	@Override
	public boolean insertProduct(ProductDto dto) {
		 int count=sqlSession.insert(namespace+"insertProduct",dto);
		 return count>0?true:false;
	}

	@Override
	public boolean insertCategory(CategoryDto dto) {
		 int count=sqlSession.insert(namespace+"insertCategory",dto);
		 return count>0?true:false;
	}

	@Override
	public boolean updateProductImg(ProductDto dto) {
		 int count=sqlSession.update(namespace+"insertProductImg",dto);
		 return count>0?true:false;
	}

	@Override
	public boolean updateProduct(ProductDto dto) {
		 int count=sqlSession.update(namespace+"updateProduct",dto);
		 return count>0?true:false;
	}


	@Override
	public boolean mulDelProduct(String[] seqs) {
		Map<String,String[]>map=new HashMap<String, String[]>();
		map.put("seqs", seqs);
		int count=sqlSession.update(namespace+"muldel",map);
		return count>0?true:false;
	}

}
