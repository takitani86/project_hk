package com.hk.one.service;

import java.util.List;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

public interface IOrderService {

	// 카테고리 불러오기
	public List<CategoryDto> selectMenuCategoryList(String username);
	// 카테고리 안에 담긴 상품리스트 불러오기
	public List<ProductDto> selectMenuProductList(int seq);
}
