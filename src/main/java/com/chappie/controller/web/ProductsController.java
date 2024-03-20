package com.chappie.controller.web;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chappie.model.Cart;
import com.chappie.model.Phone;
import com.chappie.model.User;
import com.chappie.service.CartService;
import com.chappie.service.CategoryService;
import com.chappie.service.PhoneService;

@WebServlet("/products")
public class ProductsController extends HttpServlet {

	@Inject
	private PhoneService phoneService;

	@Inject
	private CategoryService categoryService;

	@Inject
	private CartService cartService;

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("USERMODEL");
		if (user != null) {
			Long userId = user.getId();
			// Lấy danh sách sản phẩm trong giỏ hàng
			List<Cart> cartItems = cartService.getCartItemsByUserId(userId);
			request.setAttribute("cartItems", cartItems);
		}

		String hangDT = request.getParameter("dien-thoai");
		String donGia = request.getParameter("gia");
		String ram = request.getParameter("ram");
		String dungLuong = request.getParameter("dung-luong");
		String searchTerm = request.getParameter("search");

		// phân trang
		String indexPage = request.getParameter("index");
		if (indexPage == null)
			indexPage = "1";
		int index = Integer.parseInt(indexPage);
		int totalPage = 0;
		request.setAttribute("page", index);
		// end phân trang

		if (hangDT != null) {
			totalPage = setFilterListPhone(request, phoneService.findAllByCategory(hangDT, 9),
					phoneService.findAllByCategory(hangDT, 50));
		} else if (donGia != null) {
			totalPage = setFilterListPhone(request, phoneService.findAllByPrice(donGia, 9),
					phoneService.findAllByPrice(donGia, 50));
		} else if (ram != null) {
			totalPage = setFilterListPhone(request, phoneService.findAllByRam(ram, 9),
					phoneService.findAllByRam(ram, 50));
		} else if (dungLuong != null) {
			totalPage = setFilterListPhone(request, phoneService.findAllByDungLuong(dungLuong, 9),
					phoneService.findAllByDungLuong(dungLuong, 50));
		} else if (searchTerm != null && !searchTerm.isEmpty()) {
			// có nhập search term
			totalPage = setFilterListPhone(request, phoneService.searchProducts(searchTerm, 9),
					phoneService.searchProducts(searchTerm, 50));
		} else {
			totalPage = setFilterListPhone(request, phoneService.findAllAndPagination(index, 9),
					phoneService.findAll());
		}

		request.setAttribute("totalPage", totalPage);
		request.setAttribute("categoryList", categoryService.findAll());

		request.getRequestDispatcher("views/web/products.jsp").forward(request, response);
	}

	protected int setFilterListPhone(HttpServletRequest request, List<Phone> listPhoneResult, List<Phone> allPhones) {
		int maxPageItem = 9;
		request.setAttribute("allProducts", listPhoneResult);
		return (int) Math.ceil((double) phoneService.countTotalItemsPagination(allPhones) / maxPageItem);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		Phone phone = new Phone();
//		phone.setMaxPageItem(9);
//		IPageble pageble = new PageRequest(index, phone.getMaxPageItem(), null, "");
//		phone.setListResult(phoneService.findAll(pageble));
//		phone.setTotalItem(phoneService.getTotalItems());
//		phone.setTotalPage((int) Math.ceil((double) phone.getTotalItem() / phone.getMaxPageItem()));

//		List<Phone> allProducts = phoneService.findAllAndPagination(index, maxPageItem);
//		request.setAttribute("allProducts", allProducts);
//		totalPage = (int) Math.ceil((double) phoneService.getTotalItems() / maxPageItem);
	}

}
