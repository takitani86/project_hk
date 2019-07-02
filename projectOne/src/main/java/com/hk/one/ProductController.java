package com.hk.one;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.one.dto.ProductDto;
import com.hk.one.service.IProductService;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService ProductService;
	
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value = "/productList.do", method = RequestMethod.GET)
	public String productList(Locale locale, Model model) {
		logger.info("상품페이지 호출{}.", locale);
		List<ProductDto> list = ProductService.getAllProductList();
		model.addAttribute("list", list );
		
		return "product/productList";
	}
}
