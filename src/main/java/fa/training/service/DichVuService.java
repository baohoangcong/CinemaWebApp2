package fa.training.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fa.training.entities.DichVu;
import fa.training.page.PageAble;
import fa.training.repository.DichVuRepository;

@Service
@Transactional
public class DichVuService {

	@Autowired
	DichVuRepository dichVuRepository;

	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng tìm kiếm tất cả
	 */
	public List<DichVu> findAll() {
		return dichVuRepository.findAll();
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng lưu dịch vụ
	 */
	public void save(DichVu x) {
		dichVuRepository.save(x);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng cập nhật dịch vụ
	 */
	public void saveOrUpdate(DichVu x) {
		dichVuRepository.saveOrUpdate(x);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng tìm kiếm theo ID
	 */
	public DichVu findById(String Id) {
		return dichVuRepository.findById(Id);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng xóa dịch vụ
	 */
	public void delete(String maDichVu) {
		DichVu dichVu = findById(maDichVu);
		if (dichVu != null) {
			dichVuRepository.delete(dichVu);
		}
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng tìm kiếm dịch vụ
	 */
	public List<DichVu> search(String searchKey) {

		return dichVuRepository.search(searchKey);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng dùng để tạo phân trang
	 */
	public List<DichVu> findWithPageAble(PageAble pageAble) {
		return dichVuRepository.findWithPageAble(pageAble);
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng dùng để đếm tổng số dịch vụ
	 */
	public int totalPages(PageAble pageAble) {
		long totalRecord = dichVuRepository.count();
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	/**
	 * 
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : ThanhDD
	 * Function/Class/JSP : Chức năng dùng để check trùng mã dịch vụ
	 */
	public DichVu maDichVu(String maDichVu) {
		return dichVuRepository.maDichVu(maDichVu);
	}
}
