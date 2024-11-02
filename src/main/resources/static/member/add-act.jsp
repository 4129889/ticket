<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.SimpleDateFormat"%>
<%@ page import="com.tha103.newview.act.model.*, com.tha103.newview.act.service.*, com.tha103.newview.actcategory.model.*,com.tha103.newview.cityaddress.model.*"%>
<%@ page import="com.tha103.newview.publisher.model.*" %>
<%

request.setCharacterEncoding("UTF-8");


String actName = (request.getParameter("actName") != null && !request.getParameter("actName").isEmpty()) ? request.getParameter("actName") : "Default Act Name";
String actPriceStr = (request.getParameter("actPrice") != null && !request.getParameter("actPrice").isEmpty()) ? request.getParameter("actPrice") : "1000";
String actCategoryIDStr = (request.getParameter("actCategory") != null && !request.getParameter("actCategory").isEmpty()) ? request.getParameter("actCategory") : "1";
String publisherName = (request.getParameter("publisher") != null && !request.getParameter("publisher").isEmpty()) ? request.getParameter("publisher") : "1";
String actTimeStr = (request.getParameter("time") != null && !request.getParameter("time").isEmpty()) ? request.getParameter("time") : "12:00:00";
String cityIDStr = (request.getParameter("cityName") != null && !request.getParameter("cityName").isEmpty()) ? request.getParameter("cityName") : "1";
String actIntroduce = (request.getParameter("actIntroduce") != null && !request.getParameter("actIntroduce").isEmpty()) ? request.getParameter("actIntroduce") : "未輸入";
String actDateStr = (request.getParameter("actDate") != null && !request.getParameter("actDate").isEmpty()) ? request.getParameter("actDate") : "1970-01-01";
String actTimeDate = (request.getParameter("actTime") != null && !request.getParameter("actTime").isEmpty()) ? request.getParameter("actTime") : "1970-01-01";
String approvalCondition = (request.getParameter("approvalCondition") != null && !request.getParameter("approvalCondition").isEmpty()) ? request.getParameter("approvalCondition") : "false";
String actContent = (request.getParameter("actContent") != null && !request.getParameter("actContent").isEmpty()) ? request.getParameter("actContent") : "Default Act Content";
String actScope = (request.getParameter("actScope") != null && !request.getParameter("actScope").isEmpty()) ? request.getParameter("actScope") : "1";
String actActAddress = (request.getParameter("actActAddress") != null && !request.getParameter("actActAddress").isEmpty()) ? request.getParameter("actActAddress") : "Default actActAddress";
String pubID = (request.getParameter("pubID") != null && !request.getParameter("pubID").isEmpty()) ? request.getParameter("pubID") : "1";
//日期格式化
Date actTime = null;
if (actTimeStr != null && !actTimeStr.isEmpty()) {
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
    try {
        actTime = timeFormat.parse(actTimeStr);
    } catch (Exception e) {
        e.printStackTrace();
    }
}

Date actDate = null;
if (actDateStr != null && !actDateStr.isEmpty()) {
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    try {
        actDate = dateFormat.parse(actDateStr);
    } catch (Exception e) {
        e.printStackTrace();
    }
}
Integer pubIDI = Integer.parseInt(pubID);
Integer actScopeI = Integer.parseInt(actScope);
Integer actPriceS = Integer.parseInt(actPriceStr);
Integer actCategoryNameI = Integer.parseInt(actCategoryIDStr);
Integer cityIDI = Integer.parseInt(cityIDStr);
ActCategory actCategory = new ActCategory();
PublisherVO pub = new PublisherVO();
CityAddress city = new CityAddress();
ActVO act = new ActVO();
act.setActName(actName);
act.setActPrice(actPriceS);
actCategory.setActCategoryID(actCategoryNameI);
act.setActCategory(actCategory);
act.setActContent(actContent);
act.setActTime(actDate);
act.setActScope(actScopeI);
act.setActDate(actDate);
city.setActAdressID(cityIDI);
act.setCityAddressID(city);
pub.setPubID(pubIDI);
act.setPublisherVOs(pub);
act.setCityAddress(actActAddress);
act.setActIntroduce(actIntroduce);
act.setActDate(actDate);
act.setTime(actTime);


ActService actSvc = new ActServiceImpl();
actSvc.insert(act);


response.sendRedirect("ActJSP.jsp");
%>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var actImageField = document.querySelector("input[name='actImage']");
    var actImageFileNameField = document.querySelector("input[name='actImageFileName']");

    actImageField.addEventListener("change", function() {
        var actImageFileName = actImageField.value.split('\\').pop();
        actImageFileNameField.value = actImageFileName; 
    });
});
</script>