package com.hk.one.service;

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


}
