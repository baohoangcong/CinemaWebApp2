package fa.training.service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import fa.training.entities.Phim;
import fa.training.entities.SuatChieu;
import fa.training.page.PageAble;
import fa.training.repository.PhimRepository;

@Service
@Transactional
public class PhimService {
	@Autowired
	private PhimRepository phimRepository;

	public List<Phim> findAll() {
		return phimRepository.findAll();
	}
	/**
	 * Select top 3 phim
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @return
	 */
	public List<Phim> findTop3() {
		List<Phim> listPhim = phimRepository.findTop3();
		return listPhim;
	}
	/**
	 * Select top 3 phim tiếp theo
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @return
	 */
	public List<Phim> findTop3Next() {
		List<Phim> listPhim = phimRepository.findTop3Next();
		return listPhim;
	}
	/**
	 * Select top 7 phim đang chiếu sau top3
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @return
	 */
	public List<Phim> findTop7() {
		List<Phim> listPhim = phimRepository.findTop7();
		return listPhim;
	}
	/**
	 * Select top 7 phim đang chiếu tiếp theo
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @return
	 */
	public List<Phim> findTop10Next() {
		List<Phim> listPhim = phimRepository.findTop10Next();
		return listPhim;
	}
	/**
	 * Select top 7 phim sắp chiếu
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @return
	 */
	public List<Phim> findTop10PhimSapChieu() {
		List<Phim> listPhim = phimRepository.findTop10PhimSapChieu();
		return listPhim;
	}
	/**
	 * Select top 7 phim hoạt hình
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @return
	 */
	public List<Phim> findTop10HoatHinh() {
		List<Phim> listPhim = phimRepository.findTop10HoatHinh();
		return listPhim;
	}
	/**
	 * Phân trang phim đang chiếu
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @param pageAble
	 * @return
	 */
	public List<Phim> findPhimDangChieu(PageAble pageAble) {
		List<Phim> listPhim = phimRepository.findPhimDangChieu(pageAble);
		return listPhim;
	}
	/**
	 * Phân trang phim sắp chiếu
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @param pageAble
	 * @return
	 */
	public List<Phim> findPhimSapChieu(PageAble pageAble) {
		List<Phim> listPhim = phimRepository.findPhimSapChieu(pageAble);
		return listPhim;
	}
	
	public Phim findById(String id) {
		return phimRepository.findById(id);
	}

	public void save(Phim phim) {
		phimRepository.save(phim);
	}

	public void update(Phim phim) {
		phimRepository.update(phim);
	}

	public void delete(String id) {
		phimRepository.delete(id);
	}
	/**
	 * Đếm số trang cần phân trang phim đang chiếu
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @param pageAble
	 * @return
	 */
	public int totalPagesPhimDangChieu(PageAble pageAble) {
		long totalRecord = phimRepository.countPhimDangChieu();
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	/**
	 * Đếm số trang cần phân trang phim sắp chiếu
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @param pageAble
	 * @return
	 */
	public int totalPagesPhimSapChieu(PageAble pageAble) {
		long totalRecord = phimRepository.countPhimSapChieu();
		return (int) Math.ceil((double) totalRecord / pageAble.getSize());
	}
	/**
	 * Tìm kiếm theo tên phim
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @param searchKey
	 * @return
	 */
	public List<Phim> searchTenPhim(String searchKey){
		return phimRepository.searchTenPhim(searchKey);
	}
	/**
	 * Tìm kiếm theo tên đạo diễn
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @param searchKey
	 * @return
	 */
	public List<Phim> searchDaoDien(String searchKey){
		return phimRepository.searchDaoDien(searchKey);
	}
	/**
	 * Tìm kiếm theo tên thể loại
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @param searchKey
	 * @return
	 */
	public List<Phim> searchTheLoai(String searchKey){
		return phimRepository.searchTheLoai(searchKey);
	}
	/**
	 * Tìm kiếm phim đang chiếu trong ngày
	 * Proeject: Cinema WebApp
	 * Team: 2
	 * Dang Ngoc Sinh
	 * 30/08/1998
	 * @param searchKey
	 * @return
	 */
	public List<SuatChieu> searchNgayChieu(LocalDate searchKey){
		return phimRepository.searchNgayChieu(searchKey);
	}
	
	/**
    * Tìm kiếm theo tên phim
    * Proeject: Cinema WebApp
    * Team: 2
    * Dang Ngoc Sinh
    * 30/08/1998
    * @param searchKey
    * @return
    */
   public List<Phim> searchTenPhimDangChieu(String searchKey, PageAble pageAble){
       return phimRepository.searchTenPhimDangChieu(searchKey,pageAble);
   }
   /**
    * Đếm số trang cần phân trang phim đang chiếu
    * Proeject: Cinema WebApp
    * Team: 2
    * Dang Ngoc Sinh
    * 30/08/1998
    * @param pageAble
    * @return
    */
   public int totalPagesPhimDangChieuTheoTen(String searchKey,PageAble pageAble) {
       long totalRecord = phimRepository.countPhimTheoTen(searchKey);
       return (int) Math.ceil((double) totalRecord / pageAble.getSize());
   }
   /**
    * Tìm kiếm theo tên phim
    * Proeject: Cinema WebApp
    * Team: 2
    * Dang Ngoc Sinh
    * 30/08/1998
    * @param searchKey
    * @return
    */
   public List<Phim> searchTenPhimSapChieu(String searchKey,PageAble pageAble){
       return phimRepository.searchTenPhimSapChieu(searchKey,pageAble);
   }
   /**
    * Đếm số trang cần phân trang phim sắp chiếu
    * Proeject: Cinema WebApp
    * Team: 2
    * Dang Ngoc Sinh
    * 30/08/1998
    * @param pageAble
    * @return
    */
   public int totalPagesPhimSapChieuTheoTen(String searchKey,PageAble pageAble) {
       long totalRecord = phimRepository.countPhimSapChieuTheoTen(searchKey);
       return (int) Math.ceil((double) totalRecord / pageAble.getSize());
   }
	
	/*
	 * Project: Cinema WebApp
	 * Team: 2
	 * Author : Ducnm74
	 * Method: Lấy doanh thu theo danh sách phim
	 */
	public List<Object[]> getDoanhThu(){
		return phimRepository.getDoanhThu();
	}
}
