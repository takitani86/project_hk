package com.hk.one;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = {"/", "/home.do"}, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("인덱스 {}.", locale);
		
		return "home";
	}
	
	// 로그인 화면으로 이동
	@RequestMapping(value = "/secu/loginPage.do", method = RequestMethod.GET)
	public String loginForm(Locale locale, Model model) {
		logger.info("로그인화면 {}.", locale);
		
		return "secu/loginPage";
	}
	
}
