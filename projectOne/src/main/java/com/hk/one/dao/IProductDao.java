package com.hk.one.dao;

import java.util.List;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

public interface IProductDao {
	
	public List<ProductDto> getAllProductList(); // 상품리스트 확인
	
	public boolean insertProduct(ProductDto dto); // 상품 추가
	public boolean insertCategory(CategoryDto dto); // 카테고리 추가
	public boolean updateProductImg(ProductDto dto) ; // 상품이미지 등록&변경
	public boolean updateProduct(ProductDto dto) ; // 상품 정보 수정
	public boolean mulDelProduct(String[] seqs) ; // 상품 삭제
}
