package com.hk.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.one.dao.IOrderDao;
import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

@Service
public class OrderService implements IOrderService {

	@Autowired
	private IOrderDao orderDao;
	
	@Override
	public List<CategoryDto> selectMenuCategoryList(String username) {
		return orderDao.selectMenuCategoryList(username);
	}

	@Override
	public List<ProductDto> selectMenuProductList(int seq) {
		return orderDao.selectMenuProductList(seq);
	}

	@Override
	public boolean addCategory(String mem_id, String add) {
		return orderDao.addCategory(mem_id, add);
	}

}
