package com.hk.one;

import java.util.ArrayList;
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
import com.hk.one.dto.MemberDto;
import com.hk.one.dto.OrderListDto;
import com.hk.one.dto.ProductDto;
import com.hk.one.service.IMemberService;
import com.hk.one.service.IOrderListService;
import com.hk.one.service.IOrderService;
import com.hk.one.service.IProductService;
import com.hk.one.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MenuController {

	private static final Logger logger = LoggerFactory.getLogger(MenuController.class);

	@Autowired
	private IOrderService orderService;
	@Autowired
	private IProductService productService;
	@Autowired
	private IMemberService memberService;
	@Autowired
	private IOrderListService orderListService;	
	
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
	
	@RequestMapping(value = "/delCategory.do", method = RequestMethod.GET)
	private String delCategory(Model model, @RequestParam int seq) {
		logger.info("카테고리삭제 호출");
		
		boolean success = orderService.delCategory(seq);
		if (success) {
			return "redirect:/member/menu.do";
		} else {
			return "redirect:/member/menu.do";
		}
	}
	
	// 손님용 컨트롤러
	
	@RequestMapping(value = "/consumer/select.do", method = RequestMethod.GET)
	public String consumer(Model model) {
		logger.info("손님용 초기화면 메소드 호출");
		
		List<MemberDto> dto = new ArrayList<>();
		dto = memberService.getEnabledMember();
		model.addAttribute("member", dto);
		
		return "consumer/first";
	}
	
	@RequestMapping(value = "/consumer/menu.do", method = RequestMethod.GET)
	public String consumerMenu(Model model, @RequestParam String mem_id) {
		logger.info("손님용 메뉴 메소드 호출");

		// 카테고리 정보 조회
		List<CategoryDto> category = orderService.selectMenuCategoryList(mem_id);

		model.addAttribute("category", category);
		model.addAttribute("mem_id", mem_id);

		return "consumer/menu";
	}
	
	@RequestMapping(value = "/consumer/menuList.do", method = RequestMethod.GET)
	@ResponseBody
	private List<ProductDto> consumerProductList(Model model, int seq) throws Exception {
		logger.info("상품리스트 호출");

		return orderService.selectMenuProductList(seq);
	}
	
	@ResponseBody
	@RequestMapping(value = "/ordList.do", method = RequestMethod.GET)
	public void ordList(Locale locale, Model model,@RequestParam String user,@RequestParam int seqs) {
		logger.info("결제통신성공{}.", locale);
		System.out.println("통신 유저:"+user);
		System.out.println("통신 seq:"+seqs);
		OrderListDto dto=orderListWrap(user,seqs); 
		boolean isS= orderListService.addOrderList(dto);
	}
	
	public OrderListDto orderListWrap(String user, int seqs){ //담아줌
		System.out.println("orderListWrap 유저:"+user);
		System.out.println("orderListWrap seq:"+seqs);
		ProductDto pro_seq=productService.getProduct(seqs);
		
		OrderListDto orderListDto = new OrderListDto(user,seqs,pro_seq.getPro_price());
		return orderListDto;
	}
	
	//회원 내 정보 보기, 수정
	@RequestMapping(value = "/memberMyDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberDetail(Locale locale, Model model, Authentication auth) {
		logger.info("멤버 상세정보 호출 {}.", locale);
		MemberDto member = memberService.getMember(auth.getName());
		model.addAttribute("member", member);		
		
		return "member/memberMyDetail";
	}
	
	@RequestMapping(value = "/member_MyinfoForm.do", method = RequestMethod.GET)
	public String updateMemberForm(Locale locale, Model model, Authentication auth) {
		logger.info("회원 정보 페이지로 이동 {}.", locale);
		MemberDto member = memberService.getMember(auth.getName());
		model.addAttribute("member", member);
		
		return "member/member_Myinfo";
	}
	
	@RequestMapping(value = "/member_Myinfo.do", method = RequestMethod.POST)
	public String updateMember(Locale locale, Model model, MemberDto member, MultipartFile uploadFile, Authentication auth, HttpServletRequest request) {
		logger.info("회원 정보 수정 {}.", locale);
		HttpSession session = request.getSession(); // 세션을 가져옴
		String realpath = request.getSession().getServletContext().getRealPath("upload");// ddsds/dsff/sdfs/upload
		System.out.println(realpath);
		member.setMem_image("/profile/" + memberService.saveFile(uploadFile));
		boolean isS = memberService.updateMember(member);
		String mem_id = member.getMem_id();
		if(isS) {
			return "redirect:memberMyDetail.do?mem_id=" + mem_id;
		} else {
			model.addAttribute("failUpdate", "회원 정보 수정 실패");
			return "error";
		}
	}
}
