CREATE DATABASE ThuongMaiOnline
go
Use ThuongMaiOnline
go
CREATE TABLE LOAISP (
    MaLoaiSP VARCHAR(10) NOT NULL PRIMARY KEY,
    TenLoaiSP NVARCHAR(50)
);
go
CREATE TABLE SANPHAM (
    MaSP VARCHAR(10) NOT NULL PRIMARY KEY,
    TenSP NVARCHAR(50),
    Gia MONEY,  
    MauSac NVARCHAR(50),
    HinhAnh VARCHAR(125),
    MaLoaiSP VARCHAR(10) NOT NULL,
    FOREIGN KEY (MaLoaiSP) REFERENCES LOAISP(MaLoaiSP) 
);
go
CREATE TABLE TAIKHOAN (
    TenTaiKhoan VARCHAR(10) PRIMARY KEY,
    MatKhau VARCHAR(50) NOT NULL,
    VaiTro BIT NOT NULL,
    DienThoai VARCHAR(10),
    Email VARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(255)
);
go
CREATE TABLE DONHANG (
    MaDonHang VARCHAR(10) NOT NULL PRIMARY KEY,
    NgayTao DATE,
    IDTaiKhoan VARCHAR(10) NOT NULL,
    FOREIGN KEY (IDTaiKhoan) REFERENCES TaiKhoan(TenTaiKhoan)  
);
go
CREATE TABLE DONHANGCT (
	MaDonHangCT INT IDENTITY PRIMARY KEY,
    MaDonHang VARCHAR(10) NOT NULL,
    MaSP VARCHAR(10) NOT NULL,
    SoLuong INT,
    FOREIGN KEY (MaDonHang) REFERENCES DONHANG(MaDonHang), 
    FOREIGN KEY (MaSP) REFERENCES SANPHAM(MaSP)
)
go
INSERT INTO LOAISP (MaLoaiSP, TenLoaiSP)
VALUES
('LSP01', N'Điện thoại'),
('LSP02', N'Máy tính bảng'),
('LSP03', N'Laptop'),
('LSP04', N'Đồng hồ'),
('LSP05', N'Tai nghe'),
('LSP06', N'Thiết bị khác')
go

INSERT INTO SANPHAM(MaSP, TenSP, Gia, MauSac, HinhAnh, MaLoaiSP) VALUES 
('SP01','iPhone 16',25000,N'Đen','iphone16.jpg','LSP01'),
('SP02','iPad Pro',30000,N'Bạc','ipad-pro.jpg','LSP02'),
('SP03','MacBook Air',35000,N'Xám','macbook.jpg','LSP03'),
('SP04','Apple Watch',10000,N'Đen','apple-watch.jpg','LSP04'),
('SP05','Iphone 16 Pro Max 2TB',50000,N'Trắng','iphone-16.jpg','LSP01'),
('SP06',N'Tai nghe Bluetooth',50000,N'Trắng','tai-nghe-bluetooth.jpg','LSP05'),
('SP07','Citizen',55000,N'Trắng','citizen.jpg','LSP06'),
('SP08','Samsung A55',15000,N'Trắng','samsung-galaxy-a55.jpg','LSP01'),
('SP09','Oppo Reno12',25000,N'Trắng','oppo-reno12.jpg','LSP01'),
('SP10','Xiaomi redmi note 13',70000,N'Trắng','xiaomi-redmi-note-13.jpg','LSP01'),
('SP11','Acer Aspire Lite 14',12000,N'Trắng','acer-aspire-lite-14.jpg','LSP03'),
('SP12',N'Bàn phím Logitech',11000,N'Trắng','ban-phim-bluetooth-logitech-k380s.jpg','LSP06'),
('SP13',N'Chuột Logitech',80000,N'Trắng','chuot-bluetooth-logitech.jpg','LSP06'),
('SP14',N'Chuột Gaming',20000,N'Trắng','chuot-gaming-logitech.jpg','LSP06'),
('SP15',N'Màn hình LCD 27 inch MSI',15000,N'Trắng','msi-pro-mp275-27-inch.jpg','LSP06'),
('SP16','Laptop asus TUF GAMING F15 2024',72000,N'Trắng','asus-gaming-tuf-f15.jpg','LSP03'),
('SP17',N'Bàn phím magic',52000,N'Trắng','ban-phim-magic-keyboard.jpg','LSP06'),
('SP18',N'Chuột văn phòng',65000,N'Trắng','chuot-bluetooth-logitech.jpg','LSP06'),
('SP19','Iphone 16 pro',12000,N'Titan','iphone-16-pro.jpg','LSP01'),
('SP20','XIAOMI phone',50000,N'Xanh lá','redmi-note-13-pro-xanh-la.jpg','LSP01'),
('SP21',N'Sạc dự phòng 1000W',12000,N'Trắng','pin-sac-du-phong-10000mah.jpg','LSP06'),
('SP22',N'Dây sạc hỗ trợ sạc nhanh 50W',20000,N'Trắng','cap-type-c-lightning-mfi-0-9m-anker-542.jpg','LSP06'),
('SP23','Laptop DELL',20000,N'Trắng','dell-inspiron-15.jpg','LSP03'),
('SP24','Laptop Lenovo ThinkBook 512gb SSD',50000,N'Trắng','lenovo-thinkpad-e14-.jpg','LSP03'),
('SP25','ĐT SAMSUNG z-flip X',50000,N'Xanh blue','samsung-galaxy-z-flip6.jpg','LSP01')
go

