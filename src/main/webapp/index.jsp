<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<html>
<head>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/resources/js/main.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

<div id = "main">

	<div id = "main_left">
		<div class = "main_left_menu" innerHTML = "0" style = "background-color: red" onclick = fn_onClickMenu(this)>
			
		</div>
		<div class = "main_left_menu" innerHTML = "1" style = "background-color: black" onclick = fn_onClickMenu(this)>
			
		</div>
		<div class = "main_left_menu" innerHTML = "2" style = "background-color: blue" onclick = fn_onClickMenu(this)>
			
		</div>
		<div class = "main_left_menu" innerHTML = "3" style = "background-color: green" onclick = fn_onClickMenu(this)>
			
		</div>
	</div>
	
	<div id = "main_right">
			<div id="main_right_head">
				<%@ include file="/header.jsp" %>
			</div>

		<div id = "main_right_middle">
			
		</div>
		
		<div id = "main_right_bottom">
			
		</div>
	</div>
</div>
<div id = "circle" style="width:100px;height:100px;border-radius: 50px;background-color:black" onmouseover = fn_onMouseEnter(this) onclick = fn_addPhoto()></div>
<iframe width=800 name="por" width="0" height="0" frameborder="0" scrolling="no"></iframe>
<form name="frm" method="post" action="" style="display:none"></form>

