//package com.chappie.controller.web;
//
//import java.io.IOException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.chappie.utils.SendMail;
//
//@WebServlet("/send-mail")
//public class SendMailServlet extends HttpServlet {
//
//	private static final long serialVersionUID = 1L;
//
//	@Override
//	protected void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//
//	}
//
//	@SuppressWarnings("static-access")
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		String name = (String) request.getParameter("name");
//		String email = (String) request.getParameter("email");
//		String message = (String) request.getParameter("message");
//		String pId = request.getParameter("pId");
//
//		SendMail sm = new SendMail();
////		sm.sendMail(email, "Xin chào tôi là :" + name, message);
//
//		response.sendRedirect("chi-tiet?id=" + pId + "&message=send_mail_success&alert=success");
//
//	}
//
//}
