<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<html>
<head>
	<%@ include file="/resources/js/mainFunctionJSP.jsp" %>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/resources/js/divHandling.js"></script>
	<script type="text/javascript" src="/resources/js/mainFunctionJS.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body oncontextmenu="return false">

<div id = "main">

	<div id = "main_left">
		<div id="main_left_head">
		
		</div>
		<div class = "main_left_menu" innerHTML = "0" style = "" onclick = fn_onClickMenu(this)>
			<a href="#" style="text-decoration:none"><div style="width:100%; height:100%; border: 1px solid #444444;text-align: center;">카테고리 생성</div></a>
		</div>
		<div class = "main_left_menu" innerHTML = "1" style = "" onclick = fn_onClickMenu(this)>
			<a href="#" style="text-decoration:none"><div style="width:100%; height:100%; border-left: 1px solid #444444;border-bottom: 1px solid #444444;border-right: 1px solid #444444;text-align: center;">테이블 생성</div></a>
		</div>
		<div class = "main_left_menu" innerHTML = "2" style = "" onclick = fn_onClickMenu(this)>
			<a href="#" style="text-decoration:none"><div style="width:100%; height:100%; border-left: 1px solid #444444;border-bottom: 1px solid #444444;border-right: 1px solid #444444;text-align: center;">사진첩 생성</div></a>
		</div>
		<div class = "main_left_menu" innerHTML = "3" style = "" onclick = fn_onClickMenu(this)>
			<a href="#" style="text-decoration:none"><div style="width:100%; height:100%; border-left: 1px solid #444444;border-bottom: 1px solid #444444;border-right: 1px solid #444444;text-align: center;">저장</div></a>
		</div>
	</div>
	
	<div id = "main_right">
			<div id="main_right_head">
				<%@ include file="/header.jsp" %>
			</div>

		<div id = "main_right_middle">
			
		</div>
		
		<div id = "main_right_bottom">
			<img src = "/resources/images/bottom.png" width = "100%" height = "100%">
		</div>
	</div>
</div>
<div id = "circle" style="width:100px;height:100px;border-radius: 50px;background-color:black" onmouseover = fn_onMouseEnter(this) onclick = fn_addPhoto()></div>
<iframe width=800 name="por" width="0" height="0" frameborder="0" scrolling="no"></iframe>
<form name="frm" method="post" action="" style="display:none"></form>

<script type="text/javascript">
$(document).ready(function() {
	var object = document.getElementById("main_right_middle");
	var x = object.offsetTop;
	var y = object.offsetLeft;
	var middle_width = object.offsetWidth;
	var middle_height = object.offsetHeight;
	var scrollT = $(this).scrollTop();
	var scrollW = $(this).width();
	var scrollH = $(window).height();
	nowObject = null;
	nowInnerObject = null;
	
	$("#circle").offset({top: scrollT+scrollH - 150});
	$("#circle").offset({left: scrollW - 150});

	$(window).resize(function() {
		var object = document.getElementById("main_right_middle");
		var x = object.offsetTop;
		var y = object.offsetLeft;
		var middle_width = object.offsetWidth;
		var middle_height = object.offsetHeight;
		var scrollT = $(this).scrollTop();
		var scrollW = $(this).width();
		var scrollH = $(this).height();
		
		$("#circle").offset({top: scrollT+scrollH - 150});
		$("#circle").offset({left: scrollW - 150});
	});
	
	$(window).scroll(function() {
		var scrollT = $(this).scrollTop();
		var scrollW = $(this).width();
		var scrollH = $(this).height();
        
        $("#circle").offset({top: scrollT+scrollH - 150});
		$("#circle").offset({left: scrollW - 150});
        
	});
});
</script>
</body>
</html>
