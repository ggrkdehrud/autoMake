<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<html>
<head>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="resources/js/divHandling.js"></script>
	<script type="text/javascript" src="resources/js/editFunctionJS.js"></script>
	<script type="text/javascript" src="resources/js/mainFunctionJS.js"></script>
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
				<%@ include file="header.jsp" %>
			</div>

		<div id = "main_right_middle">
			
		</div>
		
		<div id = "main_right_bottom">
			<img src = "resources/images/bottom.png" width = "100%" height = "100%">
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
<div class="form-group">
  <label for="usr">항목:</label>
  <input type="text" class="form-control" id="usr_kor">
  <input type="text" class="form-control" id="usr_eng">
</div>
<div class="form-group">
  <label for="pwd">Password:</label>
  <input type="password" class="form-control" id="pwd">
</div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>


<div id = "circle" style="width:100px;height:100px;border-radius: 50px;background-color:black" onmouseover = fn_onMouseEnter(this) onclick = fn_addPhoto()></div>
<iframe width=800 name="por" width="0" height="0" frameborder="0" scrolling="no"></iframe>
<form name="frm" method="post" action="" style="display:none"></form>

<script type="text/javascript">
$(document).ready(function() {
	fn_onReady();
});
</script>
</body>
</html>
