package com.poly.controller;

import com.poly.entity.TaiKhoan;
import com.poly.service.SessionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

public abstract class BaseController {

	@Autowired
	private SessionService sessionService;

	@ModelAttribute
	public void addUserToModel(HttpSession session, Model model) {
		TaiKhoan user = sessionService.getUser(session);
		if (user != null) {
			model.addAttribute("username", user.getTenTaiKhoan()); // Thêm username vào model
		} else {
			model.addAttribute("username", null); // Nếu không có người dùng, gán là null
		}
	}
}
