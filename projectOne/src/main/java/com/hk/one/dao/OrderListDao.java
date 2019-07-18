package com.hk.one.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.OrderListDto;
import com.hk.one.dto.ProductDto;

@Repository
public class OrderListDao implements IOrderListDao {
	
	private String namespace="Product.";

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public boolean addOrderList(OrderListDto dto) {
		 int count=sqlSession.insert(namespace+"insertOrderList",dto);
		 return count>0?true:false;
	}


	}

