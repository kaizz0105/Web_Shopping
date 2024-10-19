package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.SanPhamDao;
import com.poly.entity.Cart;
import com.poly.entity.SanPham;
import com.poly.service.CartService;
import com.poly.service.SessionService;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController extends BaseController {

	@Autowired
	private SanPhamDao sanPhamDao;

	@Autowired
	private CartService cartService;

	@Autowired
	private SessionService sessionService;

	// @PostMapping("/cart/addToCart")
//	public String addToCart(@RequestParam("maSP") String maSP, @RequestParam("quantity") int quantity,
//			HttpSession session) {
//		// Kiểm tra xem người dùng đã đăng nhập hay chưa
//		if (!sessionService.isLogin(session)) { // Sử dụng SessionService để kiểm tra
//			return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
//		}
//		SanPham product = sanPhamDao.findById(maSP).orElse(null); // Sử dụng Optional để tìm sản phẩm
//
//		if (product != null) {
//			cartService.addToCart(session, product, quantity);
//			return "redirect:/cart"; // Chuyển hướng đến trang giỏ hàng
//		} else {
//			return "redirect:/cart"; // Hoặc trang lỗi nào đó
//		}
//	}
	@PostMapping("/cart/addToCart")
	public String addToCart(@RequestParam("maSP") String maSP, @RequestParam("quantity") int quantity,
			HttpSession session, Model model) {
		// Kiểm tra xem người dùng đã đăng nhập hay chưa
		if (!sessionService.isLogin(session)) {
			return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
		}

		SanPham product = sanPhamDao.findById(maSP).orElse(null);

		if (product != null) {
			// Lấy giỏ hàng từ session
			Cart cart = cartService.getCart(session);

			// Kiểm tra nếu sản phẩm đã tồn tại trong giỏ hàng
			if (cart.getItems().containsKey(product)) {
				// Nếu có, tăng số lượng hiện tại
				int currentQuantity = cart.getItems().get(product);
				cartService.updateQuantity(session, product, currentQuantity + quantity);
			} else {
				// Nếu chưa có, thêm sản phẩm vào giỏ hàng với số lượng mới
				cartService.addToCart(session, product, quantity);
			}
			return "redirect:/cart"; // Chuyển hướng đến trang giỏ hàng
		} else {
			return "redirect:/cart"; // Nếu sản phẩm không tồn tại, chuyển hướng về giỏ hàng hoặc trang lỗi
		}
	}

	@PostMapping("/cart/removeFromCart")
	public String removeFromCart(@RequestParam("productId") String productId, HttpSession session) {
		// Xóa sản phẩm khỏi giỏ hàng
		System.out.println("Xóa sản phẩm với ID: " + productId);
		cartService.removeFromCart(session, productId);
		return "redirect:/cart"; // Chuyển hướng lại đến trang giỏ hàng
	}

	@PostMapping("/cart/updateQuantity")
	public String updateQuantity(@RequestParam("productId") String productId, @RequestParam("action") String action,
			HttpSession session) {
		// Kiểm tra xem người dùng đã đăng nhập hay chưa
		if (!sessionService.isLogin(session)) {
			return "redirect:/login"; // Chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
		}

		// Lấy giỏ hàng
		Cart cart = cartService.getCart(session);
		SanPham product = sanPhamDao.findById(productId).orElse(null);

		if (product != null) {
			// Kiểm tra hành động tăng hay giảm
			if ("increase".equals(action)) {
				cart.addItem(product, 1); // Thêm 1 sản phẩm
			} else if ("decrease".equals(action)) {
				// Giảm số lượng 1 sản phẩm
				int currentQuantity = cart.getItems().get(product); // Lấy số lượng hiện tại của sản phẩm
				if (currentQuantity > 1) {
					cart.addItem(product, -1); // Giảm số lượng 1
				} else {
					cart.removeItem(product); // Nếu số lượng còn lại là 1, thì xóa sản phẩm
				}
			}
		}

		return "redirect:/cart"; // Chuyển hướng lại đến trang giỏ hàng
	}

	@GetMapping("/cart")
	public String showCart(HttpSession session, Model model) {
		// Lấy giỏ hàng từ session
		Object cart = session.getAttribute("cart"); // Thay đổi tùy thuộc vào cách bạn lưu giỏ hàng
		// Lấy số lượng sản phẩm không trùng lặp trong giỏ hàng
		int totalUniqueProducts = cartService.getTotalUniqueProducts(session);
		// Thêm giỏ hàng vào model để hiển thị trong view
		model.addAttribute("cart", cart);
		model.addAttribute("totalUniqueProducts", totalUniqueProducts);
		return "Cart"; // Trả về tên trang giỏ hàng (Cart.jsp)
	}
}
