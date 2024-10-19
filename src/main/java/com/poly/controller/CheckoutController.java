package com.poly.controller;

import com.poly.dao.DonHangChiTietDao;
import com.poly.dao.DonHangDao;
import com.poly.dao.TaiKhoanDao;
import com.poly.entity.Cart;
import com.poly.entity.DonHang;
import com.poly.entity.DonHangCT;
import com.poly.entity.TaiKhoan;
import com.poly.service.CartService;
import com.poly.service.SessionService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Date;

@Controller
public class CheckoutController {

	@Autowired
	private DonHangDao donHangDao;

	@Autowired
	private DonHangChiTietDao donHangCTDao;

	@Autowired
	private CartService cartService;

	@Autowired
	private SessionService sessionService;
	@Autowired
	private TaiKhoanDao taiKhoanDao; // Thêm repository cho TaiKhoan

	@GetMapping("/cart/checkout")
	public String viewCart(HttpSession session, Model model) {
		Cart cart = cartService.getCart(session); // Lấy giỏ hàng từ session
		model.addAttribute("cart", cart);
		return "Cart"; // Trả về trang cart.jsp
	}

	@PostMapping("/checkout")
	public String checkout(HttpSession session, Model model) {
		TaiKhoan user = sessionService.getUser(session); // Lấy tài khoản từ session

		if (user == null) {
			// Xử lý nếu người dùng chưa đăng nhập
			return "redirect:/login"; // Chuyển hướng đến trang đăng nhập
		}

		// Tạo mã đơn hàng mới theo định dạng "DH01"
		String maDonHang = generateOrderCode();

		// Tạo đối tượng đơn hàng
		DonHang donHang = new DonHang();
		donHang.setMaDonHang(maDonHang);
		donHang.setNgayTao(new Date());
		donHang.setUser(user);
		donHang.setTinhTrang(false); // Đang xử lý (false)

		// Lưu đơn hàng vào cơ sở dữ liệu
		donHangDao.save(donHang);

		// Lưu chi tiết đơn hàng từ giỏ hàng
		Cart cart = cartService.getCart(session);
		cart.getItems().forEach((sanPham, soLuong) -> {
			DonHangCT donHangCT = new DonHangCT();
			donHangCT.setDonHang(donHang);
			donHangCT.setSp(sanPham);
			donHangCT.setSoLuong(soLuong);
			donHangCTDao.save(donHangCT);
		});

		// Xóa giỏ hàng sau khi thanh toán
		session.removeAttribute("cart");

		return "confirmation"; // Trả về confirmation.jsp
	}

	private String generateOrderCode() {
		// Lấy số lượng đơn hàng hiện tại từ cơ sở dữ liệu
		Long count = donHangDao.count(); // Giả sử bạn có phương thức này trong DonHangRepository
		int newOrderNumber = count.intValue() + 1; // Tăng số đơn hàng lên 1

		// Định dạng mã đơn hàng
		return String.format("DH%02d", newOrderNumber); // Ví dụ: "DH01", "DH02", ...
	}

	@GetMapping("/confirmation")
	public String confirmation() {
		return "confirmation"; // Trả về confirmation.jsp
	}
}
