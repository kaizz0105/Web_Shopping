package com.poly.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.LoaiSanPhamDao;
import com.poly.dao.SanPhamDao;
import com.poly.entity.SanPham;
import com.poly.service.SanPhamService;

@Controller
public class ProductController {
	@Autowired
	SanPhamService spService;
	@Autowired
	LoaiSanPhamDao loaiSPDao;
	@Autowired
	SanPhamDao spDao;

	@GetMapping("/loai/")
	public String getProduct(Model model, @RequestParam("loai") Optional<String> maLoai,
			@RequestParam("p") Optional<Integer> pageNumber) {
		int currentPage = pageNumber.orElse(0);/// số trang hiện tại nếu không có thì = 0
		int pageSize = 6; // kích thước mỗi trang
		Pageable page = PageRequest.of(currentPage, pageSize);
		Page<SanPham> listSanPham = spService.getSPByLoai(maLoai.orElse(""), page);
		model.addAttribute("listSanPham", listSanPham);
		model.addAttribute("listLoaiSP", loaiSPDao.findAll());
		return "Product";
	}

	@GetMapping("sort/")
	public String sortProduct(Model model, @RequestParam("field") String field,
			@RequestParam("loai") Optional<String> maLoai, @RequestParam("p") Optional<Integer> pageNumber) {
		int currentPage = pageNumber.orElse(0);/// số trang hiện tại nếu không có thì = 0
		int pageSize = 6; // kích thước mỗi trang
		Sort sort = Sort.by(Sort.Direction.DESC, field);
		Pageable page = PageRequest.of(currentPage, pageSize).withSort(Sort.by(Sort.Direction.DESC, field));
		Page<SanPham> listSanPham = spService.getSPByLoai(maLoai.orElse(""), page);
		model.addAttribute("listSanPham", listSanPham);
		model.addAttribute("listLoaiSP", loaiSPDao.findAll());
		return "Product";
	}

//@GetMapping("filter")
//public String filterByPrice(Model model, @RequestParam(value = "priceRange") List<String> price, @RequestParam("loai") Optional<String> maLoai,@RequestParam("p") Optional<Integer> pageNumber) {
//	int currentPage = pageNumber.orElse(0);///số trang hiện tại nếu không có thì = 0
//	int pageSize = 6; //kích thước mỗi trang
//	Pageable page = PageRequest.of(currentPage,pageSize);
//	if (price != null && price.contains("all")) {
//		Page<SanPham> listSanPham = spService.getSPByLoai(maLoai.orElse(""),page);
//		model.addAttribute("listSanPham", listSanPham);
//	}
//	else {
//		double minPrice = Double.MIN_VALUE;
//        double maxPrice = Double.MAX_VALUE;
//
//        for (String range : price) {
//            String[] limits = range.split("-");
//            minPrice = Math.min(minPrice, Double.parseDouble(limits[0].trim()));
//            maxPrice = Math.max(maxPrice, Double.parseDouble(limits[1].trim()));
//        }
//        Page<SanPham> listSanPage = spDao.findByLoaiAndPrice(maLoai.orElse(""), minPrice, maxPrice, page);
//        model.addAttribute("listSanPham", listSanPage);
//	}
//	model.addAttribute("listLoaiSP", loaiSPDao.findAll());
//	return "Product";
//}
	@GetMapping("/filter")
	public String getSPbyGia(Model model, @RequestParam(value = "priceRange") List<String> price,
			@RequestParam("p") Optional<Integer> pageNumber) {
		int currentPage = pageNumber.orElse(0);/// số trang hiện tại nếu không có thì = 0
		int pageSize = 6; // kích thước mỗi trang
		Pageable page = PageRequest.of(currentPage, pageSize);

		if (price != null && price.contains("all")) {
			Page<SanPham> listSanPham = spDao.findAll(page);
			model.addAttribute("listSanPham", listSanPham);
			model.addAttribute("listLoaiSP", loaiSPDao.findAll());
		} else {
			double minPrice = Double.MIN_VALUE;
			double maxPrice = Double.MAX_VALUE;

			for (String range : price) {
				String[] limits = range.split("-");
				minPrice = Math.min(minPrice, Double.parseDouble(limits[0].trim()));
				maxPrice = Math.max(maxPrice, Double.parseDouble(limits[1].trim()));
			}
			Page<SanPham> listSanPham = spDao.findByGiaBetween(minPrice, maxPrice, page);
			model.addAttribute("listSanPham", listSanPham);
			model.addAttribute("listLoaiSP", loaiSPDao.findAll());
		}
		return "Product";
	}

	@Autowired
	private SanPhamService sanPhamService;

	@GetMapping("/admin/products")
	public String showProducts(Model model) {
		// Lấy danh sách sản phẩm
		List<SanPham> productList = sanPhamService.getAllProducts();

		// Thêm danh sách sản phẩm vào model
		model.addAttribute("products", productList);
		return "productsStatistics"; // Trả về tên trang JSP hiển thị sản phẩm
	}
}
