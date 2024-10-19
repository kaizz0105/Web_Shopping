package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.poly.entity.MonthlyOrderStat;
import com.poly.service.DonHangService;

@Controller
public class StatisticsController {

	@Autowired
	private DonHangService donHangService;

	@GetMapping("/admin/statistics")
	public String showStatistics(Model model) {
		List<MonthlyOrderStat> monthlyStats = donHangService.getMonthlyOrderStats();

		// In ra console để kiểm tra
		for (MonthlyOrderStat stat : monthlyStats) {
			System.out.println(
					"Year: " + stat.getYear() + ", Month: " + stat.getMonth() + ", Total Orders: " + stat.getCount());
		}

		model.addAttribute("monthlyStats", monthlyStats); // Thêm vào model
		return "statistics"; // Trả về view statistics.jsp
	}
}
