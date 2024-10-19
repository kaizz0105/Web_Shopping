package com.poly.controller.admin;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.DonHangChiTietDao;
import com.poly.dao.DonHangDao;
import com.poly.entity.DonHang;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminHoneController {
	@Autowired
	DonHangDao dhDao;
	@Autowired
	DonHangChiTietDao dhctDao;
	@Autowired
	private SessionService sessionService;

	@GetMapping("admin")
	public String getAdmin(Model model, @ModelAttribute("donHang") DonHang dh,
			@RequestParam("p") Optional<Integer> pageNumber, HttpSession session,
			RedirectAttributes redirectAttributes) {

		if (!sessionService.isAdmin(session)) {
			redirectAttributes.addFlashAttribute("error", "Không có quyền truy cập");
			return "redirect:/";
		}
		dh.setMaDonHang(null);
		dh.setNgayTao(null);
		dh.setTinhTrang(false);
		int currentPage = pageNumber.orElse(0);/// số trang hiện tại nếu không có thì = 0
		int pageSize = 6; // kích thước mỗi trang
		Pageable page = PageRequest.of(currentPage, pageSize);
		Page<DonHang> listDonHang = dhDao.findAll(page);
		model.addAttribute("listDonHang", listDonHang);
		return "admin/HomeAdmin";
	}

	@PostMapping("admin/donhang")
	public String editDonHang(Model model, @RequestParam("id") String id,
			@RequestParam("p") Optional<Integer> pageNumber) {
		if (dhDao.findById(id).isEmpty()) {
			return "redirect:/admin";
		} else {
			DonHang donhang = dhDao.findById(id).get();
			donhang.setTinhTrang(true);
			dhDao.save(donhang);
		}
		int currentPage = pageNumber.orElse(0);/// số trang hiện tại nếu không có thì = 0
		int pageSize = 6; // kích thước mỗi trang
		Pageable page = PageRequest.of(currentPage, pageSize);
		Page<DonHang> listDonHang = dhDao.findAll(page);
		model.addAttribute("listDonHang", listDonHang);
		return "redirect:/admin";
	}

	@GetMapping("admin/donhangCT")
	public String getBillDetail(Model model, @RequestParam("id") String id,
			@RequestParam("p") Optional<Integer> pageNumber) {
		if (dhDao.findById(id).isEmpty()) {
			return "redirect:/admin";
		} else {
			model.addAttribute("listDHCT", dhctDao.findByMaDH(id));
		}
		int currentPage = pageNumber.orElse(0);/// số trang hiện tại nếu không có thì = 0
		int pageSize = 6; // kích thước mỗi trang
		Pageable page = PageRequest.of(currentPage, pageSize);
		Page<DonHang> listDonHang = dhDao.findAll(page);
		model.addAttribute("listDonHang", listDonHang);
		return "forward:/admin";
	}

}
