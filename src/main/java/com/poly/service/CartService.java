package com.poly.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.SanPhamDao;
import com.poly.entity.Cart;
import com.poly.entity.SanPham;

import jakarta.servlet.http.HttpSession;

@Service
public class CartService {
	@Autowired
	private SanPhamDao sanPhamDao;

	// Lấy giỏ hàng từ session
	public Cart getCart(HttpSession session) {
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart(); // Tạo một giỏ hàng mới nếu không có
			session.setAttribute("cart", cart);
		}
		return cart;
	}

	// // Thêm sản phẩm vào giỏ hàng
	public void addToCart(HttpSession session, SanPham product, int quantity) {
		Cart cart = getCart(session);
		cart.addItem(product, quantity); // Thêm sản phẩm vào giỏ hàng
	}

	// // Xóa sản phẩm khỏi giỏ hàng
	public void removeFromCart(HttpSession session, String productId) {
		Cart cart = getCart(session); // Lấy giỏ hàng từ session
		if (cart != null) {
			SanPham product = sanPhamDao.findById(productId).orElse(null); // Tìm sản phẩm theo ID
			System.out.println("Sản phẩm cần xóa: " + product); // Kiểm tra sản phẩm tìm được
			if (product != null) {
				cart.removeItem(product); // Gọi phương thức xóa với đối tượng SanPham
				System.out.println("Sản phẩm đã xóa: " + productId);
			} else {
				System.out.println("Sản phẩm không tìm thấy: " + productId);
			}
		} else {
			System.out.println("Giỏ hàng không tồn tại.");
		}
	}

	public void updateQuantity(HttpSession session, SanPham product, int newQuantity) {
		Cart cart = getCart(session);
		cart.getItems().put(product, newQuantity); // Cập nhật số lượng
		session.setAttribute("cart", cart); // Cập nhật lại giỏ hàng trong session
	}

	// Đếm số sản phẩm không trùng lặp trong giỏ hàng
	public int getTotalUniqueProducts(HttpSession session) {
		Cart cart = getCart(session);
		return cart.getItems().size(); // Trả về số lượng sản phẩm không trùng lặp
	}

}
