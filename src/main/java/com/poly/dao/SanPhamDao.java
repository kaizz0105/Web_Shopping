package com.poly.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.poly.entity.SanPham;

@Repository
public interface SanPhamDao extends JpaRepository<SanPham, String> {
	@Query("select o from SanPham o where o.loaiSP.maLoaiSP like ?1")
	Page<SanPham> findByLoai(String maLoaiSP, Pageable page);

	@Query("select o from SanPham o where o.maSP like ?1 or o.tenSP like ?2 or o.gia = ?3")
	Page<SanPham> searchByKey(String maSP, String tenSP, Double gia, Pageable page);

	@Query("select o from SanPham o where o.loaiSP.maLoaiSP like ?1 and o.gia between ?2 and ?3")
	Page<SanPham> findByLoaiAndPrice(String maLoaiSP, double minPrice, double maxPrice, Pageable page);

	Page<SanPham> findByGiaBetween(double min, double max, Pageable page);

	// Phương thức để lấy tất cả sản phẩm
	List<SanPham> findAll();
}
