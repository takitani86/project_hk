package com.hk.one;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hk.one.dto.MemberDto;
import com.hk.one.service.IMemberService;

@Controller
@RequestMapping(value = "member/*")
public class MemberController {
	
	@Autowired
	private IMemberService MemberService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/memberList.do", method = RequestMethod.GET)
	public String memberList(Locale locale, Model model) {
		logger.info("멤버 게시판 호출 {}.", locale);
		List<MemberDto> list = MemberService.getAllMember();
		model.addAttribute("list", list);		
		
		return "member/memberList";
	}
	
	@RequestMapping(value = "/memberDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String memberDetail(Locale locale, Model model, String mem_id) {
		logger.info("멤버 상세정보 호출 {}.", locale);
		MemberDto member = MemberService.getMember(mem_id);
		model.addAttribute("member", member);		
		
		return "member/memberDetail";
	}
	
	@RequestMapping(value = "/joinMemberForm.do", method = RequestMethod.GET)
	public String joinMemberForm(Locale locale, Model model) {
		logger.info("회원가입폼으로 이동 {}.", locale);
		List<MemberDto> list = MemberService.getAllMember();
		model.addAttribute("list", list);
		
		return "member/joinMember";
	}
	
	@RequestMapping(value = "/joinMember.do", method = RequestMethod.POST)
	public String joinMember(Locale locale, Model model, MemberDto memberDto) {
		logger.info("회원 가입 {}.", locale);
		boolean isS = MemberService.joinMember(memberDto);
		if(isS) {
			return "redirect:memberList.do";
		} else {
			model.addAttribute("failJoin", "회원 가입 실패");
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/checkIdMember.do", method = RequestMethod.POST)
	public String checkIdMember(HttpServletRequest req) throws Exception {
		logger.info("아이디 중복 체크 {}.");

		String mem_id = req.getParameter("mem_id");
		MemberDto mem = MemberService.checkIdMember(mem_id);
		int result = 0;
		if(mem != null) result = 1;
		return result + "";		
	}
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public ModelAndView loginView(ModelAndView mav) {
		logger.info("로그인 뷰 호출 {}");
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping(value = "/member_infoForm.do", method = RequestMethod.GET)
	public String updateMemberForm(Locale locale, Model model, String mem_id) {
		logger.info("회원 정보 페이지로 이동 {}.", locale);
		MemberDto member = MemberService.getMember(mem_id);
		model.addAttribute("member", member);
		
		return "member/member_info";
	}
	
	@RequestMapping(value = "/member_info.do", method = RequestMethod.POST)
	public String updateMember(Locale locale, Model model, MemberDto member) {
		logger.info("회원 정보 수정 {}.", locale);
		boolean isS = MemberService.updateMember(member);
		String mem_id = member.getMem_id();
		if(isS) {
			return "redirect:memberDetail.do?mem_id=" + mem_id;
		} else {
			model.addAttribute("failUpdate", "회원 정보 수정 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/deleteMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteMember(Locale locale, Model model, String mem_id) {
		logger.info("회원 탈퇴 {}.", locale);
		boolean isS = MemberService.deleteMember(mem_id);
		if(isS) {
			return "redirect:memberList.do";
		} else {
			model.addAttribute("failDelete", "회원 탈퇴 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/searchMember.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView list(@RequestParam(defaultValue="all") String searchOption,
						@RequestParam(defaultValue="") String keyword) throws Exception {
		logger.info("회원 검색 {}.");
		List<MemberDto> list = MemberService.searchMember(searchOption, keyword);
		int count = MemberService.countArticle(searchOption, keyword);
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		mav.addObject("map", map);
		mav.setViewName("member/searchMember");
		return mav;
	}
	   
/*	@RequestMapping(value = "/find_Pw.do", method = RequestMethod.POST)
	public String findPw(MemberDto memberDto, RedirectAttributes redirectattr, Errors errors) throws Exception {
		logger.info("비밀번호 찾기 {}.");
		new FindPwValidator().validate(memberDto, errors);
		if(errors.hasErrors()) return "Find_Pw";
		try {
			MemberDto member = MemberService.findPw(sqlSession, memberDto);
			redirectattr.addFlashAttribute("resultDto", resultDto);
			return "redirect:sendPw";
		} catch (Exception e) {
			errors.reject("EmailNotExist");
		return "Find_Pw";
		}
	}*/

}
