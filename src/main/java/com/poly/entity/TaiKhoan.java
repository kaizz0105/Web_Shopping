package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Email;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "TAIKHOAN")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TaiKhoan implements Serializable {
	@Id

	String tenTaiKhoan;

	String matKhau;
	Boolean vaiTro;

	String dienThoai;
	@Email
	String email;

	String diaChi;

	@OneToMany(mappedBy = "user")
	List<DonHang> listDonHang;

}
