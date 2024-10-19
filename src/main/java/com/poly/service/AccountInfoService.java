package com.poly.service;

import com.poly.dao.TaiKhoanDao;
import com.poly.entity.TaiKhoan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountInfoService {
    @Autowired
    private TaiKhoanDao taiKhoanDao;
    public void updateAccount(TaiKhoan account) {
        // Kiểm tra và chỉ cập nhật các trường cần thiết mà không thay đổi ID
        TaiKhoan existingAccount = taiKhoanDao.findById(account.getTenTaiKhoan()).orElse(null);
        if (existingAccount != null) {
            existingAccount.setEmail(account.getEmail());
            existingAccount.setDienThoai(account.getDienThoai());
            existingAccount.setDiaChi(account.getDiaChi());
            // Không thay đổi id

            taiKhoanDao.save(existingAccount);
        }
    }

}
