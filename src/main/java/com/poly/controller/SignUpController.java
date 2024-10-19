package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.poly.dao.TaiKhoanDao;
import com.poly.entity.TaiKhoan;
import com.poly.service.CartService;

import jakarta.servlet.http.HttpSession;

@Controller
@SessionAttributes({ "username", "email", "verificationCode" })
public class SignUpController {
	@Autowired
	private TaiKhoanDao taiKhoanDao;
	@Autowired
	private CartService cartService;

	@RequestMapping("/signup")
	public String showSignUpFrom(HttpSession session, Model model) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");
		if (user == null) {
			int totalUniqueProducts = cartService.getTotalUniqueProducts(session);
			model.addAttribute("totalUniqueProducts", totalUniqueProducts); // Thêm vào model
			return "signUp";
		} else {
			return "redirect:/accountInfo";
		}
	}

	@PostMapping("/register1")
	public String register(@ModelAttribute TaiKhoan account, Model model, HttpSession session) {

		if (taiKhoanDao.existsById(account.getTenTaiKhoan())) {
			model.addAttribute("errorMessage", "Tên tài khoản đã tồn tại");
			return "signUp";
		}
		if (taiKhoanDao.existsByEmail(account.getEmail())) {
			model.addAttribute("errorMessage", "Email đã tồn tại");
			return "signUp";
		}

		taiKhoanDao.save(account);

		// Chuyển đến trang đăng nhập hoặc trang khác
		return "redirect:/login";
	}

}
