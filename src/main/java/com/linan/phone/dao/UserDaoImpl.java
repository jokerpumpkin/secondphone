package com.linan.phone.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.linan.phone.entity.Comsumer;
@Repository
public class UserDaoImpl implements UserDao {
	@Autowired
	private SqlMapClient sqlMapClient;
	
	@Override
	public int doCheckPhone(String phone) {
		try {
			return (Integer) sqlMapClient.queryForObject("user.checkPhone", phone);
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	@Override
	public int doCheckName(String name) {
		try {
			return (Integer) sqlMapClient.queryForObject("user.checkName", name);
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int doRegister(Comsumer comsumer) {
		try {
			return (Integer) sqlMapClient.insert("user.register", comsumer);
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public Comsumer doLogin(Comsumer comsumer) {
		try {
			return (Comsumer) sqlMapClient.queryForObject("user.login", comsumer);
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List test() {
			try {
				return  sqlMapClient.queryForList("user.test");
			} catch (SQLException e) {
				e.printStackTrace();
				return null;
			}
		
	}
	
}
