package fa.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fa.training.entities.KhuyenMai;
import fa.training.page.PageAble;
import fa.training.repository.KhuyenMaiRepository;

@Service
@Transactional
public class KhuyenMaiService {

	@Autowired
	KhuyenMaiRepository khuyenMaiRepository;
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng tìm kiếm tất cả
	 */
	public List<KhuyenMai> findAll() {
		return khuyenMaiRepository.findAll();
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng lưu khuyến mãi
	 */
	public void save(KhuyenMai x) {
		khuyenMaiRepository.save(x);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng cập nhật khuyến mãi
	 */
	public void saveOrUpdate(KhuyenMai x) {
		khuyenMaiRepository.saveOrUpdate(x);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng tìm kiếm theo ID
	 */
	public KhuyenMai findById(String Id) {
		return khuyenMaiRepository.findById(Id);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng xóa khuyến mãi
	 */
	public void delete(String maKhuyenMai) {
		KhuyenMai khuyenMai = findById(maKhuyenMai);
		if (khuyenMai != null) {
			khuyenMaiRepository.delete(khuyenMai);
		}
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng tìm kiếm khuyến mãi
	 */
	public List<KhuyenMai> search(String searchKey) {

		return khuyenMaiRepository.search(searchKey);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng dùng để tạo phân trang
	 */
	public List<KhuyenMai> findWithPageAble(PageAble pageAble) {
		return khuyenMaiRepository.findWithPageAble(pageAble);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng dùng để đếm tổng số khuyến mãi
	 */
	public int totalPages(PageAble pageAble) {
		long totalRecord = khuyenMaiRepository.count();
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng dùng để check trùng mã dịch vụ
	 */
	public KhuyenMai maKhuyenMai(String maKhuyenMai) {
		return khuyenMaiRepository.maKhuyenMai(maKhuyenMai);
	}
	
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP: Chức năng hiển thị top 3 khuyến mãi.
	 */
	public List<KhuyenMai> findTop3KhuyenMai() {
		return khuyenMaiRepository.findTop3KhuyenMai();
	} 
}
