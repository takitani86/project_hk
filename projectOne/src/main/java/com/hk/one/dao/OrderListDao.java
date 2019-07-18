package com.hk.one.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;

@Repository
public class OrderListDao implements IOrderListDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public boolean addOrderList(String mem_id, String add) {
		
		return false;
	}


	}

