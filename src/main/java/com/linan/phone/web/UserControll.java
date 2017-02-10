package com.linan.phone.web;

import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.linan.phone.entity.Comsumer;
import com.linan.phone.service.UserService;

@Controller
@RequestMapping("/user")
public class UserControll {
@Autowired
UserService userService;
/**
 * 用户注册
 * */
@RequestMapping(value="/register")
public void register(HttpServletRequest request,Comsumer comsumer,Model model,Writer writer){
	try{
		//检查手机号是否已被注册
		if(userService.checkPhone(comsumer.getPhone())>0){
			writer.write("-1");
		}
		//检查用户名是否已被注册
		else if(userService.checkName(comsumer.getName())>0){
			writer.write("-2");
		}
		//注册用户
		else{
			int id=userService.register(comsumer);
			writer.write(id);
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}
/**
 * 用户登录
 * */
@RequestMapping(value="/login")
public void login(HttpServletRequest request,Comsumer comsumer,String vcode,Model model,Writer writer){
	try{
		HttpSession session=request.getSession();
		//校验验证码
		if(!vcode.equals(session.getAttribute("rand"))){
			writer.write("-1");//-1:验证码错误
		}else{//登录
			Comsumer user=userService.login(comsumer);
			if(user!=null&&user.getStatusId()==1){
				session.setAttribute("user", user);
				writer.write("1");//1:登录成功（用户为已保存状态）
			}
			else if(user!=null&&user.getStatusId()==2){
				writer.write("2");//2:登录失败（用户为已冻结状态）
			}
			else{
				writer.write("-2");//-2:用户名或密码错误
			}
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
}

@RequestMapping(value="/test")
public void test(HttpServletRequest request,Writer writer,@RequestParam HashMap map){
	System.out.println(map.get("id"));
	List list=userService.test();
	Gson gson=new Gson();
	try {
		writer.write(gson.toJson(list));
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
