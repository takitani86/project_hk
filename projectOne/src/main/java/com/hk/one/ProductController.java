package com.hk.one;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value = "/insertProductForm.do", method = RequestMethod.GET)
	public String insertProductForm(Locale locale, Model model) {
		logger.info("상품추가 페이지이동{}.", locale);
		List<ProductDto> list = ProductService.getAllProductList();
		model.addAttribute("list", list );
		
		return "product/insertProduct";
	}
	
	@RequestMapping(value = "/insertReceiveProduct.do", method = RequestMethod.POST)
	public String insertBoard(Locale locale, Model model,ProductDto dto) {
		logger.info("상품추가{}.", locale);
		boolean isS=ProductService.insertProduct(dto);
		if(isS) {
			return "redirect:productList.do";
		}else {
			model.addAttribute("msg","상품추가실패");
			return "error"; 
		}
	}
	
	@RequestMapping(value = "/muldelProduct.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String mulDel(Locale locale, Model model,String[]seqs) {
		logger.info("여러글삭제 {}.", locale);
		boolean isS=ProductService.mulDelProduct(seqs);
		if(isS) {
			return "redirect:productList.do";
		}else {
			model.addAttribute("msg", "여러상품삭제실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/productUpdate.do", method = RequestMethod.GET)
	public String updateForm(Locale locale, Model model,int seq) {
		logger.info("사품하기폼이동{}.", locale);
		ProductDto dto =ProductService.getProduct(seq);
		model.addAttribute("dto", dto );
		return "product/productUpdate";
	}
	
	@RequestMapping(value = "/updateReceiveProduct.do", method = RequestMethod.POST)
	public String updateboard(Locale locale, Model model, ProductDto dto) {
		logger.info("상품수정하기{}.", locale);
		
		boolean isS=ProductService.updateProduct(dto);
		if(isS) {
			return "redirect:productUpdate.do?seq="+dto.getPro_seq();
		}else {
			model.addAttribute("msg", "글수정하기 실패");
			return "error";
		}
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


