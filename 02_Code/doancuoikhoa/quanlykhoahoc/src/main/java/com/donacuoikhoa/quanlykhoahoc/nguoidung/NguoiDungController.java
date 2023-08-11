package com.donacuoikhoa.quanlykhoahoc.nguoidung;

import com.donacuoikhoa.quanlykhoahoc.bomon.BoMon;
import com.donacuoikhoa.quanlykhoahoc.bomon.BoMonNotFoundException;
import com.donacuoikhoa.quanlykhoahoc.bomon.BoMonService;
import com.donacuoikhoa.quanlykhoahoc.khoa.Khoa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/nguoidung")
public class NguoiDungController {
    @Autowired
    private NguoiDungService nguoiDungService;
    @Autowired
    private BoMonService boMonService;

    @GetMapping("")
    public String danhSachNguoiDung(Model model) {

        List<NguoiDung> nguoiDungs = nguoiDungService.danhSach();
        model.addAttribute("danhsachnguoidung", nguoiDungs);
        return "nguoidung/danhsach";
    }

    @GetMapping("/themmoi")
    public String themMoiNguoiDung(Model model) {
        if (!model.containsAttribute("nguoidung")) {
            model.addAttribute("nguoidung", new NguoiDung());
        }
        List<Khoa> danhSachKhoa = nguoiDungService.danhSachKhoa();

        model.addAttribute("danhSachKhoa", danhSachKhoa);
        model.addAttribute("danhSachBoMon", boMonService.danhSach());
        return "nguoidung/themmoi";
    }

    @GetMapping("/bomon/{khoaId}")
    @ResponseBody
    public List<BoMon> getBoMonByKhoa(@PathVariable Integer khoaId) {
        System.out.println(nguoiDungService.danhSachBoMonByKhoa(khoaId));
        return nguoiDungService.danhSachBoMonByKhoa(khoaId);
    }

//    ---------------------------
    @PostMapping("/luu")
    public String luuNguoiDung(@Valid @ModelAttribute("nguoidung") NguoiDung nguoiDung, BindingResult bindingResult,
                               RedirectAttributes red){
        if (bindingResult.hasErrors()) {
           if (bindingResult.hasFieldErrors("maNguoiDung")){
                red.addFlashAttribute("maNguoiDungError", bindingResult.getFieldError("maNguoiDung").getDefaultMessage());
            }
            if (bindingResult.hasFieldErrors("hoVaTen")){
                red.addFlashAttribute("hoVaTenError", bindingResult.getFieldError("hoVaTen").getDefaultMessage());
            }
            if (bindingResult.hasFieldErrors("email")){
                red.addFlashAttribute("emailError", bindingResult.getFieldError("email").getDefaultMessage());
            }
            if (bindingResult.hasFieldErrors("matKhau")){
                red.addFlashAttribute("matKhauError", bindingResult.getFieldError("matKhau").getDefaultMessage());
            }
        } else {
            try {
                nguoiDungService.luu(nguoiDung);
                red.addFlashAttribute("message1", "Thêm mới bộ môn thành công");
                return "redirect:/nguoidung";
            } catch (DuplicateKeyException e) {
                red.addFlashAttribute("loi", e.getMessage());
            } catch (Exception e) {
                red.addFlashAttribute("loi", "Đã xảy ra lỗi gì đó hãy kiểm tra lại các thông tin ");
            }
        }
        red.addFlashAttribute("nguoidung", nguoiDung);
        return "redirect:/nguoidung/themmoi";
    }

    @GetMapping("sua/{id}")
    public String sua(@PathVariable("id") Integer id, Model model , RedirectAttributes red){
        try {

            NguoiDung nguoiDung = nguoiDungService.get(id);
            List<Khoa> danhSachKhoa = nguoiDungService.danhSachKhoa();
            model.addAttribute("nguoidung", nguoiDung);
            model.addAttribute("danhSachKhoa", danhSachKhoa);
            model.addAttribute("page", "Chỉnh sửa thông tin có (Id:"+ id +")");

            return "nguoidung/themmoi";
        } catch (NguoiDungNotFoundException e) {
            red.addFlashAttribute("message",e.getMessage());
            return "redirect:/nguoidung";
        }

    }
    @GetMapping("/xoa/{id}")
    public String xoa(@PathVariable("id") Integer id, RedirectAttributes red) {
        try {
            boMonService.delete(id);
            red.addFlashAttribute("message1", "Xoá id:" + id + " thành công");
        } catch (BoMonNotFoundException e) {
            red.addFlashAttribute("message", e.getMessage());
        }
        return "redirect:/nguoidung";
    }
}
