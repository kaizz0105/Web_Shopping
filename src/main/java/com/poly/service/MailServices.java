package com.poly.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Service
public class MailServices{
    @Autowired
    private JavaMailSender mailSender;


    @Value("${spring.mail.username}")
    private String senderEmail;

    private final Map<String, String> verificationCodes = new HashMap<>();
    private final Map<String, Long> codeTimestamps = new HashMap<>();

    public String generateVerificationCode() {
        Random random = new Random();
        return String.format("%05d", random.nextInt(100000));
    }

    public void sendVerificationCode(String email) {
        String verificationCode = generateVerificationCode();
        verificationCodes.put(email, verificationCode);
        codeTimestamps.put(email, System.currentTimeMillis());

        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(senderEmail);
        message.setTo(email);
        message.setSubject("Mã xác nhận đổi mật khẩu");
        message.setText("Mã xác nhận của bạn là: " + verificationCode + ". Mã sẽ hết hạn trong 1 phút.");

        mailSender.send(message);
    }

    public boolean isCodeValid(String email, String code) {
        String correctCode = verificationCodes.get(email);
        Long sentTime = codeTimestamps.get(email);

        if (correctCode == null || sentTime == null) {
            return false;
        }

        if (correctCode.equals(code) && (System.currentTimeMillis() - sentTime) <= 60000) {
            return true;
        }

        return false;
    }

    public void clearVerificationData(String email) {
        verificationCodes.remove(email);
        codeTimestamps.remove(email);
    }
}

