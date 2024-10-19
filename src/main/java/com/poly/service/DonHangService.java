package com.poly.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.poly.dao.DonHangDao;
import com.poly.entity.DonHang;
import com.poly.entity.MonthlyOrderStat;
import com.poly.entity.TaiKhoan;

@Service
public class DonHangService {

	@Autowired
	private DonHangDao donHangDao;

	public List<MonthlyOrderStat> getMonthlyOrderStats() {
		List<Object[]> results = donHangDao.countOrdersByMonthAndYear();
		List<MonthlyOrderStat> stats = new ArrayList<>();

		for (Object[] result : results) {
			int year = ((Number) result[0]).intValue();
			int month = ((Number) result[1]).intValue();
			long count = ((Number) result[2]).longValue();
			stats.add(new MonthlyOrderStat(year, month, count));
		}

		return stats;
	}

	public List<DonHang> findOrdersByUser(TaiKhoan user) {
		return donHangDao.findByUser(user);
	}
}
