package com.hk.one.dao;

import java.util.List;

import com.hk.one.dto.OrderListDto;

public interface IOrderListDao {

	public boolean addOrderList(OrderListDto dto);

	public List<OrderListDto> getOrderList(String name);

}
