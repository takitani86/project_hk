package com.hk.one;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.hk.one.login.KakaoAccessToken;
import com.hk.one.login.KakaoUserInfo;
import com.hk.one.service.IMemberService;

@Controller
public class HomeController {
	
	@Autowired
	private IMemberService MemberService;
	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;
	
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
	
	@RequestMapping(value = "/secu/to_find_PwForm.do", method = RequestMethod.GET)
	public String to_find_PwForm(Locale locale, Model model) {
		logger.info("비밀번호 찾기 페이지로 이동 {}.", locale);
		return "secu/findPw";
	}
	
	@RequestMapping(value = "/secu/sendPw.do")
	public ModelAndView sendEmailAction (@RequestParam Map<String, Object> paramMap, Locale locale, Model model) throws Exception {
		logger.info("비밀번호 찾기 {}.");
		ModelAndView mav = new ModelAndView();
		String id = (String) paramMap.get("mem_id");
		String name = (String) paramMap.get("mem_name");
		String eMail = (String) paramMap.get("mem_email");
		String pw = MemberService.findPw(paramMap);
		logger.info("이메일 보내기 {}.");
		logger.info("id:" + id + " / 이름: " + name + " / 메일: " + eMail + " / 비밀번호: " + pw);
		if(pw != null) {
			MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
			logger.info("메일을 보냈습니다.");
			mimeMessage.setFrom(new InternetAddress("ms_sakana@naver.com"));
			mimeMessage.addRecipients(RecipientType.TO, InternetAddress.parse(eMail));
			mimeMessage.setSubject(id + "님의 비밀번호 변경 안내 메일입니다.");
			mimeMessage.setText("<b>비밀번호는 " + pw +"입니다.</b>", "UTF-8", "html");
			
			javaMailSenderImpl.send(mimeMessage);
			
			model.addAttribute("msg", 0);
			mav = new ModelAndView("secu/findPwResult");
			return mav;
		} else {
			mav.addObject("msg", 1);
			//model.addAttribute("msg", 1);
			mav.setViewName("secu/findPwResult");
			return mav;
		}
	}	
	
	@RequestMapping(value = "/kakaologin", produces = "application/json", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session, HttpServletResponse response) throws IOException {
		logger.info("kakao 로그인 토큰 받아오기 {}.");
		System.out.println("kakao code: " + code);
		JsonNode jsonToken = KakaoAccessToken.getKakaoAccessToken(code);
		JsonNode accessToken = jsonToken.get("access_token");
		System.out.println("access_token : " + accessToken);
		
		logger.info("kakao 사용자 정보 받아오기 {}.");
		// access_token을 통해 사용자 정보 요청
        JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);
 
        // Get id
        String id = userInfo.path("id").asText();
        String name = null;
        String email = null;
 
        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
 
        name = properties.path("nickname").asText();
        email = kakao_account.path("email").asText();
 
        System.out.println("id : " + id);
        System.out.println("name : " + name);
        System.out.println("email : " + email);
		return null;
	}
}
