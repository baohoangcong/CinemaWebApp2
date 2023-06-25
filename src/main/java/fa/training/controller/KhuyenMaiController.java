package fa.training.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import fa.training.entities.KhuyenMai;
import fa.training.page.PageAble;
import fa.training.service.KhuyenMaiService;

@Controller
@RequestMapping("/admin/khuyenmai")
public class KhuyenMaiController {

	@Autowired
	KhuyenMaiService khuyenMaiService;
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chuyển hướng url tới trang Thêm khuyến mãi
	 */
	@GetMapping("/them")
	public String themDichVu(Model model) {
		model.addAttribute("khuyenmai", new KhuyenMai());
		return "/khuyenmai/khuyenmaiadd";
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Thêm dữ liệu vào Database
	 */
	// Thêm dữ liệu vào database
	@PostMapping(value = "/luu")
	public String save(@ModelAttribute("khuyenmai") @Valid KhuyenMai khuyenMai, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "/khuyenmai/khuyenmaiadd";
		}
		if (khuyenMai.getNgayBatDau().isAfter(khuyenMai.getNgayKetThuc())) {
			model.addAttribute("ngayBatDauError", "Ngày bắt đầu khuyến mãi phải bé hơn ngày kết thúc khuyến mãi!");
			model.addAttribute("ngayKetThucError", "Ngày kết thúc khuyến mãi phải lớn hơn ngày bắt đầu khuyến mãi!");
			return "/khuyenmai/khuyenmaiadd";
		}
		String checkMaDichVu = khuyenMai.getMaKhuyenMai();
		KhuyenMai checkKhuyenMai = khuyenMaiService.maKhuyenMai(checkMaDichVu);
		if (checkKhuyenMai == null) {
			khuyenMaiService.save(khuyenMai);
			model.addAttribute("khuyenmais", khuyenMaiService.findAll());
			return "redirect:/admin/khuyenmai/list";
		} else {
			model.addAttribute("maKhuyenMaiError", "Đã tồn tại mã khuyến mãi trong hệ thống");
			return "/khuyenmai/khuyenmaiadd";
		}
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chuyển hướng url tới trang Danh sách khuyến mãi
	 */
	@GetMapping("/list")
	public String getAllmayWithPageAble(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<KhuyenMai> khuyenmais = khuyenMaiService.findWithPageAble(pageAble);
		model.addAttribute("khuyenmais", khuyenmais);
		model.addAttribute("totalPages", khuyenMaiService.totalPages(pageAble));
		model.addAttribute("currentPage", page);
		return "/khuyenmai/khuyenmailist";
	}

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : chuyển hướng url tới trang cập nhật khuyến mãi
	 */
	@GetMapping("/capnhat/{maKhuyenMai}")
	public String doGetXeUpdate(Model model, @PathVariable("maKhuyenMai") String id) {
		model.addAttribute("KhuyenMaiForm", khuyenMaiService.findById(id));
		return "/khuyenmai/khuyenmaiupdate";

	}

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : chuyển hướng tới Hàm lưu lại thông tin cập nhật sau khi cập nhật lại dữ liệu
	 */
	@PostMapping(value = "/luukhuyenmaicapnhat")
	public String update(@ModelAttribute("KhuyenMaiForm") @Valid KhuyenMai khuyenMai, BindingResult result,
			Model model) {

		if (result.hasErrors()) {
			return "/khuyenmai/khuyenmaiupdate";
		}
		if (khuyenMai.getNgayBatDau().isAfter(khuyenMai.getNgayKetThuc())) {
			model.addAttribute("ngayBatDauError", "Ngày bắt đầu khuyến mãi phải bé hơn ngày kết thúc khuyến mãi!");
			model.addAttribute("ngayKetThucError", "Ngày kết thúc khuyến mãi phải lớn hơn ngày bắt đầu khuyến mãi!");
			return "/khuyenmai/khuyenmaiupdate";
		}

		khuyenMaiService.saveOrUpdate(khuyenMai);
		model.addAttribute("khuyenmais", khuyenMaiService.findAll());
		model.addAttribute("update", "Đã cập nhật thành công");
		return "/khuyenmai/khuyenmailist";
	}

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chuyển hướng url qua Hàm tìm kiếm
	 */
	@GetMapping("/timkiem")
	public String doGetXeSearch(Model model, @RequestParam("keySearch") String keySearch) {
		model.addAttribute("khuyenmais", khuyenMaiService.search(keySearch));
		if (khuyenMaiService.search(keySearch).size() == 0) {
			model.addAttribute("message", "Không có kết quả nào được tìm kiếm!");
		}
		return "/khuyenmai/khuyenmailist";

	}

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : chuyển hướng tới hàm Xóa dịch vụ
	 */
	@GetMapping("/delete/{maKhuyenMai}")
	public String delete(@PathVariable(name = "maKhuyenMai") String maKhuyenMai, Model model) {
		khuyenMaiService.delete(maKhuyenMai);
		model.addAttribute("dichvus", khuyenMaiService.findAll());
		return "redirect:/admin/khuyenmai/list";
	}
	
	public String getTop3KhuyenMai( Model model) {
		List<KhuyenMai> top3KM = khuyenMaiService.findTop3KhuyenMai();
		model.addAttribute("top3KM", top3KM);
		return "trangchu";
	}
}
