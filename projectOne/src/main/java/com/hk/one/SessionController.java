package com.hk.one;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SessionController {
	
  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String home() {
      return "statics/login";
  }
}