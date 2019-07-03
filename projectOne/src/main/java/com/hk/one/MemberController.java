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

import com.hk.one.dto.MemberDto;
import com.hk.one.service.IMemberService;

@Controller
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
}
