package fa.training.service;

import java.time.LocalDate;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fa.training.entities.SuDungDichVu;
import fa.training.page.PageAble;
import fa.training.repository.SuDungDichVuRepository;

@Service
@Transactional
public class SuDungDichVuService {

@Autowired
	
	SuDungDichVuRepository suDungDichVuRepository ;
	
	public void save(SuDungDichVu suDungDichVu) {
		suDungDichVuRepository.save(suDungDichVu);
	}
	public void saveOrUpdate(SuDungDichVu suDungDichVu) {
		suDungDichVuRepository.saveOrUpdate(suDungDichVu);
	}
	
	
	public List<SuDungDichVu> find() {
		List<SuDungDichVu> listSuDungDichVu = suDungDichVuRepository.find();
		return listSuDungDichVu ;
	}
	
	public List<Object[]> getDoanhThuTheoThang(int month, int year) {
		return suDungDichVuRepository.getDoanhThuTheoThang(month, year);
	}
	
	public List<Object[]> getDoanhThuTheoNam(int year) {
		return suDungDichVuRepository.getDoanhThuTheoNam(year);
	}
	
	/*
	 * Project: Cinema WebApp Team: 2 
	 * Author : Ducnm74 
	 * Method: Lấy tổng chi tiêu sử dụng dịch vụ của Khách hàng trong năm hiện tại
	 */
	public long getTotalTicketPaymentByCustomer(int maKhachHang) {
		return suDungDichVuRepository.getTotalTicketPaymentByCustomer(maKhachHang);
	}
	
	/*
	 * Ducnm74
	 * Project: Cinema WebApp Team: 2 Author : Ducnm74 Method: lấy số doanh thu dịch vụ
	 *  theo ngày
	 */
	public List<Object[]> getDoanhThuDichVuTheoNgay(LocalDate ngay) {
		return suDungDichVuRepository.getDoanhThuDichVuTheoNgay(ngay);
	}
	/**
	 * Project: Cinema WebApp 
	 * Team: 2 
	 * Author : ViTM 
	 * Fuciton : 
	 */
	public List<SuDungDichVu> findByIdKhachHang(int maKhachHang) {
		return suDungDichVuRepository.findByIdKhachHang(maKhachHang);
	}
	/**
	 * Project: Cinema WebApp 
	 * Team: 2 
	 * Author : ViTM 
	 * Fuciton : 
	 */
	public List<SuDungDichVu> findWithPageAble(PageAble pageAble) {
		return suDungDichVuRepository.findWithPageAble(pageAble);
	}
	/**
	 * Project: Cinema WebApp 
	 * Team: 2 
	 * Author : ViTM 
	 * Fuciton : 
	 */
	public int totalPages(PageAble pageAble) {
		long totalRecord = suDungDichVuRepository.count();
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	
	/**
	 * Project: Cinema WebApp 
	 * Team: 2 
	 * Author : ViTM 
	 * Fuciton : 
	 */
	public List<SuDungDichVu> findWithPageAble(PageAble pageAble,int maKhachHang) {
		return suDungDichVuRepository.findWithPageAble(pageAble, maKhachHang);
	}
	/**
	 * Project: Cinema WebApp 
	 * Team: 2 
	 * Author : ViTM 
	 * Fuciton : 
	 */
	public int totalPages(PageAble pageAble,int maKhachHang) {
		long totalRecord = suDungDichVuRepository.countSuDungDichVu(maKhachHang);
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	
	
	/**
	 * Project: Cinema WebApp 
	 * Team: 2 
	 * Author : ViTM 
	 * Fuciton : 
	 */
	public List<SuDungDichVu> findWithPageAbleall(PageAble pageAble,int maKhachHang) {
		return suDungDichVuRepository.findWithPageAble(pageAble, maKhachHang);
	}
	/**
	 * Project: Cinema WebApp 
	 * Team: 2 
	 * Author : ViTM 
	 * Fuciton : 
	 */
	public int totalPagesall(PageAble pageAble,int maKhachHang) {
		long totalRecord = suDungDichVuRepository.countSuDungDichVuall(maKhachHang);
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	/**
	 * Project: Cinema WebApp 
	 * Team: 2 
	 * Author : ViTM 
	 * Fuciton : 
	 */
	public List<SuDungDichVu> findKhachHang(int maKhachHang){
		return
		suDungDichVuRepository.findKhachHang(maKhachHang) ;
	}
}
