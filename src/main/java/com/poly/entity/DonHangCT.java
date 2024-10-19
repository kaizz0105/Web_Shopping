package com.poly.entity;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "DONHANGCT")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DonHangCT implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer maDonHangCT;
	@ManyToOne
	@JoinColumn(name = "MaDonHang")
	DonHang donHang;
	@ManyToOne
	@JoinColumn(name = "MaSP")
	SanPham sp;
	int soLuong;
}
