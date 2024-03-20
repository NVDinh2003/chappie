package com.chappie.service;

import java.util.List;

import javax.inject.Inject;

import com.chappie.dao.PhoneDAO;
import com.chappie.model.Phone;
import com.chappie.paging.IPageble;
import com.chappie.paging.PageRequest;
import com.chappie.sort.Sorter;

public class PhoneService {

	@Inject
	private PhoneDAO phoneDAO;

	private IPageble p;

	public List<Phone> findAll(IPageble pageble) {
		return phoneDAO.findAll(pageble);
	}

	public List<Phone> findAll() {
		return phoneDAO.findAll();
	}

	public List<Phone> findAllAndPagination(int index, int maxPageItem) {
		p = new PageRequest(index, maxPageItem, null, "");
		return phoneDAO.findAll(p);
	}

	public int getTotalItems() {
		return phoneDAO.getTotalItem();
	}

	public int countTotalItemsPagination(List<Phone> listPhone) {
//		if (listPhone.size() >= 9)
//			return getTotalItems();
		return listPhone.size();
	}

//	public Phone setPhoneAttribute(IPageble pageble, PhoneService phoneService) {
//		Phone phone = new Phone();
//		phone.setListResult(phoneService.findAll(pageble));
//
//		return phone;
//	}

	public List<Phone> findAllByCategory(String categoryId, int limit) {
		p = new PageRequest(0, limit, null, "MaHangSX='" + categoryId + "'");
		return phoneDAO.findAll(p);
	}

	public List<Phone> findAllByPrice(String price, int limit) {
		if (price.equals("2"))
			p = new PageRequest(0, limit, null, "DonGia<2000000");
		else if (price.equals("4"))
			p = new PageRequest(0, limit, null, "DonGia>2000000 and DonGia<4000000");
		else if (price.equals("7"))
			p = new PageRequest(0, limit, null, "DonGia>4000000 and DonGia<7000000");
		else if (price.equals("13"))
			p = new PageRequest(0, limit, null, "DonGia>7000000 and DonGia<13000000");
		else if (price.equals("20"))
			p = new PageRequest(0, limit, null, "DonGia>13000000 and DonGia<20000000");
		else
			p = new PageRequest(0, limit, null, "DonGia>20000000");
		return phoneDAO.findAll(p);
	}

	public List<Phone> findAllByRam(String ram, int limit) {
		p = new PageRequest(0, limit, null, "RAM=" + ram + "");
		return phoneDAO.findAll(p);
	}

	public List<Phone> findAllByDungLuong(String dungLuong, int limit) {
		p = new PageRequest(0, limit, null, "DungLuong='" + dungLuong + "'");
		return phoneDAO.findAll(p);
	}

	public List<Phone> findAllRandom(int limit) {
		p = new PageRequest(0, limit, new Sorter("RAND()", ""), "");
		return phoneDAO.findAll(p);
	}

	public Phone findOneById(long id) {
		return phoneDAO.findOneById(id);
	}

	public List<Phone> searchProducts(String searchTerm, int limit) {
		p = new PageRequest(0, limit, null, "");
		return phoneDAO.searchProducts(searchTerm, p);
	}

	public Phone getPhoneByCartId(Long cartId) {
		return phoneDAO.getPhoneByCartId(cartId);
	}

	public void update(Phone phone) {
		phoneDAO.updatePhone(phone);
	}

}
