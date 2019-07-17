package com.hk.one.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.one.dao.IOrderListDao;



@Service
public class OrderListService implements IOrderListService {

	@Autowired
	private IOrderListDao orderListDao;

	@Override
	public boolean addOrderList(String mem_id, String add) {
		// TODO Auto-generated method stub
		return false;
	}
	


}
