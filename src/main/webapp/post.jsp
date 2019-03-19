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

	<div id="temp" style="width: 1000px; height: 900px" onclick="clickDiv()"></div>
	<input type="button" value = "버튼" onclick="kalhoon()">

<script type="text/javascript">

	$( document ).ready(function() {
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

	function kalhoon() {
		/* var contents = "<div id = 'add' style = 'width:400px; height:400px; background-color:yellow' onmousemove = 'moveDiv(this)'>"
		+"<table style = 'width:100%'><colgroup><col width='20%' /><col width='20%' /><col width='20%' /><col width='*' /><col width='20%' /></colgroup>"
	    +"<thead><tr><th>Num</th><td>Name</td><td>ID</td><td>Mobile</td><td>Etc</td></tr></thead><tbody><tr><th>1</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
	    +"<tr><th>2</th><td>Naul</td><td>BrowneyedSoul</td><td>010-1324-3546</td><td>Singer</td></tr><tr><th>3</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
		+"</tbody></table></div>"; */
		
		var contents = "<div id = 'add' style = 'width:400px; height:400px; background-color:yellow; overflow:auto' onmouseenter = 'clickDiv(this)' onmousemove = 'moveDiv(this)'>"
		+"<div style='width:200px; height:150px; background-color:red; display:inlie-block; float: left'></div>"
		+"<div style='width:200px; height:150px; background-color:blue; display:inlie-block; float: left'></div>"
		+"<div style='width:200px; height:150px; background-color:green; display:inlie-block; float: left'></div>"
		+"</div>";
		
		//var content = "<div id = 'add' style = 'width:400px; height:400px; background-color:yellow' onmousemove = 'enterDiv(this)'></div>";
		
		$("#temp").append(contents);
		$("#add").offset({top: 100});
		$("#add").offset({left: 50});
	}

	function clickDiv(obj) {
		console.log("####");
		
		console.log(obj);
		/* $("#add").css("width", "700px");
		$("#add").css("height", "700px");
		 */
		//이런식으로 특정 객체를 삭제할 수 있다.
		//$(obj).remove();

	}
	
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
	}
	
</script>



</body>
</html>