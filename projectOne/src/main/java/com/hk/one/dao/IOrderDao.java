package com.hk.one.dao;

import java.util.List;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

public interface IOrderDao {

	public List<CategoryDto> selectMenuCategoryList(String username);
	public List<ProductDto> selectMenuProductList(int seq);
}
