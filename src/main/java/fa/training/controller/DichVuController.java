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

import fa.training.entities.DichVu;
import fa.training.page.PageAble;
import fa.training.service.DichVuService;

@Controller
@RequestMapping("/admin/dichvu")
public class DichVuController {

	@Autowired
	DichVuService dichVuService;

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chuyển hướng url tới trang Thêm dịch vụ
	 */
	@GetMapping("/them")
	public String themDichVu(Model model) {
		model.addAttribute("dichvu", new DichVu());
		return "/dichvu/dichvuadd";
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
	public String save(@ModelAttribute("dichvu") @Valid DichVu dichVu, BindingResult result, Model model) {

		if (result.hasErrors()) {
			return "/dichvu/dichvuadd";
		}

		String checkMaDichVu = dichVu.getMaDichVu();
		DichVu checkDichVu = dichVuService.maDichVu(checkMaDichVu);
		if (checkDichVu == null) {
			dichVuService.save(dichVu);
			model.addAttribute("dichvus", dichVuService.findAll());
			return "redirect:/admin/dichvu/list";
		} else {
			model.addAttribute("maDichVuError", "Đã tồn tại mã dịch vụ trong hệ thống");
			return "/dichvu/dichvuadd";
		}

	}

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chuyển hướng url tới trang Danh sách dịch vụ
	 */
	@GetMapping("/list")
	public String getAllmayWithPageAble(Model model, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		List<DichVu> dichvus = dichVuService.findWithPageAble(pageAble);
		model.addAttribute("dichvus", dichvus);
		model.addAttribute("totalPages", dichVuService.totalPages(pageAble));
		model.addAttribute("currentPage", page);

		return "/dichvu/dichvulist";
	}

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : chuyển hướng url tới trang cập nhật dịch vụ
	 */
	@GetMapping("/capnhat/{maDichVu}")
	public String doGetXeUpdate(Model model, @PathVariable("maDichVu") String id) {
		model.addAttribute("DichVuForm", dichVuService.findById(id));
		return "/dichvu/dichvuupdate";

	}

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : chuyển hướng tới Hàm lưu lại thông tin cập nhật sau khi cập nhật lại dữ liệu
	 */
	@PostMapping(value = "/luudichvucapnhat")
	public String update(@ModelAttribute("DichVuForm") @Valid DichVu dichVu,BindingResult result, Model model) {
		
		if (result.hasErrors()) {
			return "/admin/dichvu/dichvuupdate";
		}
		dichVuService.saveOrUpdate(dichVu);
		model.addAttribute("dichvus", dichVuService.findAll());
		model.addAttribute("update", "Đã cập nhật thành công");
		return "/dichvu/dichvulist";
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
		model.addAttribute("dichvus", dichVuService.search(keySearch));
		if (dichVuService.search(keySearch).size() == 0) {
			model.addAttribute("message", "Không có kết quả nào được tìm kiếm!");
		}
		return "/dichvu/dichvulist";

	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : chuyển hướng tới hàm Xóa dịch vụ
	 */
	@GetMapping("/delete/{maDichVu}")
	public String delete(@PathVariable(name = "maDichVu") String maDichVu, Model model) {
		dichVuService.delete(maDichVu);
		model.addAttribute("dichvus", dichVuService.findAll());
		return "redirect:/admin/dichvu/list";
	}

}
