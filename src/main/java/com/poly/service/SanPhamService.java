package com.poly.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.poly.dao.SanPhamDao;
import com.poly.entity.SanPham;

@Service
public class SanPhamService {
	@Autowired
	SanPhamDao spDao;

	public Page<SanPham> getSPByLoai(String maLoai, Pageable page) {
		return spDao.findByLoai(maLoai, page);
	}

	// Phương thức để lấy tất cả sản phẩm
	public List<SanPham> getAllProducts() {
		return spDao.findAll();
	}
}
