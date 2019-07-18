package com.hk.one;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.hk.one.service.IProductService;

@Controller
@RequestMapping(value = "/member")
public class MenuController {

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

	@Autowired
	private IOrderService orderService;
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String payment(Model model) {
		logger.info("결제 메소드 호출");

		return "payment/payment";
	}

	@RequestMapping(value = "/menu.do", method = RequestMethod.GET)
	public String menu(Model model, Authentication auth) {
		logger.info("메뉴 메소드 호출");

		// 카테고리 정보 조회
		List<CategoryDto> category = orderService.selectMenuCategoryList(auth.getName());

		model.addAttribute("category", category);

		return "menu/menu";
	}

	@RequestMapping(value = "/menuList.do", method = RequestMethod.GET)
	@ResponseBody
	private List<ProductDto> productList(Model model, int seq) throws Exception {
		logger.info("상품리스트 호출");

		return orderService.selectMenuProductList(seq);
	}

	@RequestMapping(value = "/addCategory.do", method = RequestMethod.GET)
	private String addCategoryForm(Model model, Authentication auth, @RequestParam String add) {
		logger.info("카테고리 등록폼 호출");

		String mem_id = auth.getName();
		boolean success = orderService.addCategory(mem_id, add);
		if (success) {
			return "redirect:/member/menu.do";
		} else {
			return "redirect:/member/menu.do";
		}
	}
	
	@RequestMapping(value = "/menuProductUpdate.do", method = RequestMethod.GET)
	@ResponseBody
	private ProductDto productUpdate(Model model, @RequestParam int seq) {
		logger.info("상품 수정 모달 호출");
		
		ProductDto dto = productService.getProduct(seq);
		
		return dto;
	}
	
	@RequestMapping(value = "/productUpdateSubmit.do", method = RequestMethod.POST)
	private String productUpdateSubmit(Model model, ProductDto dto) {
		logger.info("상품 수정완료 호출");
		
		boolean success = productService.updateProduct(dto);
		if (success) {
			return "redirect:/member/menu.do";
		} else {
			return "redirect:/member/menu.do";
		}
	}
	
	@RequestMapping(value = "/delProduct.do", method = RequestMethod.GET)
	private String delProduct(Model model, @RequestParam int seq) {
		logger.info("상품삭제 호출");
		
		boolean success = productService.delProduct(seq);
		if (success) {
			return "redirect:/member/menu.do";
		} else {
			return "redirect:/member/menu.do";
		}
	}
	
	// 손님용 컨트롤러
	static HttpSession session;
	@RequestMapping(value = "/consumer.do", method = RequestMethod.GET)
	public String consumer(Model model, Authentication auth,HttpServletRequest req) {
		logger.info("손님용 메뉴 메소드 호출");
		session = req.getSession();
		session.setAttribute("userid", auth.getName());
		System.out.println(auth.getName());

		// 카테고리 정보 조회
		List<CategoryDto> category = orderService.selectMenuCategoryList(auth.getName());

		model.addAttribute("category", category);

		return "consumer/menu";
	}
}
