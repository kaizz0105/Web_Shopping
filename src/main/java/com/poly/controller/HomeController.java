package com.poly.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.LoaiSanPhamDao;
import com.poly.dao.SanPhamDao;
import com.poly.service.CartService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	SanPhamDao spDao;
	@Autowired
	LoaiSanPhamDao loaiSPDao;

	@Autowired
	CartService cartService;

	@GetMapping("/")
	public String getIndex(Model model, @RequestParam("p") Optional<Integer> pageNumber, HttpSession session) {
		int currentPage = pageNumber.orElse(0);/// số trang hiện tại nếu không có thì = 0
		int pageSize = 8; // kích thước mỗi trang
		Pageable page = PageRequest.of(currentPage, pageSize);
		model.addAttribute("listSanPham", spDao.findAll(page));
		model.addAttribute("listLoaiSP", loaiSPDao.findAll());
		// Lấy số lượng sản phẩm không trùng lặp trong giỏ hàng
		int totalUniqueProducts = cartService.getTotalUniqueProducts(session);
		model.addAttribute("totalUniqueProducts", totalUniqueProducts); // Thêm vào model
		return "index";
	}

	@PostMapping("search")
	public String getProductBySearch(Model model, @RequestParam("key") Optional<String> key,
			@RequestParam("p") Optional<Integer> pageNumber) {
		Double gia = null;
		String name = key.orElse("").trim();
		int curentPage = pageNumber.orElse(0);
		int pageSize = 6;
		Pageable page = PageRequest.of(curentPage, pageSize);
		try {
			gia = Double.parseDouble(name);
		} catch (Exception ex) {

		}
		model.addAttribute("listSanPham", spDao.searchByKey("%" + name + "%", "%" + name + "%", gia, page));
		model.addAttribute("key", name);
		model.addAttribute("listLoaiSP", loaiSPDao.findAll());
		return "index";
	}

//@GetMapping("login")
//public String getLogin() {
//	return "Login";
//}
//@GetMapping("signup")
//public String getSignUp() {
//	return "SignUp";
//}
//
}
