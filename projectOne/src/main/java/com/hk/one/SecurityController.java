package com.hk.one;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.ProductDto;
import com.hk.one.service.IOrderService;

@Controller
public class SecurityController {

	private static final Logger logger = LoggerFactory.getLogger(SecurityController.class);
	
	@Autowired
	private IOrderService orderService;
	
	@RequestMapping(value="/payment.do", method=RequestMethod.GET)
	public String payment(Model model) {
		logger.info("결제 메소드 호출");
		
		return "payment/payment";
	}
	
	@RequestMapping(value="/menu.do", method=RequestMethod.GET)
	public String menu(Model model, Authentication auth) {
		logger.info("메뉴 메소드 호출");
		
		// 카테고리 정보 조회
		List<CategoryDto> category = orderService.selectMenuCategoryList(auth.getName());
		
		model.addAttribute("category", category);
		
		return "menu/menu";
	}
	
	@RequestMapping("/menuList.do")
	@ResponseBody
	private List<ProductDto> productList(Model model, int seq) throws Exception {
		logger.info("상품리스트 호출");
		
		return orderService.selectMenuProductList(seq);
	}
}
