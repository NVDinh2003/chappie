package com.chappie.model;

import java.text.NumberFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
//extends AbstractModel<Phone> 
public class Phone {

	private Long id;
	private String maHangSX;
	private String tenDT;
	private Long donGia;
	private Integer RAM;
	private String dungLuong;
	private String image1;
	private String image2;
	private String chiTiet;
	private String s_image;

//	private List<Phone> listResult = new ArrayList<>();
//	private Integer page;
//	private Integer maxPageItem;
//	private Integer totalPage;
//	private Integer totalItem;

	public String getDonGiaFormat() {
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMinimumIntegerDigits(0);
		return nf.format(this.donGia) + " VNĐ";
	}

}
