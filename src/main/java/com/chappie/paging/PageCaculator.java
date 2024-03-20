package com.chappie.paging;

import java.util.ArrayList;
import java.util.List;

import com.chappie.model.Phone;

import lombok.Data;

@Data
public class PageCaculator<T> {
//	private Integer page;
	private List<Phone> listResult = new ArrayList<>();
	private Integer maxPageItem;
	private Integer totalPage;
	private Integer totalItem;

}
