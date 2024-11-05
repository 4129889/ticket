//package com.tha103.newview.user.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.security.MessageDigest;
//import java.security.NoSuchAlgorithmException;
//import java.util.HashMap;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.google.gson.Gson;
//import com.tha103.newview.user.service.UserService;
//import com.tha103.newview.user.service.UserServiceImpl;
//
//@WebServlet("/SignIn")
//public class SignInController2 extends HttpServlet {
//
//	@Override
//	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		doPost(req, res);
//	}
//
//	@Override
//	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
//		res.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = res.getWriter();
//		Gson gson = new Gson();
//		HashMap<String, String> data = new HashMap<>();
//
////		測試 url 連線是否正確
//
//		/*************************** 1.接收請求參數 **********************/
//		// 取得 json 物件資料
//		String account = req.getParameter("account");
//		String password = req.getParameter("password");
//
//		// 加密接收到的密碼 -> 使用 MD5 加密
//		try {
//			// 創建 MD5 實體
//			MessageDigest md = MessageDigest.getInstance("MD5");
//
//			// 轉換原始密碼
//			byte[] bytes = md.digest(password.getBytes());
//
//			// 將 byte[] 轉為 16 進制 String
//			StringBuilder sb = new StringBuilder();
//			for (byte b : bytes) {
//				sb.append(String.format("%02x", b));
//			}
//
//			// MD5 加密後的 Password
//			password = sb.toString();
//
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		}
//
//		System.out.println("account: " + account);
//		System.out.println("password: " + password);
//
//		/*************************** 2.開始查詢資料 **********************/
//		UserService userSvc = new UserServiceImpl();
//
//		if (userSvc.getUserByAccount(account) == null) {
//			data.put("status", "accFailed");
//			System.out.println(data);
//			String json = gson.toJson(data);
//			out.write(json);
//			return;
//		}
//		if (!userSvc.getUserByAccount(account).getUserPassword().equals(password)) {
//			data.put("status", "pswFailed");
//			System.out.println(data);
//			String json = gson.toJson(data);
//			out.write(json);
//			return;
//		}
//		
//		System.out.println("帳號密碼比對成功！");
//		System.out.println("歡迎: " + account + "登入！");
//
//		HttpSession session = req.getSession();
//		session.setAttribute("account", account);
//		System.out.println("account_Attribute紀錄");
//		
//		// 將 userID 放入 session attribute
//		String userID = userSvc.getUserByAccount(account).getUserID().toString();
//		session.setAttribute("userID", userID);
//
//		data.put("status", "success");
//		data.put("userID", userID);
//		data.put("account", account);
//
//		/*************************** 3.查看有無來源網頁 ******************/
//		String location = (String) session.getAttribute("location");
//		session.removeAttribute("location");
//		String redirectPath = location != null ? location : req.getContextPath() + "/home-03.html";
//		data.put("location", redirectPath);
//		String json = gson.toJson(data);
//		out.write(json);
//	}
//}
