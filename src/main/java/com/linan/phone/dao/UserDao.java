package com.linan.phone.dao;

import java.util.List;

import com.linan.phone.entity.Comsumer;



public interface UserDao {
	
	int doRegister(Comsumer comsumer);

	int doCheckPhone(String phone);

	int doCheckName(String name);

	Comsumer doLogin(Comsumer comsumer);
	
	List test();

}
