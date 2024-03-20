package com.chappie.paging;

import com.chappie.sort.Sorter;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
public class PageRequest implements IPageble {
	Integer page;
	Integer maxPageItem;
	private Sorter sorter;
	String condition;

	@Override
	public Integer getPage() {
		return this.page;
	}

	@Override // là get ra bao nhiêu phần tử đó ( bắt đầu từ vị trí offset)
	public Integer getLimit() {
		if (this.maxPageItem != null)
			return this.maxPageItem;
		return null;
	}

	@Override // là vị trí get DL, bắt đầu từ 0 (giống mảng)
	public Integer getOffset() {
		if (this.page == null)
			return null;
		if (this.page == 0)
			return 0;
		if (this.page != null && this.maxPageItem != null)
			return (this.page - 1) * this.maxPageItem;
		return null;
	}

	@Override
	public Sorter getSorter() {
		if (this.sorter != null)
			return this.sorter;
		return null;
	}

	@Override
	public String getCondition() {
		if (this.condition != null && !this.condition.equals(""))
			return this.condition;
		return null;
	}
}
