package com.hk.one;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

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
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
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
import com.hk.one.dto.SessionVO;
import com.hk.one.login.KakaoAccessToken;
import com.hk.one.login.KakaoUserInfo;
import com.hk.one.login.Kakao_restApi;
import com.hk.one.security.CustomUserDetails;
import com.hk.one.security.CustomUserDetailsService;
import com.hk.one.service.IMemberService;

@Controller
public class HomeController {

	@Autowired
	private IMemberService MemberService;
	@Autowired
	private JavaMailSenderImpl javaMailSenderImpl;
	@Autowired
	private CustomUserDetailsService userService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = { "/", "/home.do" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest req, Authentication auth) {
		logger.info("인덱스 {}.", locale);
		session = req.getSession();
		session.setAttribute("userid", auth.getName());
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
	public String joinMember(Locale locale, Model model, MemberDto memberDto,
			@RequestParam("roadAddress") String sample4_roadAddress,
			@RequestParam("detailAddress") String sample4_detailAddress) {
		logger.info("회원 가입 {}.", locale);
		String roadAddress = sample4_roadAddress;
		String detailAddress = sample4_detailAddress;
		String mem_address = roadAddress + " " + detailAddress;
		memberDto.setMem_address(mem_address);
		System.out.println("주소: " + mem_address);

		boolean isS = MemberService.joinMember(memberDto);
		if (isS) {
			return "secu/loginPage";
		} else {
			model.addAttribute("failJoin", "회원 가입 실패");
			return "error";
		}
	}

	@RequestMapping(value = "/secu/joinKaMember.do", method = RequestMethod.POST)
	public String joinKaMember(Locale locale, Model model, MemberDto memberDto,
			@RequestParam("roadAddress") String sample4_roadAddress,
			@RequestParam("detailAddress") String sample4_detailAddress) {
		ModelAndView mav = new ModelAndView();
		logger.info("회원 가입 {}.", locale);
		String roadAddress = sample4_roadAddress;
		String detailAddress = sample4_detailAddress;
		String mem_address = roadAddress + " " + detailAddress;
		System.out.println("주소: " + mem_address);

		boolean isS = MemberService.joinMember(memberDto);
		if (isS) {
			Map<String, String> addMap = new HashMap<>();
			addMap.put("mem_address", mem_address);
			model.addAttribute("addMap", addMap);
			// mav = new ModelAndView("member/memberList"); //값 넣어서 전달하는거
			return "redirect:kakaoLogin.do";
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
		if (mem != null)
			result = 1;
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

	@RequestMapping(value = "/deleteMember.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteMember(Locale locale, Model model, String mem_id) {
		logger.info("회원 탈퇴 {}.", locale);
		boolean isS = MemberService.deleteMember(mem_id);
		if (isS) {
			return "redirect:memberList.do";
		} else {
			model.addAttribute("failDelete", "회원 탈퇴 실패");
			return "error";
		}
	}

	@RequestMapping(value = "/secu/sendPw.do")
	public ModelAndView sendEmailAction(@RequestParam Map<String, Object> paramMap, Locale locale, Model model)
			throws Exception {
		logger.info("비밀번호 찾기 {}.");
		ModelAndView mav = new ModelAndView();
		String id = (String) paramMap.get("mem_id");
		String name = (String) paramMap.get("mem_name");
		String eMail = (String) paramMap.get("mem_email");
		String pw = MemberService.findPw(paramMap);
		logger.info("이메일 보내기 {}.");
		logger.info("id:" + id + " / 이름: " + name + " / 메일: " + eMail + " / 비밀번호: " + pw);
		if (pw != null) {
			MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
			logger.info("메일을 보냈습니다.");
			mimeMessage.setFrom(new InternetAddress("ms_sakana@naver.com"));
			mimeMessage.addRecipients(RecipientType.TO, InternetAddress.parse(eMail));
			mimeMessage.setSubject(id + "님의 비밀번호 변경 안내 메일입니다.");
			mimeMessage.setText("<b>비밀번호는 " + pw + "입니다.</b>", "UTF-8", "html");

			javaMailSenderImpl.send(mimeMessage);

			model.addAttribute("msg", 0);
			mav = new ModelAndView("secu/findPwResult");
			return mav;
		} else {
			mav.addObject("msg", 1);
			// model.addAttribute("msg", 1);
			mav.setViewName("secu/findPwResult");
			return mav;
		}
	}

	// 카카오 로그인
	@RequestMapping(value = "/secu/kakaoLogin.do", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(HttpServletRequest request, HttpServletResponse response, Model model, MemberDto dto)
			throws IOException {

		logger.info("kakao 사용자 정보 받아오기 {}.");

		String mem_id = dto.getMem_id();
		String mem_name = dto.getMem_name();
		String mem_email = dto.getMem_email();
		System.out.println("카카오아이디: " + mem_id);

		try {
			MemberDto mem = MemberService.checkIdMember(mem_id);
			if (mem == null) { // 해당 아이디 없음. 회원가입 화면으로 이동
				Map<String, String> map = new HashMap<>();
				map.put("mem_id", mem_id);
				map.put("mem_name", mem_name);
				map.put("mem_email", mem_email);
				model.addAttribute("map", map);

				List<MemberDto> list = MemberService.getAllMember();
				model.addAttribute("list", list);

				return "secu/joinKakaoMember";
			} else { // 해당 아이디 있음. 로그인 후 메인화면으로 이동
				CustomUserDetails user = (CustomUserDetails) userService.loadUserByUsername(mem_id);
				Authentication auth = new UsernamePasswordAuthenticationToken(mem_id, null, user.getAuthorities());
				SecurityContext sc = SecurityContextHolder.getContext();
				sc.setAuthentication(auth);
				HttpSession session = request.getSession(true);
				session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);
				model.addAttribute("kakao", user);
				return "home";
			}
		} catch (UsernameNotFoundException e) {
			e.printStackTrace();
			return "home";
		} catch (Exception e) {
			e.printStackTrace();
			return "home";
		}
	}

	@ResponseBody // html로 응답하기
	@RequestMapping(value = "/secu/emailRegist.do")
	public ModelAndView sendEmailRegist(@RequestParam("mem_id") String mem_id,
			@RequestParam("mem_email") String mem_email, Locale locale, Model model) throws Exception {
		logger.info("이메일 인증하기 {}.");
		ModelAndView mav = new ModelAndView();
		String id = mem_id;
		String eMail = mem_email;

		Random random = new Random();
		StringBuffer buf = new StringBuffer();

		for (int i = 0; i < 6; i++) {
			if (random.nextBoolean()) {
				buf.append((char) (int) (Math.random() * 26 + 97));
			} else {
				buf.append(random.nextInt(10));
			}
		}

		String RegistNum = buf.toString();

		logger.info("이메일로 인증번호 보내기 {}.");
		logger.info("id:" + id + " / 메일: " + eMail + " / 인증번호: " + RegistNum);
		if ((id != null) && (eMail != null) && (RegistNum != null)) {
			MimeMessage mimeMessage = javaMailSenderImpl.createMimeMessage();
			logger.info("메일을 보냈습니다.");
			mimeMessage.setFrom(new InternetAddress("ms_sakana@naver.com"));
			mimeMessage.addRecipients(RecipientType.TO, InternetAddress.parse(eMail));
			mimeMessage.setSubject(id + "님의 가입 인증번호 안내 메일입니다.");
			mimeMessage.setText("<b>인증번호는 " + RegistNum + "입니다.</b><br /> 가입 폼의 인증번호 란에 입력해 주세요.", "UTF-8", "html");

			javaMailSenderImpl.send(mimeMessage);

			Map map;
			// 모델에 담는 건 자바가 받을 수 있는 것
			// 맵에 담아서 보내야 함 <- 자바스크립트가 받으려면
			// 세션에 담기
			mav.addObject("rst", 0);
			mav.addObject("RegistN", RegistNum);
			return mav; // 리턴맵
		} else {
			mav.addObject("rst", 1);
			return mav;
		}
	}

	static HttpSession session;

	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String chat(SessionVO vo, HttpServletRequest req, Authentication auth) {
		session = req.getSession();
		session.setAttribute("userid", auth.getName());

		return "chat/chat";
	}

	@RequestMapping(value = "/chatAdmin.do", method = RequestMethod.GET)
	public String chatAdmin(SessionVO vo, HttpServletRequest req, Authentication auth) {
		session = req.getSession();
		session.setAttribute("userid", auth.getName());

		return "chat/chatAdmin";
	}

	@RequestMapping(value = "/accessDenied.do", method = RequestMethod.GET)
	public String acceessDenied(Model model) {
		return "secu/accessdenied";
	}

	@RequestMapping(value = "/pushalert.do", method = RequestMethod.GET)
	@ResponseBody
	public int pushalert() {

		List<MemberDto> dto = MemberService.getAllMember();
		int count = 0;
		for (int i = 0; i < dto.size(); i++) {
			if (dto.get(i).getMem_isApprove() == 0) {
				count++;
			}
		}
		return count;
	}
}