<script type="text/javascript">
	var myMap = new Map();
	
	$(document).ready(function() {
		var object = document.getElementById("main_right_middle");
		var x = object.offsetTop;
		var y = object.offsetLeft;
		var middle_width = object.offsetWidth;
		var middle_height = object.offsetHeight;
		
		var circle = document.getElementById("circle");
		
		$("#circle").offset({top: x+middle_height - 110});
		$("#circle").offset({left: y+middle_width - 93});
		
		$(window).resize(function() {
			var object = document.getElementById("main_right_middle");
			var x = object.offsetTop;
			var y = object.offsetLeft;
			var middle_width = object.offsetWidth;
			var middle_height = object.offsetHeight;
			
			var circle = document.getElementById("circle");
			
			$("#circle").offset({top: x+middle_height - 110});
			$("#circle").offset({left: y+middle_width - 110});
		});
		
		nowObject = null;
	    
		window.onmousemove = function(){
	    	if(nowObject != null){
	    		
	    		//현재 move mode 인지 resize 모드인지 none 모드인지 확인이 필요하다.
	    		if(nowObject.value == "move"){
	    			//현재 좌표랑 비교해서 움직여주는 작업이 필요.
	    			//top, left 좌표.
	    			
	    			
	    			var x = event.pageX;
		    		var y = event.pageY;
		    		
		    		var real_distance_x = nowObject.click_x - nowObject.left;
		    		var real_distance_y = nowObject.click_y - nowObject.top;
		    		
		    		$(nowObject).offset({top: y - real_distance_y});
		    		$(nowObject).offset({left: x - real_distance_x});
			    	
		    		window.onmouseup = function(){
		    			if(nowObject != null){
		    				nowObject.value = "none";
		    			}
		    			nowObject = null;
		    		}
	    			
	    		}else if(nowObject.value == "resize-r-b"){
	    			var width = nowObject.offsetWidth;
		    		var height = nowObject.offsetHeight;
		    		var top = nowObject.offsetTop;
		    		var left = nowObject.offsetLeft;
		    		
		    		var x = event.pageX;
		    		var y = event.pageY; 
		    		var real_width = x - left;
		    		var real_height = y - top;
		    	
		    		//마우스 좌표를 따라다니면서 계속 그려줘야 한다.
		    		$(nowObject).css('width', real_width+"px");
			    	$(nowObject).css('height', real_height+"px");
			    	
		    		window.onmouseup = function(){
		    			if(nowObject != null){
		    				nowObject.value = "none";
		    			}
		    			nowObject = null;
		    		}
	    		}else if(nowObject.value == "resize-l-u"){
	    			var width = nowObject.offsetWidth;
		    		var height = nowObject.offsetHeight;
		    		var top = nowObject.offsetTop;
		    		var left = nowObject.offsetLeft;
		    		
		    		var x = event.pageX;
		    		var y = event.pageY; 
		    		//var real_width = x - left;
		    		//var real_height = y - top;
		    		
		    		
		    		//좌표를 움직이면서 그려야 한다.
		    		var real_width = (left - x) + width;
		    		var real_height = (top - y) + height;
		    		
		    		$(nowObject).offset({top: y});
		    		$(nowObject).offset({left: x});
		    		//마우스 좌표를 따라다니면서 계속 그려줘야 한다.
		    		$(nowObject).css('width', real_width+"px");
			    	$(nowObject).css('height', real_height+"px");
			    	
		    		window.onmouseup = function(){
		    			if(nowObject != null){
		    				nowObject.value = "none";
		    			}
		    			nowObject = null;
		    		}
	    		}else if(nowObject.value == "resize-r-u"){
	    			var width = nowObject.offsetWidth;
		    		var height = nowObject.offsetHeight;
		    		var top = nowObject.offsetTop;
		    		var left = nowObject.offsetLeft;
		    		
		    		var x = event.pageX;
		    		var y = event.pageY; 
		    		
		    		//좌표를 움직이면서 그려야 한다.
		    		var real_width = x - left;
		    		var real_height = (top - y) + height;

		    		$(nowObject).offset({top: y});
		    		
		    		//마우스 좌표를 따라다니면서 계속 그려줘야 한다.
		    		$(nowObject).css('width', real_width+"px");
			    	$(nowObject).css('height', real_height+"px");
			    	
		    		window.onmouseup = function(){
		    			if(nowObject != null){
		    				nowObject.value = "none";
		    			}
		    			nowObject = null;
		    		}
	    		}else if(nowObject.value == "resize-l-b"){
	    			var width = nowObject.offsetWidth;
		    		var height = nowObject.offsetHeight;
		    		var top = nowObject.offsetTop;
		    		var left = nowObject.offsetLeft;
		    		
		    		var x = event.pageX;
		    		var y = event.pageY; 
		    		
		    		//좌표를 움직이면서 그려야 한다.
		    		var real_width = (left - x) + width;
		    		var real_height = y - top;
		    		
		    		$(nowObject).offset({left: x});
		    		
		    		//마우스 좌표를 따라다니면서 계속 그려줘야 한다.
		    		$(nowObject).css('width', real_width+"px");
			    	$(nowObject).css('height', real_height+"px");
			    	
		    		window.onmouseup = function(){
		    			if(nowObject != null){
		    				nowObject.value = "none";
		    			}
		    			nowObject = null;
		    		}
	    		}
	    	}
	    }
	});
	
	function moveDiv(obj) {
		var width = obj.offsetWidth;
		var height = obj.offsetHeight;
		var top = obj.offsetTop;
		var left = obj.offsetLeft;
		
		var x = event.pageX;
		var y = event.pageY;
		
		obj.onmousedown = function(){
			// 이곳에서 obj를 설정해줘야되. 개발모드라는 뜻. 내부에 값을 넣어놓진 말자 아직까진!
			var click_x = event.pageX;
			var click_y = event.pageY; 
			
			nowObject = obj;
			nowObject.value = "move";
			nowObject.top = top;
			nowObject.left = left;
			nowObject.click_x = click_x;
			nowObject.click_y = click_y;
		}
		
		if((x <= (left + width) && x >= ((left + width) -6)) && (y <= (top + height) && y >= ((top + height) -6))){
			$(obj).css('cursor', 'nw-resize');
			//우측 하단
			obj.onmousedown = function(){
				// nowObject.value 이름을 통해서 동서남북도 확인할 수 있다.
				nowObject = obj;
				nowObject.value = "resize-r-b";
			}
		}else if((x >= (left) && x <= ((left) +7)) && ( y >= (top) && y <= ((top) +7))){
			$(obj).css('cursor', 'nw-resize');
			//좌측 상단
			obj.onmousedown = function(){
				// nowObject.value 이름을 통해서 동서남북도 확인할 수 있다.
				nowObject = obj;
				nowObject.value = "resize-l-u";
			}
		}else if(((x >= (left + width) -7) && x <= (left + width)) && (( y <= (top) +7) && ( y >= (top)))){
			$(obj).css('cursor', 'ne-resize');
			//우측 상단
			obj.onmousedown = function(){
				// nowObject.value 이름을 통해서 동서남북도 확인할 수 있다.
				nowObject = obj;
				nowObject.value = "resize-r-u";
			}
		}else if(((x >= (left)) && (x <= (left) +7)) && ((y <= (top + height)) && y >= (top + height) -7)){
			$(obj).css('cursor', 'ne-resize');
			//우측 하단
			obj.onmousedown = function(){
				// nowObject.value 이름을 통해서 동서남북도 확인할 수 있다.
				nowObject = obj;
				nowObject.value = "resize-l-b";
			}
		}else{
			$(obj).css('cursor', 'default');
		}
		
		
		/* if((x <= (top + width) && x >= ((top + width) -6)) && (y <= (top + height) && y >= ((top + height) -6))){
			$(obj).css('cursor', 'nw-resize');
		}else if(){
			
		}else if(){
		
		}else if(){
			
		}else if(){
			
		}else if(){
			
		}else{
			$(obj).css('cursor', 'default');
		} */
	}
	
	function fn_onClickMenu(menu){
		var tempValue = menu.getAttribute("innerHTML");
		
		//안에 내용이 있나없나? 아니면 html을 써서 그냥 다 날려버리기?
		
		if(tempValue == 0){
			//옵션창을 만들어서 조금 더 customize 할 수 있다.
			//입력받으면서 종류를 다시 지정할 수 있다.
			//콤보박스로 게시판, 사진 등등..
			var input = prompt('Message');
			//length 체크를 해줘야 한다.
			
			
			if(myMap.get(input) == undefined){
				//jsp 파일명을 어떻게 할것인가?
				myMap.set(input, '1');
			}else{
				//이곳에선 팅겨내야 한다.
				alert("이미 동일한 이름의 카테고리가 존재합니다.");
				return;
			}
			
			
			frm.target = "por"; // iframe의 이름
			frm.action = "index.jsp?name="+input;
			frm.submit();
			
			$(".navbar-nav").append("<li><a href='"+input+".jsp'>"+input+"</a></li>");
			//이곳에서 속성 다시 지정.
			
			
			//파일 만들어주고 기본값만 셋팅해주고 끝내기
			<%
			String name = request.getParameter("name");
			
			if(name != null){
				
				//index.jsp의 모든 것을 복사하고 다시 붙여넣기? 조금 더 효율적인 방법은 없을까?
				int data;
				String inStrPath = "C:\\Users\\USER\\Desktop\\STS\\workspace\\settingProject\\src\\main\\webapp\\index.jsp";
				String strPath = "C:\\Users\\USER\\Desktop\\STS\\workspace\\settingProject\\src\\main\\webapp\\"+name+".jsp";
				
				FileInputStream fis = new FileInputStream(inStrPath);
				FileOutputStream fos = new FileOutputStream(strPath);
				OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
				BufferedWriter bw = new BufferedWriter(osw);
				
				while((data = fis.read()) != -1){
					bw.write(data);
				}
				
				bw.flush();
				osw.close();
				fos.close();
				fis.close();
			}
			%>
		}else if(tempValue == 1){
			
			//$("#main_right_middle").append(temp_query);
			
			//var contents = "<div id = '1' style='width:100px;height:100px;background-color:red' on></div>";
			
			var contents = "<div id = 'add' style = 'width:400px; height:400px; background-color:yellow' onmousemove = 'moveDiv(this)'>"
				+"<table style = 'width:100%'><colgroup><col width='20%' /><col width='20%' /><col width='20%' /><col width='*' /><col width='20%' /></colgroup>"
			    +"<thead><tr><th>Num</th><td>Name</td><td>ID</td><td>Mobile</td><td>Etc</td></tr></thead><tbody><tr><th>1</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
			    +"<tr><th>2</th><td>Naul</td><td>BrowneyedSoul</td><td>010-1324-3546</td><td>Singer</td></tr><tr><th>3</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
				+"</tbody></table></div>";
			
			//top, top+left, bottom, bottom+left 좌표에서 1씩 추가한곳에 마우스가 올라온다면 마우스커서 이미지 변경.
			
			$("#main_right_middle").append(contents);
			// 현재 참조하고 있는 페이지가 무엇인지. 이건 가능할듯.
			
			<%-- 
			var aa = 
			"<table>"
			+"<tr>"
			+"<td>제목</td><td>내용</td><td>날짜</td>"
			+"</tr>"
			+"<c:forEach var='item' items='%{list}'>"
			+"<tr>"
			+"<td></td><td></td><td></td>"
			+"</tr>"
			+"</c:forEach>"
			+"</table>";
			
			$("#main_right_middle").append(aa);
			
			
			<%
			String aa = 
			"<table>"
			+"<tr>"
			+"<td>제목</td><td>내용</td><td>날짜</td>"
			+"</tr>"
			+"<c:forEach var='item' items='%{list}'>"
			+"<tr>"
			+"<td></td><td></td><td></td>"
			+"</tr>"
			+"</c:forEach>"
			+"</table>";
			
			// 이곳에서 위치를 찾아서 파일로 작성한다.
			String strPath1 = "C:\\Users\\USER\\Desktop\\STS\\workspace\\settingProject\\src\\main\\webapp\\header.jsp";
				
			FileOutputStream fos1 = new FileOutputStream(strPath1);
			OutputStreamWriter osw1 = new OutputStreamWriter(fos1, "UTF-8");
			BufferedWriter bw1 = new BufferedWriter(osw1);
			bw1.write("ㅁㄴㅇ");
			bw1.flush();
			osw1.close();
			fos1.close();
			%>
			 --%>
			
		}else if(tempValue == 2){
			$("#main_right_bottom").append(menuList[tempValue]);
		}else if(tempValue == 3){
			
			console.log('asd');
			var header_contents = $("#main_right_head").html();
			
			frm.target = "por"; // iframe의 이름
			frm.action = "index.jsp?header_contents="+encodeURI(encodeURIComponent(header_contents));
			frm.submit();
			
			<%
			String header_content = request.getParameter("header_contents");
			
			if(header_content != null){
				String header_contents = "<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'"+"% >".replaceAll(" ", "")+"\n"+URLDecoder.decode(header_content,"UTF-8").trim();
				
				String strPath = "C:\\Users\\USER\\Desktop\\STS\\workspace\\settingProject\\src\\main\\webapp\\header.jsp";
				
				FileOutputStream fos = new FileOutputStream(strPath);
				OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
				BufferedWriter bw = new BufferedWriter(osw);
				bw.write(header_contents);
				bw.flush();
				osw.close();
				fos.close();
			}
			%>
		}
	}
	
	
	
	function fn_addPhoto(){
		alert("Show Modal!!");
		//
	}
	
	

</script>

</body>
</html>
