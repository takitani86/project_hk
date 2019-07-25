package com.hk.one;

import java.util.List;
import java.util.Locale;

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
import org.springframework.web.multipart.MultipartFile;

import com.hk.one.dto.CategoryDto;
import com.hk.one.dto.OrderListDto;
import com.hk.one.dto.ProductDto;
import com.hk.one.service.IOrderListService;
import com.hk.one.service.IOrderService;
import com.hk.one.service.IProductService;

@Controller
public class ProductController {
	
	@Autowired
	private IProductService productService;
	@Autowired
	private IOrderListService orderListService;
	@Autowired
	private IOrderService orderService;
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@RequestMapping(value = "/productList.do", method = RequestMethod.GET)
	public String productList(Locale locale, Model model,HttpServletRequest request, Authentication auth) {
		String sort = (String) request.getParameter("sort");
		System.out.println(sort);
		logger.info("상품페이지 호출{}.", locale);
		HttpSession session = request.getSession(); // 세션생성
		int getPcount=productService.countProductPage(); // 페이지 갯수
		String countProductPage=request.getParameter("countProductPage"); // view에서 요청페이지 파라미터를 받음
		session.setAttribute("countProductPageSession", countProductPage); //현재페이지 세션저장
		List<ProductDto> list = productService.getAllProductList(countProductPage);
		model.addAttribute("sort", sort);
		model.addAttribute("list", list );
		model.addAttribute("getPcount", getPcount);
		boolean isS=productService.sortProduct(sort);
		if(isS) {
			return "product/productList";
		}else {
			model.addAttribute("msg","상품리스트업실패");
			return "error";  
		}
		
	}
	
	
	@RequestMapping(value = "/insertProductForm.do", method = RequestMethod.GET)
	public String insertProductForm(Locale locale, Model model, Authentication auth) {
		logger.info("상품추가 페이지이동{}.", locale);
		//List<ProductDto> list = productService.getAllProductList();
		//model.addAttribute("list", list );
		List<CategoryDto> category = orderService.selectMenuCategoryList(auth.getName());
		model.addAttribute("category", category);
		
		return "product/insertProductForm";
	}
	
	@RequestMapping(value = "/insertReceiveProduct.do", method = RequestMethod.POST)
	public String insertBoard(Locale locale, Model model,ProductDto dto,MultipartFile uploadFile,HttpServletRequest request) {
		logger.info("상품추가{}.", locale);
		HttpSession session = request.getSession(); // 세션을 가져옴
		dto.setPro_image(productService.saveFile(uploadFile));
		boolean isS=productService.insertProduct(dto);
		
		if(isS) {
			return "redirect:productList.do?countProductPage="+session.getAttribute("countProductPageSession")+"&sort=0";
		}else {
			model.addAttribute("msg","상품추가실패");
			return "error"; 
		}
	}
	
	@RequestMapping(value = "/delProduct.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String mulDel(Locale locale, Model model, int seq) {
		logger.info("글삭제 {}.", locale);
		boolean isS=productService.delProduct(seq);
		if(isS) {
			return "redirect:productList.do?countProductPage=1";
		}else {
			model.addAttribute("msg", "여러상품삭제실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/productUpdate.do", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model,int seq, Authentication auth) {
		logger.info("상품수정하기폼이동{}.", locale);
		ProductDto dto =productService.getProduct(seq);
		List<CategoryDto> category = orderService.selectMenuCategoryList(auth.getName());
		model.addAttribute("category", category);
		model.addAttribute("dto", dto );
		return "product/productUpdate";
	}
	
	@RequestMapping(value = "/upProduct.do", method = RequestMethod.GET)
	public String upProduct(Locale locale, Model model, String pro_name) {
		logger.info("상품수정하기폼이동{}.", locale);
		ProductDto dto =productService.upProduct(pro_name);
		model.addAttribute("dto", dto );
		return "product/productUpdate";
	}
	
	@RequestMapping(value = "/updateReceiveProduct.do", method = RequestMethod.POST)
	public String updateboard(Locale locale, Model model, ProductDto dto) {
		logger.info("상품수정하기{}.", locale);
		
		boolean isS=productService.updateProduct(dto);
		if(isS) {
			return "redirect:productUpdate.do?seq="+dto.getPro_seq();
		}else {
			model.addAttribute("msg", "글수정하기 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/updateListProduct.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String updateListProduct(Locale locale, Model model, ProductDto dto) {
		logger.info("상품 상세 보기{}.", locale);
		
		boolean isS=productService.updateProduct(dto);
		if(isS) {
			return "redirect:productUpdate.do?pro_name="+dto.getPro_name();
		}else {
			model.addAttribute("msg", "제품 확인 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/orderlist.do", method = RequestMethod.GET)
	public String orderList(Model model, Authentication auth) {
		logger.info("주문내역으로 이동");
		
		List<OrderListDto> list = orderListService.getOrderList(auth.getName()); 
		model.addAttribute("orderList", list);
		return "member/orderlist";
	}
	
//	@RequestMapping(value = "/productImgInsert.do")
//	public String fileInsert(Locale locale, Model model,HttpServletRequest request) {
//		logger.info("파일첨부하기!", locale);
//		
//		//service에서 파일업로드 처리를 하기 위해 요청정보를 전달한다 (Request 객체)
//		boolean isS = fileService.insertFileInfo(request);
//		if(isS) {
//			return "fileupload";
//		}else {
//			logger.info("파일 업로드 실패");
//			return "error";
//		}
//	
//	}
}


