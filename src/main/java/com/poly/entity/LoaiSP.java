package com.poly.entity;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "LOAISP")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class LoaiSP implements Serializable {
	@Id
	String maLoaiSP;
	String tenLoaiSP;
	@OneToMany(mappedBy = "loaiSP")
	List<SanPham> listSP;
}
