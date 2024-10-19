package com.poly.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name ="DONHANG")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class DonHang implements Serializable {
	@Id
	@Column(name="MaDonHang")
	String maDonHang;

	@Temporal(TemporalType.DATE)
	@Column(name = "NgayTao")
	Date ngayTao;

	@ManyToOne
	@JoinColumn(name = "IDTaiKhoan")
	TaiKhoan user;

	@OneToMany(mappedBy = "donHang")
	List<DonHangCT> listDonHangCT;
	@Column(name="TinhTrang")
	Boolean tinhTrang;
}
