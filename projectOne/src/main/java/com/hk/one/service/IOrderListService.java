package com.hk.one.service;

import java.util.List;

import com.hk.one.dto.OrderListDto;

public interface IOrderListService {

	public boolean addOrderList(OrderListDto dto);

	public List<OrderListDto> getOrderList(String name);
}
