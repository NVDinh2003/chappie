package com.chappie.controller.admin;

import java.io.IOException;
import java.util.List;
import java.util.ResourceBundle;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.chappie.model.Phone;
import com.chappie.model.User;
import com.chappie.paging.PageRequest;
import com.chappie.service.CategoryService;
import com.chappie.service.PhoneService;
import com.chappie.service.UserService;
import com.chappie.sort.Sorter;

@WebServlet(urlPatterns = { "/admin-home" })
public class HomeController extends HttpServlet {

	@Inject
	private PhoneService phoneService;

	@Inject
	private CategoryService categoryService;

	@Inject
	private UserService userService;

	private static final long serialVersionUID = 1L;

	ResourceBundle bundle = ResourceBundle.getBundle("message");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String views = "views/admin/home.jsp";
		String action = request.getParameter("action");

		if (action != null && action.equals("view-products")) {
			request.setAttribute("manuList", categoryService.findAll());
			request.setAttribute("check", 0);
//			request.setAttribute("model", phoneService
//					.setPhoneAttribute(new PageRequest(0, 99, new Sorter(" ID ", "ASC"), ""), phoneService));
			request.setAttribute("model", phoneService.findAll(new PageRequest(0, 99, new Sorter(" ID ", "ASC"), "")));
			views = "views/admin/table_views.jsp";

		} else if (action != null && action.equals("view-accounts")) {
			request.setAttribute("check", 1);
			List<User> list = userService.findAll();
			request.setAttribute("user", list);
			views = "views/admin/table_views.jsp";

		} else if (action != null && action.equals("edit-phone")) {
			Long id = Long.parseLong(request.getParameter("id"));
			request.setAttribute("model", phoneService.findOneById(id));
			request.setAttribute("categories", categoryService.findAll());

			String message = request.getParameter("message");
			String alert = request.getParameter("alert");
			if (message != null && alert != null) {
				request.setAttribute("message", bundle.getString(message));
				request.setAttribute("alert", alert);
			}

			views = "views/admin/edit.jsp";
		}
		request.getRequestDispatcher(views).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Lấy thông tin từ request
		System.out.println(request.getParameter("pid"));
		System.out.println(request.getParameter("tenDT"));
		Long phoneId = Long.parseLong(request.getParameter("pid"));
		String maHangSX = request.getParameter("maHangSX");
		String tenDT = request.getParameter("tenDT");
		Long donGia = Long.parseLong(request.getParameter("donGia"));
		Integer ram = Integer.parseInt(request.getParameter("ram"));
		String dungLuong = request.getParameter("dungLuong");
		String chiTiet = request.getParameter("content");

		// Xử lý cập nhật ảnh 1 và 2
//		String fileName1 = UploadFileUtils.uploadFile(request, "fileImage1");
//		String fileName2 = UploadFileUtils.uploadFile(request, "fileImage2");

		// Tạo đối tượng Phone và cập nhật thông tin
		Phone updatedPhone = new Phone();
		updatedPhone.setId(phoneId);
		updatedPhone.setMaHangSX(maHangSX);
		updatedPhone.setTenDT(tenDT);
		updatedPhone.setDonGia(donGia);
		updatedPhone.setRAM(ram);
		updatedPhone.setDungLuong(dungLuong);
		updatedPhone.setChiTiet(chiTiet);
//		updatedPhone.setImage1("images/products/" + fileName1);
//		updatedPhone.setImage2("images/products/" + fileName2);

		// Gọi service để cập nhật thông tin điện thoại
		phoneService.update(updatedPhone);
//		request.setAttribute("model", phoneService.findOneById(phoneId));
//		request.setAttribute("categories", categoryService.findAll());

		// Ví dụ chuyển hướng về trang danh sách điện thoại
		response.sendRedirect("admin-home?action=edit-phone&id=" + phoneId + "&message=update_success&alert=success");
	}

}