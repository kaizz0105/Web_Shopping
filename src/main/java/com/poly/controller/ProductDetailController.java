package com.poly.controller;

import java.util.Optional;

import org.hibernate.annotations.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.LoaiSanPhamDao;
import com.poly.dao.SanPhamDao;
import com.poly.service.SanPhamService;

@Controller
public class ProductDetailController {
	@Autowired
	SanPhamDao spDao;
	@Autowired
	LoaiSanPhamDao loaiSPDao;
@GetMapping("sanpham/")
public String getProdcutDetail(Model model, @RequestParam("id") String maSP) {
	model.addAttribute("listLoaiSP", loaiSPDao.findAll());
	model.addAttribute("product",spDao.findById(maSP).get());
	return ("ProductDetail");
}
}
