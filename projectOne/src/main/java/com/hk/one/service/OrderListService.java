package com.hk.one.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.one.dao.IOrderListDao;
import com.hk.one.dto.OrderListDto;



@Service
public class OrderListService implements IOrderListService {

	@Autowired
	private IOrderListDao orderListDao;

	@Override
	public boolean addOrderList(OrderListDto dto) {
		
		return orderListDao.addOrderList(dto);
	}

	@Override
	public List<OrderListDto> getOrderList(String name) {
		return orderListDao.getOrderList(name);
	}


}
