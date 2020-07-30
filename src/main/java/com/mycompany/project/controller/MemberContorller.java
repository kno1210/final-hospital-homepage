package com.mycompany.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mycompany.project.model.LoginForm;
import com.mycompany.project.model.Member;
import com.mycompany.project.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberContorller {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(MemberContorller.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/join.do")
	public String join(Member joinForm) 
	{
		LOGGER.info("실행");
		
		Member member = new Member();
		member.setMid(joinForm.getMid());
		member.setMpassword(joinForm.getMpassword());
		member.setMname(joinForm.getMname());
		member.setMtel(joinForm.getMtel());
		member.setMemail(joinForm.getMemail());
		member.setMbirth(joinForm.getMbirth());
		memberService.join(member);
//		LOGGER.info("join id:{}", member.getMid());
		
		return "redirect:/home/main.do";
	}
	
	@RequestMapping("/joinForm.do")
	public String joinForm()
	{
		LOGGER.info("실행");
		
		return "member/joinForm";
	}
	
	@RequestMapping("/checkDup.do")
	public void checkDup(String id, HttpServletResponse response) throws IOException 
	{
		String result = "not dup"; 
		Member member = null;
		member = memberService.getMember(id);
		if(member != null)
		{
			result = "dup";
		}
		
		response.setContentType("application/json; charset=UTF-8");
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		String json = jsonObject.toString();
		PrintWriter pw = response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/login.do")
	public void login(@RequestParam Map<String, Object> loginData, HttpServletResponse response) throws IOException
	{
		LOGGER.info("실행");
//		System.out.println(loginData);
		
		String result = "fail";
		Member member = null;
		member = memberService.getMember(loginData.get("mid").toString());
		if(member != null) { // id로 멤버를 찾았다면
			if(member.getMpassword().equals(loginData.get("mpassword").toString())) {
				result = "success";
			}
			else { // pw가 틀렸다면
				result = "errorMpassword";
			}
		}
		else {
			result = "errorMid";
		}
		LOGGER.info("id:{}", loginData.get("mid").toString());
		LOGGER.info("pw:{}", loginData.get("mpassword"));
		
		
		response.setContentType("application/json; charset=UTF-8"); 
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		String json = jsonObject.toString();
		PrintWriter pw = response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/test.do")
	public void jsonStringifyTest(@RequestParam Map<String, Object> params, HttpServletResponse response) throws IOException {
	    boolean result = true;        
	        
	    response.setContentType("application/json; charset=UTF-8"); 
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		String json = jsonObject.toString();
		PrintWriter pw = response.getWriter();
		pw.write(json);
		pw.flush();
		pw.close();
	}
	
	@RequestMapping("/loginForm.do")
	public String loginForm(LoginForm loginForm)
	{
		LOGGER.info("실행");
		
		return "member/loginForm";
	}
}
