package com.linan.phone.service;

import java.util.List;

import com.linan.phone.entity.Comsumer;

public interface UserService {
//校验手机号是否被注册
int checkPhone(String phone);
//校验用户名是否被注册
int checkName(String name);
//注册用户
int register(Comsumer comsumer);
//用户登录
Comsumer login(Comsumer comsumer);

List test();
}
