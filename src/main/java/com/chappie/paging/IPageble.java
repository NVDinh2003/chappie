package com.chappie.paging;

import com.chappie.sort.Sorter;

public interface IPageble {
	// là get ra bao nhiêu phần tử đó ( bắt đầu từ vị trí offset)
	public Integer getLimit();

	// là vị trí get DL, bắt đầu từ 0 (giống mảng)
	public Integer getOffset();

	public Sorter getSorter();

	public String getCondition();

	Integer getPage();
}
