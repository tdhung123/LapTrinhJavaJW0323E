package com.donacuoikhoa.quanlykhoahoc.thongke;

import com.donacuoikhoa.quanlykhoahoc.nguoidung.NguoiDung;
import com.donacuoikhoa.quanlykhoahoc.nguoidung.NguoiDungRepository;
import com.donacuoikhoa.quanlykhoahoc.quanlydetai.QuanLyDeTai;
import com.donacuoikhoa.quanlykhoahoc.quanlydetai.QuanLyDeTaiRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Collections;
import java.util.List;



@Controller
public class ThongKeController {

    @Autowired
    private QuanLyDeTaiRepository quanLyDeTaiRepository;

    @Autowired
    private NguoiDungRepository nguoiDungRepository;

    @GetMapping("/thongke")
    public String thongKe( Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String email = authentication.getName();
        NguoiDung nguoiDung = nguoiDungRepository.getNguoiDungByEmail(email);
        if (nguoiDung != null) {
            List<QuanLyDeTai> quanLyDeTaiList = quanLyDeTaiRepository.findByNguoiDungId(nguoiDung.getId());
            Collections.reverse(quanLyDeTaiList);
            model.addAttribute("nguoiDung", nguoiDung);
            model.addAttribute("quanLyDeTaiList", quanLyDeTaiList);
            System.out.println(quanLyDeTaiList);
            return "thongke/thongkediem"; // Trả về tên template (view) để render trang
        } else {
            return "redirect:/dangnhap"; // Chuyển hướng đến trang đăng nhập nếu không tìm thấy người dùng
        }
    }
}

