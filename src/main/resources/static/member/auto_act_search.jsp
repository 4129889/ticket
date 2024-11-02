<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*"%>
<%@ page import="com.tha103.newview.act.model.*"%>
<%@ page import="com.tha103.newview.act.service.*"%>
<%@ page import="com.tha103.newview.actcategory.model.*"%>
<%@ page import="com.tha103.newview.cityaddress.model.*"%>
<%@ page import="com.tha103.newview.publisher.model.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>查詢到的活動</title>
</head>
<body>
    <h1>查詢到的活動</h1>
    <c:if test="${not empty actWithPicsList}">
        <table>
            <tr>
                <th>活動名稱</th>
                <th>價格</th>
               
            </tr>
           <c:forEach items="${actWithPicsList}" var="actWithPics">
                <tr>
                    <td>${actWithPics.actName}</td>
                    <td>${actWithPics.actPrice}</td>
                    <td>${actWithPics.actCategoryName}</td>
                    <td>${actWithPics.pubName}</td>
                    <td>${actWithPics.time}</td>
                    <td>${actWithPics.cityAddress}</td>
                    <td>${actWithPics.actScope}</td>
                    <td>${actWithPics.actIntroduce}</td>
                    <td>${actWithPics.actDate}</td>
                    <td>${actWithPics.approvalCondition}</td>
                   <td>
    <c:forEach items="${actWithPics.base64Images}" var="base64Image">
        <img src="data:image/gif;base64,${base64Image}" alt="" />
    </c:forEach>
</td>
                    
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty actWithPicsList}">
        <p>未找到相關活動。</p>
    </c:if>
</body>
</html>
