package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.TaiKhoanDao;
import com.poly.entity.DonHang;
import com.poly.entity.TaiKhoan;
import com.poly.service.DonHangService;
import com.poly.service.LoginService;
import com.poly.service.MailServices;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController extends BaseController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private SessionService sessionService;
	@Autowired
	private MailServices mailerService;
	@Autowired
	private TaiKhoanDao taiKhoanDao;
	@Autowired
	private DonHangService donHangService;

	@GetMapping("/login")
	public String showLoginPage() {
		return "Login";
	}

	@PostMapping("/login")
	public String login(HttpSession session, @RequestParam String username, @RequestParam String password,
			Model model) {
		TaiKhoan user = loginService.login(username, password);
		if (user != null) {
			sessionService.login(session, user);
			return "redirect:/";
		} else {
			model.addAttribute("error", "Tài khoản hoặc mật khẩu không tồn tại");
			return "Login";
		}
	}

	@GetMapping("/changePass")
	public String showChangePassPage(HttpSession session) {
		if (!sessionService.isLogin(session)) {
			return "redirect:/login";
		}
		return "changePassword";
	}

	@PostMapping("/changePass")
	public String changePass(HttpSession session, @RequestParam String currentPassword,
			@RequestParam String newPassword, @RequestParam String confirmPassword, Model model) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");
		if (!loginService.checkPassword(user, currentPassword)) {
			model.addAttribute("error", "Mật khẩu hiện tại không đúng");
			return "changePassword";
		}
		if (!newPassword.equals(confirmPassword)) {
			model.addAttribute("error", "Mật khẩu mới và xác nhận mật khẩu không khớp");
			return "changePassword";
		}
		loginService.updatePassword(user, newPassword);
		user.setMatKhau(newPassword);
		session.setAttribute("user", user);
		return "index";
	}

	@GetMapping("/index")
	public String showIndexPage() {
		return "index"; // Trả về trang index.jsp
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		sessionService.logout(session);
		return "redirect:/login";
	}

	@GetMapping("/forgot-password")
	public String showForgotPasswordForm() {
		return "forgot-password";
	}

	@PostMapping("/forgot-password")
	public String sendVerificationCode(HttpSession session, @RequestParam String email, Model model) {
		TaiKhoan user = taiKhoanDao.findByEmail(email);

		if (user == null) {
			model.addAttribute("error", "Email không tồn tại");
			return "forgot-password";
		}

		mailerService.sendVerificationCode(email);
//		model.addAttribute("email", email);
		session.setAttribute("email", user.getEmail());
//		sessionService.forget(session,user);
		return "verify-code";
	}

//	 @GetMapping("/verify-code")
//	public String showVerifyCodeForm() {
//		return "verify-code";
//	}

	@PostMapping("/verify-code")
	public String verifyCode(HttpSession session, @RequestParam String code, Model model) {
		String email = (String) session.getAttribute("email");
		System.out.println("Email hien thi trong verricode: " + email);
		if (email == null) {
			model.addAttribute("error", "Phiên đã hết hạn. Vui lòng thử lại.");
			return "forgot-password";
		}

		if (mailerService.isCodeValid(email, code)) {
			return "reset-password";
		} else {
			model.addAttribute("error", "Mã xác nhận không đúng hoặc đã hết hạn");
			return "verify-code";
		}
	}

	@PostMapping("/reset-password")
	public String resetPassword(HttpSession session, @RequestParam String newPassword, Model model) {
		String email = (String) session.getAttribute("email");
		System.out.println("Email hien thi trong resetPassword: " + email);
		TaiKhoan user = taiKhoanDao.findByEmail(email);
		if (user != null) {
			loginService.updatePassword(user, newPassword); // Cập nhật mật khẩu mới
			mailerService.clearVerificationData(email); // Xóa dữ liệu mã xác nhận
			model.addAttribute("success", "Mật khẩu đã được thay đổi thành công");
			return "Login"; // Chuyển đến trang login
		} else {
			model.addAttribute("error", "Không tìm thấy tài khoản");
			return "forgot-password";
		}
	}

	@GetMapping("/personal-information")
	public String showIndexPage(HttpSession session, Model model) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");

		if (user != null) {
			model.addAttribute("username", user.getTenTaiKhoan());
		} else {
			return "redirect:/login";
		}

		return "PersonalInfo";
	}

	@PostMapping("/personal-information")
	public String handleChangeInformation(Model model, @RequestParam("email") String email,
			@RequestParam("name") String name, @RequestParam("phone") String phone,
			@RequestParam("address") String address) {
		TaiKhoan taiKhoan = taiKhoanDao.findByEmail(email);

		taiKhoan.setTenTaiKhoan(name);
		taiKhoan.setDienThoai(phone);
		taiKhoan.setDiaChi(address);

		taiKhoanDao.save(taiKhoan);

		model.addAttribute("message", "Lưu thành công!");
		model.addAttribute("taiKhoan", taiKhoan);

		return "PersonalInfo";
	}

	@GetMapping("/don-hang-cua-toi")
	public String showUserOrders(HttpSession session, Model model) {
		TaiKhoan user = (TaiKhoan) session.getAttribute("user");

		if (user == null) {
			return "redirect:/login"; // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
		}

		List<DonHang> orders = donHangService.findOrdersByUser(user);
		model.addAttribute("orders", orders);

		return "UserOrders"; // Trả về trang JSP hiển thị đơn hàng
	}
}
