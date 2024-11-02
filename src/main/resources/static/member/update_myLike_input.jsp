<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@page import="com.tha103.newview.mylike.service.*"%>
<%@page import="com.tha103.newview.mylike.model.*"%>

<% 
MyLikeVO myLikeVO = (MyLikeVO) request.getAttribute("myLikeVO");
%>