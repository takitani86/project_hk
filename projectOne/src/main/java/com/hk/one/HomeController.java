package com.hk.one;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.hk.one.dto.MemberDto;
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
	
	@RequestMapping(value = "/secu/joinMemberForm.do", method = RequestMethod.GET)
	public String joinMemberForm(Locale locale, Model model) {
		logger.info("회원가입폼으로 이동 {}.", locale);
		List<MemberDto> list = MemberService.getAllMember();
		model.addAttribute("list", list);
		
		return "secu/joinMember";
	}
	
	@RequestMapping(value = "/secu/joinMember.do", method = RequestMethod.POST)
	public String joinMember(Locale locale, Model model, MemberDto memberDto, @RequestParam("roadAddress") String sample4_roadAddress, @RequestParam("detailAddress") String sample4_detailAddress) {
		ModelAndView mav = new ModelAndView();
		logger.info("회원 가입 {}.", locale);
		String roadAddress = sample4_roadAddress;
		String detailAddress = sample4_detailAddress;
		String mem_address = roadAddress + " " + detailAddress;
		System.out.println("주소: " + mem_address);
		
		boolean isS = MemberService.joinMember(memberDto);
		if(isS) {
			model.addAttribute("mem_address", mem_address);
			mav = new ModelAndView("member/memberList"); //쉬벌 값 넣어서 전달하는거 나중에 하자ㅡㅡ
			return "member/memberList";
		} else {
			model.addAttribute("failJoin", "회원 가입 실패");
			return "error";
		}
	}
	
	@RequestMapping(value = "/secu/addressForm.do", method = RequestMethod.GET)
	public String addressForm(Locale locale, Model model) {
		logger.info("도로명 주소 입력 {}.", locale);
		
		return "secu/addressForm";
	}

	
	@ResponseBody
	@RequestMapping(value = "/secu/checkIdMember.do", method = RequestMethod.POST)
	public String checkIdMember(HttpServletRequest req) throws Exception {
		logger.info("아이디 중복 체크 {}.");

		String mem_id = req.getParameter("mem_id");
		MemberDto mem = MemberService.checkIdMember(mem_id);
		int result = 0;
		if(mem != null) result = 1;
		return result + "";		
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
	
	@RequestMapping(value = "/kakaoLogin.do", produces = "application/json", method = RequestMethod.GET)
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
        String mem_id = userInfo.path("id").asText();
        String mem_name = null;
        String mem_email = null;
        String mem_image = null;
        String mem_regDate = null;
 
        // 유저정보 카카오에서 가져오기 Get properties
        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");
 
        mem_name = properties.path("nickname").asText();
        mem_email = kakao_account.path("email").asText();
        mem_image = properties.path("profile_image").asText();
        mem_regDate = properties.path("created").asText();
 
        System.out.println("id: " + mem_id);
        System.out.println("name: " + mem_name);
        System.out.println("email: " + mem_email);
        System.out.println("image: " + mem_image);
        System.out.println("regDate: " + mem_regDate);
		return null;
	}
}
