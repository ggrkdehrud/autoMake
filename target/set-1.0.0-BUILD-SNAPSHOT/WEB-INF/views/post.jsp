<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<html>
<head>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/resources/js/mainFunctionJS.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div id="temp" style="width: 1300px; height: 900px"></div>
	<input type="button" value = "버튼" onclick="kalhoon()">

<script type="text/javascript">

	$( document ).ready(function() {
	    nowObject = null;
	});
	
	function kalhoon() {
		/* var contents = "<div id = 'add' style = 'width:400px; height:400px; background-color:yellow' onmouseenter = 'enterDiv(this)'>"
		+"<table style = 'width:100%'><colgroup><col width='20%' /><col width='20%' /><col width='20%' /><col width='*' /><col width='20%' /></colgroup>"
	    +"<thead><tr><th>Num</th><td>Name</td><td>ID</td><td>Mobile</td><td>Etc</td></tr></thead><tbody><tr><th>1</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
	    +"<tr><th>2</th><td>Naul</td><td>BrowneyedSoul</td><td>010-1324-3546</td><td>Singer</td></tr><tr><th>3</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
		+"</tbody></table></div>"; */
		
		var contents = "<div id = 'add' style = 'width:400px; height:400px; background-color:yellow; overflow:auto' onmouseenter = 'fn_enterDiv(this)' onmouseout = 'fn_outDiv(this)'>"
		+"<div style='width:200px; height:150px; background-color:red; display:inlie-block; float: left'></div>"
		+"<div style='width:200px; height:150px; background-color:blue; display:inlie-block; float: left'></div>"
		+"<div style='width:200px; height:150px; background-color:green; display:inlie-block; float: left'></div>"
		+"</div>";
		
		$("#temp").append(contents);
		$("#add").offset({top: 100});
		$("#add").offset({left: 50});
	}
	
	function fn_outDiv(obj){
		if(obj.value == "resizing"){
			return false;
		}else{		
			$("#temp").css('cursor', 'default');
			obj.value = "";
		}
	}
	
	function fn_enterDiv(obj){
		
		obj.onmousemove = function(){
			var x = event.pageX;
			var y = event.pageY; 
			var width = obj.offsetWidth;
			var height = obj.offsetHeight;
			var top = obj.offsetTop;
			var left = obj.offsetLeft;
			
			if((x <= (left + width) && x >= ((left + width) -7)) && (y <= (top + height) && y >= ((top + height) -7))){
				$("#temp").css('cursor', 'nw-resize');
				//우측 하단
				
				obj.onmousedown = function(){
					obj.value = "resizing";
					nowObject = obj;
					
					window.onmousemove = function(e){
						if(nowObject == null){
							e.preventDefault();
							return false;
						}
						var width = obj.offsetWidth;
			    		var height = obj.offsetHeight;
			    		var top = obj.offsetTop;
			    		var left = obj.offsetLeft;
			    		
			    		var x = event.pageX;
			    		var y = event.pageY; 
			    		var real_width = x - left;
			    		var real_height = y - top;
			    		
			    		//마우스 좌표를 따라다니면서 계속 그려줘야 한다.
			    		$(obj).css('width', real_width+"px");
				    	$(obj).css('height', real_height+"px");
				    	
			    		window.onmouseup = function(){
			    			$("#temp").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if((x >= (left) && x <= ((left) +7)) && ( y >= (top) && y <= ((top) +7))){
				$("#temp").css('cursor', 'nw-resize');
				//좌측 상단
				
				obj.onmousedown = function(){
					obj.value = "resizing";
					nowObject = obj;
					
					window.onmousemove = function(e){
						if(nowObject == null){
							e.preventDefault();
							return false;
						}
						var width = obj.offsetWidth;
			    		var height = obj.offsetHeight;
			    		var top = obj.offsetTop;
			    		var left = obj.offsetLeft;
			    		
			    		var x = event.pageX;
			    		var y = event.pageY;
			    		var real_width = (left - x) + width;
			    		var real_height = (top - y) + height;
			    		
			    		$(obj).offset({top: y});
			    		$(obj).offset({left: x});
			    		//마우스 좌표를 따라다니면서 계속 그려줘야 한다.
			    		$(obj).css('width', real_width+"px");
				    	$(obj).css('height', real_height+"px");
				    	
			    		window.onmouseup = function(){
			    			$("#temp").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if(((x >= (left + width) -7) && x <= (left + width)) && (( y <= (top) +7) && ( y >= (top)))){
				$("#temp").css('cursor', 'ne-resize');
				//우측 상단
				obj.onmousedown = function(){
					obj.value = "resizing";
					nowObject = obj;
					
					window.onmousemove = function(e){
						if(nowObject == null){
							e.preventDefault();
							return false;
						}
						var width = obj.offsetWidth;
			    		var height = obj.offsetHeight;
			    		var top = obj.offsetTop;
			    		var left = obj.offsetLeft;
			    		
			    		var x = event.pageX;
			    		var y = event.pageY; 
			    		var real_width = x - left;
			    		var real_height = (top - y) + height;

			    		$(obj).offset({top: y});
			    		
			    		//마우스 좌표를 따라다니면서 계속 그려줘야 한다.
			    		$(obj).css('width', real_width+"px");
				    	$(obj).css('height', real_height+"px");
				    	
			    		window.onmouseup = function(){
			    			$("#temp").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if(((x >= (left)) && (x <= (left) +7)) && ((y <= (top + height)) && y >= (top + height) -7)){
				$("#temp").css('cursor', 'ne-resize');
				//우측 하단
				obj.onmousedown = function(){
					obj.value = "resizing";
					nowObject = obj;
					
					window.onmousemove = function(e){
						if(nowObject == null){
							e.preventDefault();
							return false;
						}
						var width = obj.offsetWidth;
			    		var height = obj.offsetHeight;
			    		var top = obj.offsetTop;
			    		var left = obj.offsetLeft;
			    		
			    		var x = event.pageX;
			    		var y = event.pageY; 
			    		var real_width = (left - x) + width;
			    		var real_height = y - top;
			    		
			    		$(obj).offset({left: x});
			    		
			    		//마우스 좌표를 따라다니면서 계속 그려줘야 한다.
			    		$(obj).css('width', real_width+"px");
				    	$(obj).css('height', real_height+"px");
				    	
			    		window.onmouseup = function(){
			    			$("#temp").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else{
				fn_outDiv(obj);
				
				obj.onmousedown = function(){
					$("#temp").css('cursor', 'move');
					console.log("###");
					// 이곳에서 obj를 설정해줘야되. 개발모드라는 뜻. 내부에 값을 넣어놓진 말자 아직까진!
					var click_x = event.pageX;
					var click_y = event.pageY;
					obj.value = "resizing";
					nowObject = obj;
					
					window.onmousemove = function(e){
						if(nowObject == null){
							console.log("!!!");
							e.preventDefault();
							return false;
						}
						var x = event.pageX;
			    		var y = event.pageY;
			    		
			    		var real_distance_x = click_x - left;
			    		var real_distance_y = click_y - top;
			    		
			    		$(obj).offset({top: y - real_distance_y});
			    		$(obj).offset({left: x - real_distance_x});
			    		
			    		window.onmouseup = function(){
			    			console.log("333");
			    			$("#temp").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}
		}
	}
	
</script>



</body>
</html>