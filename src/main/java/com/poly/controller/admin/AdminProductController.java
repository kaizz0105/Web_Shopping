package com.poly.controller.admin;

import java.io.File;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.poly.dao.LoaiSanPhamDao;
import com.poly.dao.SanPhamDao;
import com.poly.entity.SanPham;

@Controller
public class AdminProductController {
	@Autowired
	SanPhamDao spDao;
	@Autowired
	LoaiSanPhamDao loaispDao;
	
	@GetMapping("editProduct")
	public String getAdminHome(Model model,@ModelAttribute("sanpham")SanPham sp,@RequestParam("p") Optional<Integer> pageNumber) {
		sp.setMaSP(null);
		sp.setLoaiSP(null);
		sp.setGia(null);
		sp.setHinhAnh(null);
		sp.setMauSac(null);
		model.addAttribute("listLoaiSP", loaispDao.findAll());
		int currentPage = pageNumber.orElse(0);
		int pageSize = 8;
		PageRequest page = PageRequest.of(currentPage, pageSize);
		model.addAttribute("listProduct", spDao.findAll(page));
	    return "admin/NewOrUpdateProduct";
	}
	
	
	@GetMapping("admin/Productedit")
	public String ProductEdit(Model model, @RequestParam("id") String id, @ModelAttribute("sanpham") SanPham item,@RequestParam("p") Optional<Integer> pageNumber) {
	    Optional<SanPham> optionalSanPham = spDao.findById(id);
	    int currentPage = pageNumber.orElse(0);
		int pageSize = 8;
		PageRequest page = PageRequest.of(currentPage, pageSize);
	    if (optionalSanPham.isEmpty()) {
	        // Nếu không tìm thấy sản phẩm, chuyển hướng đến danh sách sản phẩm hoặc trang khác
	        return "redirect:/admin/NewOrUpdateProduct";
	    } else {
	        // Nếu tìm thấy sản phẩm, đặt giá trị vào item
	        SanPham sp = optionalSanPham.get();
	        item.setMaSP(sp.getMaSP());
	        item.setTenSP(sp.getTenSP());
	        item.setGia(sp.getGia());
	        item.setMauSac(sp.getMauSac());
	        item.setHinhAnh(sp.getHinhAnh());
	        item.setLoaiSP(sp.getLoaiSP()); // Nếu có trường loại sản phẩm
	    }
	    
	    // Thêm item vào model để sử dụng trong JSP
	    model.addAttribute("listProduct", spDao.findAll(page));
	    model.addAttribute("sanpham", item);
	    model.addAttribute("listLoaiSP", loaispDao.findAll());
	    return "admin/NewOrUpdateProduct"; // Trả về JSP để hiển thị dữ liệu
	}
	
	@PostMapping("/admin/updateProduct")
	public String updateProduct(@ModelAttribute("sanpham") SanPham item, 
	                             @RequestParam("hinhAnh") MultipartFile hinhAnhFile,
	                             RedirectAttributes redirectAttributes) {
	    try {
	        // Kiểm tra xem có file không
	        if (!hinhAnhFile.isEmpty()) {
	            // Lưu file vào thư mục mong muốn
	            String fileName = hinhAnhFile.getOriginalFilename();
	            String filePath = "/D:/Java5_BaiTap/ThuongMaiOnline/src/main/webapp/img" + fileName; // Đường dẫn lưu trữ
	            hinhAnhFile.transferTo(new File(filePath));
	            item.setHinhAnh(fileName); // Cập nhật tên file trong sản phẩm
	        }
	        spDao.save(item);
	        
	        redirectAttributes.addFlashAttribute("message", "Cập nhật sản phẩm thành công!");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi cập nhật sản phẩm!");
	    }

	    return "redirect:/admin/NewOrUpdateProduct";
	}

}
