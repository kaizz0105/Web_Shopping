package com.poly.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name ="SANPHAM")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class SanPham implements Serializable{
	@Id
	@Column(name="MaSP")
	String maSP;
	String tenSP;
	Double gia;
	String mauSac;
	@Column(name="HinhAnh")
	String hinhAnh;

	@ManyToOne
	@JoinColumn(name ="MaLoaiSP")
	LoaiSP loaiSP;

	@OneToMany(mappedBy = "sp")
	List<DonHangCT> listDonHangCT;
	@Override
	public int hashCode() {
		return Objects.hash(maSP); // Tạo hash code dựa trên ID sản phẩm
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null || getClass() != obj.getClass())
			return false;
		SanPham sanPham = (SanPham) obj;
		return Objects.equals(maSP, sanPham.maSP); // So sánh dựa trên ID sản phẩm
	}
}
