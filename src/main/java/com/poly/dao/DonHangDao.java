package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.DonHang;
import com.poly.entity.TaiKhoan;

public interface DonHangDao extends JpaRepository<DonHang, String> {
	@Query("SELECT EXTRACT(YEAR FROM d.ngayTao) AS year, EXTRACT(MONTH FROM d.ngayTao) AS month, COUNT(d) AS count "
			+ "FROM DonHang d " + "GROUP BY EXTRACT(YEAR FROM d.ngayTao), EXTRACT(MONTH FROM d.ngayTao) "
			+ "ORDER BY year, month")
	List<Object[]> countOrdersByMonthAndYear();

	List<DonHang> findByUser(TaiKhoan user); // Lấy đơn hàng theo tài khoản
}
