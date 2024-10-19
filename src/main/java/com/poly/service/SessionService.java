package com.poly.service;

import org.springframework.stereotype.Service;

import com.poly.entity.Cart;
import com.poly.entity.TaiKhoan;

import jakarta.servlet.http.HttpSession;

@Service
public class SessionService {
	private static final String USER_SESSION_KEY = "user";
	private static final String CART_SESSION_KEY = "cart";

	public boolean isLogin(HttpSession session) {
		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute(USER_SESSION_KEY);
		return taiKhoan != null; // Nếu user khác null thì đã đăng nhập
	}

	public boolean isAdmin(HttpSession session) {
		TaiKhoan taiKhoan = (TaiKhoan) session.getAttribute(USER_SESSION_KEY);
		return taiKhoan != null && Boolean.TRUE.equals(taiKhoan.getVaiTro()); // Kiểm tra vai trò admin
	}

	public TaiKhoan getUser(HttpSession session) {
		return (TaiKhoan) session.getAttribute(USER_SESSION_KEY);
	}

	public void login(HttpSession session, TaiKhoan taiKhoan) {
		session.setAttribute(USER_SESSION_KEY, taiKhoan);
		session.setAttribute(CART_SESSION_KEY, new Cart());
	}

	public Cart getCart(HttpSession session) {
		Cart cart = (Cart) session.getAttribute(CART_SESSION_KEY);
		if (cart == null) {
			cart = new Cart(); // Tạo giỏ hàng mới nếu chưa có
			session.setAttribute(CART_SESSION_KEY, cart);
		}
		return cart;
	}

	public void logout(HttpSession session) {
		session.removeAttribute(USER_SESSION_KEY);
		session.removeAttribute(CART_SESSION_KEY); // Xóa giỏ hàng khi đăng xuất
	}
}
