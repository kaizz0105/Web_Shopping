package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.entity.TaiKhoan;
import com.poly.service.AccountInfoService;
import com.poly.service.CartService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AccountInfoController {
	@Autowired
	private AccountInfoService accountInfoService;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private CartService cartService;

	@RequestMapping("/accountInfo")
	public String showAccountInfo(HttpSession session, Model model) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");
		if (user != null) {
			model.addAttribute("account", user);
			int totalUniqueProducts = cartService.getTotalUniqueProducts(session);
			model.addAttribute("totalUniqueProducts", totalUniqueProducts);
			return "accountInfo";
		} else {
			return "redirect:/login";
		}
	}

	@PostMapping("/updateAccount")
	public String updateAccount(@ModelAttribute TaiKhoan account, HttpSession session) {
		System.out.println("a:" + account.getTenTaiKhoan());
		TaiKhoan userInSession = (TaiKhoan) session.getAttribute("user");
		if (userInSession != null) {
			account.setVaiTro(userInSession.getVaiTro()); // Giữ lại vai trò cũ
		}
		accountInfoService.updateAccount(account);

		// Cập nhật lại thông tin trong session
		session.setAttribute("user", account);

		// Chuyển hướng lại trang thông tin tài khoản
		return "redirect:/accountInfo";
	}

}
