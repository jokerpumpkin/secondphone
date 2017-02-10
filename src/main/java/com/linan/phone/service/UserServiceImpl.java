package com.linan.phone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.linan.phone.dao.UserDao;
import com.linan.phone.entity.Comsumer;

@Service
public class UserServiceImpl implements UserService{
@Autowired
UserDao userDao;

@Override
public int checkPhone(String phone) {
	return userDao.doCheckPhone(phone);
}

@Override
public int checkName(String name) {
	return userDao.doCheckName(name);
}

@Override
public int register(Comsumer comsumer) {
	return userDao.doRegister(comsumer);
}

@Override
public Comsumer login(Comsumer comsumer) {
	return userDao.doLogin(comsumer);
}

@Override
public List test() {
	return userDao.test();
}
}
