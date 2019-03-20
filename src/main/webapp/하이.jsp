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
<body oncontextmenu="return false">

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
	    
	});
	
	function fn_outDiv(obj){
		if(obj.value == "resizing"){
			return false;
		}else{
			$("#main").css('cursor', 'default');
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
				$("#main").css('cursor', 'nw-resize');
				//ì°ì¸¡ íë¨
				
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
			    		
			    		//ë§ì°ì¤ ì¢íë¥¼ ë°ë¼ë¤ëë©´ì ê³ì ê·¸ë ¤ì¤ì¼ íë¤.
			    		$(obj).css('width', real_width+"px");
				    	$(obj).css('height', real_height+"px");
				    	
			    		window.onmouseup = function(){
			    			$("#main").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if((x >= (left) && x <= ((left) +7)) && ( y >= (top) && y <= ((top) +7))){
				$("#main").css('cursor', 'nw-resize');
				//ì¢ì¸¡ ìë¨
				
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
			    		//ë§ì°ì¤ ì¢íë¥¼ ë°ë¼ë¤ëë©´ì ê³ì ê·¸ë ¤ì¤ì¼ íë¤.
			    		$(obj).css('width', real_width+"px");
				    	$(obj).css('height', real_height+"px");
				    	
			    		window.onmouseup = function(){
			    			$("#main").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if(((x >= (left + width) -7) && x <= (left + width)) && (( y <= (top) +7) && ( y >= (top)))){
				$("#main").css('cursor', 'ne-resize');
				//ì°ì¸¡ ìë¨
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
			    		
			    		//ë§ì°ì¤ ì¢íë¥¼ ë°ë¼ë¤ëë©´ì ê³ì ê·¸ë ¤ì¤ì¼ íë¤.
			    		$(obj).css('width', real_width+"px");
				    	$(obj).css('height', real_height+"px");
				    	
			    		window.onmouseup = function(){
			    			$("#main").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if(((x >= (left)) && (x <= (left) +7)) && ((y <= (top + height)) && y >= (top + height) -7)){
				$("#main").css('cursor', 'ne-resize');
				//ì°ì¸¡ íë¨
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
			    		
			    		//ë§ì°ì¤ ì¢íë¥¼ ë°ë¼ë¤ëë©´ì ê³ì ê·¸ë ¤ì¤ì¼ íë¤.
			    		$(obj).css('width', real_width+"px");
				    	$(obj).css('height', real_height+"px");
				    	
			    		window.onmouseup = function(){
			    			$("#main").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else{
				fn_outDiv(obj);
				
				obj.onmousedown = function(){
					$("#main").css('cursor', 'move');
					// ì´ê³³ìì objë¥¼ ì¤ì í´ì¤ì¼ë. ê°ë°ëª¨ëë¼ë ë». ë´ë¶ì ê°ì ë£ì´ëì§ ë§ì ìì§ê¹ì§!
					var click_x = event.pageX;
					var click_y = event.pageY; 
					obj.value = "resizing";
					nowObject = obj;
					
					window.onmousemove = function(e){
						if(nowObject == null){
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
			    			$("#main").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}
		}
	}
	
	function fn_liDown(obj){
		if(event.which == 3){
			var delete_confirm = confirm("ì ë§ ì­ì íìê² ìµëê¹?");
			if(delete_confirm){
				//ì°ì  objì í´ë¹íë íì¼ì ì­ì íê³ 
				//headerë¥¼ ìì í´ì£¼ê³ 
				$(obj).remove();
				
				alert("ì­ì ìë£!");
			}
		}
	}
	
	function fn_onClickMenu(menu){
		var tempValue = menu.getAttribute("innerHTML");
		
		//ìì ë´ì©ì´ ìëìë? ìëë©´ htmlì ì¨ì ê·¸ë¥ ë¤ ë ë ¤ë²ë¦¬ê¸°?
		
		if(tempValue == 0){
			//ìµìì°½ì ë§ë¤ì´ì ì¡°ê¸ ë customize í  ì ìë¤.
			//ìë ¥ë°ì¼ë©´ì ì¢ë¥ë¥¼ ë¤ì ì§ì í  ì ìë¤.
			//ì½¤ë³´ë°ì¤ë¡ ê²ìí, ì¬ì§ ë±ë±..
			var input = prompt('Message');
			//length ì²´í¬ë¥¼ í´ì¤ì¼ íë¤.
			
			
			if(myMap.get(input) == undefined){
				//jsp íì¼ëªì ì´ë»ê² í ê²ì¸ê°?
				myMap.set(input, '1');
			}else{
				//ì´ê³³ìì  íê²¨ë´ì¼ íë¤.
				alert("ì´ë¯¸ ëì¼í ì´ë¦ì ì¹´íê³ ë¦¬ê° ì¡´ì¬í©ëë¤.");
				return;
			}
			
			frm.target = "por"; // iframeì ì´ë¦
			frm.action = "index.jsp?name="+input;
			frm.submit();
			
			$(".navbar-nav").append("<li onmousedown = 'fn_liDown(this)'><a href='"+input+".jsp'>"+input+"</a></li>");
			//ì´ê³³ìì ìì± ë¤ì ì§ì .
			
			
			//íì¼ ë§ë¤ì´ì£¼ê³  ê¸°ë³¸ê°ë§ ìíí´ì£¼ê³  ëë´ê¸°
			<%
			String name = request.getParameter("name");
			
			if(name != null){
				
				//index.jspì ëª¨ë  ê²ì ë³µì¬íê³  ë¤ì ë¶ì¬ë£ê¸°? ì¡°ê¸ ë í¨ì¨ì ì¸ ë°©ë²ì ììê¹?
				int data;
				String basicPath = this.getClass().getResource("").getPath();
				basicPath = basicPath.substring(1, basicPath.indexOf(".metadata"));
				String inStrPath = basicPath+"\\settingProject\\src\\main\\webapp\\index.jsp";
				String strPath = basicPath+"\\settingProject\\src\\main\\webapp\\"+name+".jsp";
				
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
			var contents = "<div id = 'add' style = 'width:400px; height:400px; background-color:yellow' onmouseenter = 'fn_enterDiv(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<table style = 'width:100%'><colgroup><col width='20%' /><col width='20%' /><col width='20%' /><col width='*' /><col width='20%' /></colgroup>"
			    +"<thead><tr><th>Num</th><td>Name</td><td>ID</td><td>Mobile</td><td>Etc</td></tr></thead><tbody><tr><th>1</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
			    +"<tr><th>2</th><td>Naul</td><td>BrowneyedSoul</td><td>010-1324-3546</td><td>Singer</td></tr><tr><th>3</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
				+"</tbody></table></div>";

			$("#main_right_middle").append(contents);
			// íì¬ ì°¸ì¡°íê³  ìë íì´ì§ê° ë¬´ìì¸ì§. ì´ê±´ ê°ë¥í ë¯.
		}else if(tempValue == 2){
			var contents = "<div id = 'add' style = 'width:400px; height:400px; background-color:yellow; overflow:auto' onmouseenter = 'fn_enterDiv(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<div style='width:200px; height:150px; background-color:red; display:inlie-block; float: left'></div>"
				+"<div style='width:200px; height:150px; background-color:blue; display:inlie-block; float: left'></div>"
				+"<div style='width:200px; height:150px; background-color:green; display:inlie-block; float: left'></div>"
				+"</div>";
			
			$("#main_right_middle").append(contents);
		}else if(tempValue == 3){
			
			console.log('asd');
			var header_contents = $("#main_right_head").html();
			
			frm.target = "por"; // iframeì ì´ë¦
			frm.action = "index.jsp?header_contents="+encodeURI(encodeURIComponent(header_contents));
			frm.submit();
			
			<%
			String header_content = request.getParameter("header_contents");
			
			if(header_content != null){
				String header_contents = "<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'"+"% >".replaceAll(" ", "")+"\n"+URLDecoder.decode(header_content,"UTF-8").trim();
				
				String basicPath = this.getClass().getResource("").getPath();
				basicPath = basicPath.substring(1, basicPath.indexOf(".metadata"));
				String strPath = basicPath+"\\settingProject\\src\\main\\webapp\\header.jsp";
				
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
