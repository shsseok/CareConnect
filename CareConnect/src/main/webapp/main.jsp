<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.mainbody1
{
    background-color: #18D008;
   
  
    
}
.mainbody1 p,h1,span
{
   
    padding: 10px;
    color: white;
    font-size: 15px;
    font-family: 'Roboto', sans-serif;
    line-height: 1.5;
    text-align: justify;
}
.mainbody1 div
{ 
	display:inline-block;
}
.mainbody2 {
    overflow: auto;
    white-space: nowrap;
    scrollbar-width: none;  /* For Firefox */
    -ms-overflow-style: none;  /* For Internet Explorer and Edge */
}

.mainbody2::-webkit-scrollbar { 
    display: none;  /* For Chrome, Safari, and Opera */
}
.mainbody3Text span
{
    margin:30px;
    font-size: 20px;
    color: #333;
    font-family: 'Roboto', sans-serif;
}
.reviewtext
{
text-align:center;
 font-size: 30px;
 color:red;
}
.bestreview
{
	border:1px solid black;
	border-radius:10px;
	text-align:center;
}

</style>
<meta charset="UTF-8">
<title>메인 페이지 입니다.</title>
</head>
<body>

<%@include file = "header.jsp" %>
<%@ page import="Carepakage.*" %>
<%
userDBCP user=new userDBCP();
%>
<div class="mainbody1">
<div class="textbox">
<p style="font-size: 20px">건강한 삶을 기준으로 '케어 커넥트'
<h1 style="color:black; font-size: 18px;">홈 케어 서비스 원하는
<h1 style="color:black; font-size: 18px;">수익 창출의 시작
<p>1.24시간 자유롭게 신청가능
<p>2.원하는 치료사가 있는 의료기관에도 매칭
<p>3.본인이 원하는 부위별 전문가와 매칭 가능
<p>4.치료사 상담 서비스
</div>
<div style="float:right;">
<img src="images/userjoincount.png" alt="사용자 수"><span>일반 사용자 수: <%=user.getUserCount() %>명</span><br>
<img src="images/expertjoincount.png" alt="전문가 수"><span>전문가 수: <%=user.getExpertCount() %>명</span>
</div>

</div>	
<div class="reviewtext">이용 후기</div>
<div class=mainbody2 >
<% for(int i=0;i<30;i++)
{
	%>
<div class=bestreview style="display:inline-block; width:200px; height:100px; border:1px solid black;">베스트 이용 후기</div>
<% }%>

</div>
<div class=mainbody3 style="text-align:center">
<img src="images/gudong.png">
<img src="images/unbalance.png">
<img src="images/expert.png">
<img src="images/money.png">
<div class=mainbody3Text>
<span>거동이 불편하신분</span>
<span>신체가 불균형 이신 분</span>
<span>전문적인 정보의 필요성</span>
<span>조금 더 나은 수익 창출</span>
</div>
</div>
<%@include file = "MatchingButton.jsp" %>
<%@include file = "footer.jsp" %>
</body>
 
</html>