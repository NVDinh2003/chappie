package com.chappie.dao;

import java.util.List;

import com.chappie.mapper.PhoneMapper;
import com.chappie.model.Phone;
import com.chappie.paging.IPageble;

public class PhoneDAO extends AbstractDAO<Phone> {

	private static final PhoneMapper phoneMapper = new PhoneMapper();

	public List<Phone> findAll(IPageble pageble) {
		StringBuilder sql = new StringBuilder("select * from product ");

		if (pageble.getCondition() != null)
			sql.append(" where ").append(pageble.getCondition());
		if (pageble.getSorter() != null)
			sql.append(" order by ").append(pageble.getSorter().getSortName()).append(" ")
					.append(pageble.getSorter().getSortBy());
		if (pageble.getLimit() != null)
			sql.append(" LIMIT ").append(pageble.getLimit());
		if (pageble.getOffset() != null)
			sql.append(" OFFSET ").append(pageble.getOffset());
		return query(sql.toString(), phoneMapper);
	}

	public List<Phone> findAll() {
		StringBuilder sql = new StringBuilder("select * from product ");
		return query(sql.toString(), phoneMapper);
	}

	public int getTotalItem() {
		String sql = "SELECT count(*) FROM product";
		return count(sql);
	}

	public Phone findOneById(Long id) {
		String sql = "SELECT * FROM product where id = ?";
		List<Phone> listPhone = query(sql, phoneMapper, id);
		return listPhone.isEmpty() ? null : listPhone.get(0);
	}

	public List<Phone> searchProducts(String searchTerm, IPageble pageble) {
		StringBuilder sql = new StringBuilder("select * from product where ");
		sql.append("TenDT like '%").append(searchTerm).append("%' ");
		sql.append(" or ChiTiet like '%").append(searchTerm).append("%'");

		if (pageble.getLimit() != null)
			sql.append(" LIMIT ").append(pageble.getLimit());
		return query(sql.toString(), phoneMapper);
	}

	public Phone getPhoneByCartId(Long cartId) {
		String sql = "SELECT p.* FROM cart c join product p on c.product_id=p.id WHERE c.id = ?";
		List<Phone> listPhone = query(sql, phoneMapper, cartId);
		return listPhone.isEmpty() ? null : listPhone.get(0);
	}

	public void updatePhone(Phone phone) {
		String sql = "UPDATE product SET MaHangSX = ?, TenDT = ?, DonGia = ?, RAM = ?, DungLuong = ?, ChiTiet = ? WHERE (`id` = ?);";

		update(sql, phone.getMaHangSX(), phone.getTenDT(), phone.getDonGia(), phone.getRAM(), phone.getDungLuong(),
				phone.getChiTiet(), phone.getId());
	}

//	public void updatePhone(Phone phone) {
//		String sql = "UPDATE product SET MaHangSX = ?, TenDT = ?, DonGia = ?, RAM = ?, DungLuong = ?, image1 = ?, image2 = ?, ChiTiet = ? WHERE (`id` = ?);";
//
//		update(sql, phone.getMaHangSX(), phone.getTenDT(), phone.getDonGia(), phone.getRAM(), phone.getDungLuong(),
//				phone.getImage1(), phone.getImage2(), phone.getChiTiet(), phone.getId());
//	}

}
