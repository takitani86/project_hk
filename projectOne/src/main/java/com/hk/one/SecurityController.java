package com.hk.one;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SecurityController {

	private static final Logger logger = LoggerFactory.getLogger(SecurityController.class);
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="passwordEncoder.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String passwordEncdoer(@RequestParam(value="targetStr", required=false, defaultValue="") 
	String targetStr, Model model) {
		logger.info("암호화 메소드 호출");
		if(StringUtils.hasText(targetStr)) {
			// 암호화 작업
			String bCryptString = passwordEncoder.encode(targetStr);
			model.addAttribute("targetStr", targetStr);
			model.addAttribute("bCryptString", bCryptString);
		}
		
		return "secu/showBCryptString";
	}
	
	@RequestMapping(value="/payment.do", method= RequestMethod.GET)
	public String payment(Model model) {
		logger.info("결제 메소드 호출");
		
		return "payment/payment";
	}
}
