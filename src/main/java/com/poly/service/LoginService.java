package com.poly.service;

import com.poly.dao.TaiKhoanDao;
import com.poly.entity.TaiKhoan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	@Autowired
	private TaiKhoanDao taiKhoanDao;

	public TaiKhoan login(String username, String password) {
		TaiKhoan taiKhoan = taiKhoanDao.findById(username).orElse(null);

		if (taiKhoan != null && taiKhoan.getMatKhau().equals(password)) {
			return taiKhoan;
		}
		return null;
	}

	public boolean checkPassword(TaiKhoan user, String currentPassword) {
		return user.getMatKhau().equals(currentPassword);
	}
	public void updatePassword(TaiKhoan user, String newPassword) {
		user.setMatKhau(newPassword);
		taiKhoanDao.save(user);
	}
}
