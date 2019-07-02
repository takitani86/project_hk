package com.hk.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.one.dao.IProductDao;
import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

@Service
public class ProductService implements IProductService {
	
	@Autowired
	private IProductDao productDao;

	@Override
	public List<ProductDto> getAllProductList() {
		return productDao.getAllProductList();
	}

	@Override
	public ProductDto getProduct(ProductDto dto) {
		
		return productDao.getProduct(dto);
	}

	@Override
	public boolean insertProduct(ProductDto dto) {
		
		return productDao.insertProduct(dto);
	}

	@Override
	public boolean insertCategory(CategoryDto dto) {
		return productDao.insertCategory(dto);
	}

	@Override
	public boolean updateProductImg(ProductDto dto) {
		
		return productDao.updateProductImg(dto);
	}

	@Override
	public boolean updateProduct(ProductDto dto) {
		return productDao.updateProduct(dto);
	}

	@Override
	public boolean mulDelProduct(String[] seqs) {
		return productDao.mulDelProduct(seqs);
	}

}
