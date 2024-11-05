//package com.tha103.newview.user.controller;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Date;
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
//import com.tha103.newview.user.model.UserVO;
//import com.tha103.newview.user.service.UserService;
//import com.tha103.newview.user.service.UserServiceImpl;
//
//@WebServlet("/UpdateUserInfo")
//public class UpdateUserInfoController extends HttpServlet {
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
//		HashMap<String, String> data = new HashMap<>();
//		HttpSession session = req.getSession();
//		Gson gson = new Gson();
//		String json = null;
//
//		// 從 session 取出 userID (已套用濾器 -> session 中有存放 userID)
//		String userID = (String) session.getAttribute("userID");
//		System.out.println(userID);
//		
////		// 驗證前端傳遞參數
////		// 1. 用戶姓名
////		String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}";
////		if(req.getParameter("name").trim() == null) {
////			data.put("error", "名字不得為空");
////			json = gson.toJson(data);
////			out.write(json);
////			return;
////		}else if(!(req.getParameter("name").matches(nameReg))) {
////			data.put("error", "請輸入正確的中、英文姓名格式，長度需介於2-10個字元");
////			json = gson.toJson(data);
////			out.write(json);
////			return;
////		}
////		
////		// 2. 用戶暱稱
////		String nicknameReg = "^[(\u4e00-\u9fa5)(a-zA-Z)]{2,10}";
////		if(req.getParameter("nickname").trim()==null) {
////			data.put("error", "暱稱不得為空");
////			json = gson.toJson(data);
////			out.write(json);
////			return;
////		}else if((!req.getParameter("nickname").matches(nicknameReg))) {
////			data.put("error", "請輸入正確的中、英文暱稱格式，長度需介於2-10個字元");
////			json = gson.toJson(data);
////			out.write(json);
////			return;
////		}
////		
////		// 3. 信箱
////		if(req.getParameter("email").trim() == null) {
////			data.put("error", "信箱不得為空");
////			json = gson.toJson(data);
////			out.write(json);
////			return;
////		} else if (!(req.getParameter("email").contains("@"))) {
////			data.put("error", "請輸入正確的信箱格式 例: test@test.com");
////			json = gson.toJson(data);
////			out.write(json);
////			return;
////		}
////		
////		// 4. 電話
////		String cellReg = "09\\d{8}";
////		if(req.getParameter("cellphone").trim() == null) {
////			data.put("error", "電話不得為空");
////			json = gson.toJson(data);
////			out.write(json);
////			return;
////		} else if (!(req.getParameter("cellphone").matches(cellReg))) {
////			data.put("error", "請輸入正確的電話格式 例: 09xxxxxxxx");
////			json = gson.toJson(data);
////			out.write(json);
////			return;
////		}
//		
//		// 取得資料庫資料
//		UserService userSvc = new UserServiceImpl();
//
//		// 開始修改資料庫資料
//		UserVO user = new UserVO();
//		user.setUserID(Integer.valueOf(userID));
//		user.setUserName(req.getParameter("name"));
//		user.setUserBirth(Date.valueOf(req.getParameter("birthdate")));
//		user.setUserCell(req.getParameter("cellphone"));
//		user.setUserEmail(req.getParameter("email"));
//		user.setUserNickname(req.getParameter("nickname"));
//		
//		/******************************************* 不修改區塊 *******************************************/
//		// 帳號
//		user.setUserAccount((userSvc.getUserByPK(Integer.valueOf(userID)).getUserAccount()));
//		// 密碼
//		user.setUserPassword((userSvc.getUserByPK(Integer.valueOf(userID)).getUserPassword()));
//		// 權限
//		user.setBuyAuthority((userSvc.getUserByPK(Integer.valueOf(userID)).getBuyAuthority()));
//		user.setSpeakAuthority((userSvc.getUserByPK(Integer.valueOf(userID)).getSpeakAuthority()));
//		/******************************************* 不修改區塊 *******************************************/
//
//		// 開始 update，取得回傳值 (-1為失敗)
//		int updateStatus = userSvc.updateUser(user);
//
//		// 回傳 status 參數 (-1 為更新失敗)
//		String status = updateStatus == -1 ? "failed" : "success";
//		data.put("status", status);
//		json = gson.toJson(data);
//		out.write(json);
//	}
//}
