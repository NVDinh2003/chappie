package com.chappie.controller.admin;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.chappie.model.Phone;
import com.chappie.service.CategoryService;
import com.chappie.service.PhoneService;
import com.chappie.utils.UploadFileUtils;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, maxFileSize = 1024 * 1024 * 50, maxRequestSize = 1024 * 1024
		* 100)
@WebServlet(name = "edit-phone", urlPatterns = { "/admin-home/phone" })
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Inject
	private PhoneService phoneService;

	@Inject
	private CategoryService categoryService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null && action.equals("edit-phone")) {
			Long id = Long.parseLong(request.getParameter("id"));
			request.setAttribute("model", phoneService.findOneById(id));
			request.setAttribute("categories", categoryService.findAll());

			String views = request.getContextPath() + "views/admin/edit.jsp";
			request.getRequestDispatcher(views).forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		updatePhone(request, response);
	}

	private void updatePhone(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Lấy thông tin từ request
		Long phoneId = Long.parseLong(request.getParameter("id"));
		String maHangSX = request.getParameter("maHangSX");
		String tenDT = request.getParameter("tenDT");
		Long donGia = Long.parseLong(request.getParameter("donGia"));
		Integer ram = Integer.parseInt(request.getParameter("ram"));
		String dungLuong = request.getParameter("dungLuong");
		String chiTiet = request.getParameter("content");

		// Xử lý cập nhật ảnh 1 và 2
		String fileName1 = UploadFileUtils.uploadFile(request, "fileImage1");
		String fileName2 = UploadFileUtils.uploadFile(request, "fileImage2");

		// Tạo đối tượng Phone và cập nhật thông tin
		Phone updatedPhone = phoneService.findOneById(phoneId);
		updatedPhone.setMaHangSX(maHangSX);
		updatedPhone.setTenDT(tenDT);
		updatedPhone.setDonGia(donGia);
		updatedPhone.setRAM(ram);
		updatedPhone.setDungLuong(dungLuong);
		updatedPhone.setChiTiet(chiTiet);
		updatedPhone.setImage1("images/products/" + fileName1);
		updatedPhone.setImage2("images/products/" + fileName2);

		// Gọi service để cập nhật thông tin điện thoại
		phoneService.update(updatedPhone);

		// Chuyển hướng hoặc hiển thị thông báo cập nhật thành công
		// ...

		// Ví dụ chuyển hướng về trang danh sách điện thoại
		response.sendRedirect(request.getContextPath() + "admin-home?action=view-products");
	}

	private String extractFileName(Part part) {
		String contentDisposition = part.getHeader("content-disposition");
		String[] items = contentDisposition.split(";");
		for (String item : items) {
			if (item.trim().startsWith("filename")) {
				return item.substring(item.indexOf("=") + 2, item.length() - 1);
			}
		}
		return "";
	}

}
