package com.poly.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.entity.DonHangCT;
import java.util.List;


public interface DonHangChiTietDao extends JpaRepository<DonHangCT,Integer>{
	@Query("select o from DonHangCT o where o.donHang.maDonHang like ?1")
	List<DonHangCT> findByMaDH(String maDH);
}