INSERT INTO TAIKHOAN(TenTaiKhoan, MatKhau, VaiTro, DienThoai, Email, DiaChi) 
VALUES 
('user1', '12345', 1, '0442087306', 'user1@gmail.com', N'Tân Bình'),
('user2', '12345', 1, '0226640196', 'user2@gmail.com', N'Quận 7'),
('user3', '12345', 0, '0296122326', 'user3@gmail.com', N'Quận 3'),
('user4', '12345', 0, '0570439926', 'user4@gmail.com', N'Quận 4'),
 ('user5', '12345', 0, '0764348966', 'user5@gmail.com', N'Quận 5'),
 ('user6', '12345', 0, '0906170820', 'user6@gmail.com', N'Quận 6'),
 ('user7', '12345', 0, '0227493707', 'user7@gmail.com', N'Quận 7'),
 ('user8', '12345', 0, '0432926515', 'user8@gmail.com', N'Quận 8'),
 ('user9', '12345', 0, '0958093356', 'user9@gmail.com', N'Quận 9'),
 ('user10', '12345', 0, '0287688991', 'user10@gmail.com', N'Quận 10'),
 ('user11', '12345', 0, '0556170167', 'user11@gmail.com', N'Quận 11'),
 ('user12', '12345', 0, '0570637149', 'user12@gmail.com', N'Quận 12'),
 ('user13', '12345', 0, '0901785326', 'user13@gmail.com', N'Quận Gò Vấp'),
 ('user14', '12345', 0, '0875411595', 'user14@gmail.com', N'Quận Bình Thạnh'),
 ('user15', '12345', 0, '0876579691', 'user15@gmail.com', N'Quận Hải Châu'),
 ('user16', '12345', 0, '0182196477', 'user16@gmail.com', N'Huyện Hóc Môn'),
 ('user17', '12345', 0, '0327952824', 'user17@gmail.com', N'Quận Bình Tân'),
 ('user18', '12345', 0, '0285196545', 'user18@gmail.com', N'Long Xuyên'),
 ('user19', '12345', 0, '0125074182', 'user19@gmail.com', N'Củ Chi'),
 ('user20', '12345', 0, '0303085294', 'user20@gmail.com', N'Cần Giờ')
 go

INSERT INTO DONHANG (MaDonHang, NgayTao,IDTaiKhoan)
VALUES
('DH01', '2023-09-01', 'user3'),
('DH02', '2023-09-02', 'user3'),
('DH03', '2023-09-03', 'user3'),
('DH04', '2023-09-04', 'user4'),
('DH05', '2023-09-05', 'user5'),
('DH06', '2023-09-06', 'user6'),
('DH07', '2023-09-07', 'user5'),
('DH08', '2023-09-08', 'user5'),
('DH09', '2023-09-09', 'user7'),
('DH10', '2023-09-10', 'user8'),
('DH11', '2023-09-11', 'user9'),
('DH12', '2023-09-12', 'user10'),
('DH13', '2023-09-13', 'user12'),
('DH14', '2023-09-14', 'user13'),
('DH15', '2023-09-15', 'user8'),
('DH16', '2023-09-16', 'user8'),
('DH17', '2023-09-17', 'user8'),
('DH18', '2023-09-18', 'user9'),
('DH19', '2023-09-19', 'user11'),
('DH20', '2023-09-20', 'user13');
go

INSERT INTO DONHANGCT (MaDonHang, MaSP, SoLuong)
VALUES
('DH01', 'SP01', 2),
('DH02', 'SP02', 1),
('DH03', 'SP03', 5),
('DH04', 'SP04', 3),
('DH05', 'SP05', 1),
('DH06', 'SP06', 4),
('DH07', 'SP07', 2),
('DH08', 'SP08', 3),
('DH09', 'SP09', 1),
('DH10', 'SP10', 2),
('DH11', 'SP11', 4),
('DH12', 'SP12', 1),
('DH13', 'SP13', 2),
('DH14', 'SP14', 3),
('DH15', 'SP15', 5),
('DH16', 'SP16', 2),
('DH17', 'SP17', 3),
('DH18', 'SP18', 1),
('DH19', 'SP19', 2),
('DH20', 'SP20', 4)
go

ALTER TABLE DONHANG
ADD TinhTrang BIT DEFAULT 0
go

