package com.poly.entity;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {

	private Map<SanPham, Integer> items = new HashMap<>(); // Mã sản phẩm và số lượng

	// Thêm sản phẩm vào giỏ hàng
	public void addItem(SanPham product, int quantity) {
		items.put(product, items.getOrDefault(product, 0) + quantity);
	}

	// Lấy danh sách sản phẩm trong giỏ hàng
	public Map<SanPham, Integer> getItems() {
		return items;
	}

	// Xóa sản phẩm khỏi giỏ hàng
	public void removeItem(SanPham product) {
		items.remove(product);
	}

	// Xóa tất cả sản phẩm khỏi giỏ hàng
	public void clear() {
		items.clear();
	}

	// Tính tổng số tiền giỏ hàng
	public double getTotal() {
		double total = 0.0; // Khởi tạo biến tổng
		for (Map.Entry<SanPham, Integer> entry : items.entrySet()) {
			SanPham product = entry.getKey(); // Lấy sản phẩm
			Integer quantity = entry.getValue(); // Lấy số lượng
			total += product.getGia() * quantity; // Tính tổng giá (giá * số lượng)
		}
		return total; // Trả về tổng
	}
}
