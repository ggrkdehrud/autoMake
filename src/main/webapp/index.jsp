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
			    			$("#main").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if((x >= (left) && x <= ((left) +7)) && ( y >= (top) && y <= ((top) +7))){
				$("#main").css('cursor', 'nw-resize');
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
			    			$("#main").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if(((x >= (left + width) -7) && x <= (left + width)) && (( y <= (top) +7) && ( y >= (top)))){
				$("#main").css('cursor', 'ne-resize');
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
			    			$("#main").css('cursor', 'default');
			    			nowObject = null;
			    			obj.value = "";
			    		}
					}
				}
			}else if(((x >= (left)) && (x <= (left) +7)) && ((y <= (top + height)) && y >= (top + height) -7)){
				$("#main").css('cursor', 'ne-resize');
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
					// 이곳에서 obj를 설정해줘야되. 개발모드라는 뜻. 내부에 값을 넣어놓진 말자 아직까진!
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
			var delete_confirm = confirm("정말 삭제하시겠습니까?");
			if(delete_confirm){
				//우선 obj에 해당하는 파일을 삭제하고
				//header를 수정해주고
				$(obj).remove();
				
				alert("삭제완료!");
			}
		}
	}
	
	function fn_onClickMenu(menu){
		var tempValue = menu.getAttribute("innerHTML");
		
		//안에 내용이 있나없나? 아니면 html을 써서 그냥 다 날려버리기?
		
		if(tempValue == 0){
			//옵션창을 만들어서 조금 더 customize 할 수 있다.
			//입력받으면서 종류를 다시 지정할 수 있다.
			//콤보박스로 게시판, 사진 등등..
			var category = prompt('Message');
			
			if(category.length == 0){
				alert("입력해주세요");
				return;
			}
			
			for(i = 0; i < $(".navbar-nav").children().length; i++){
				if(category == $(".navbar-nav").children()[2].children[0].text){
					alert("이미 동일한 이름의 카테고리가 존재합니다.");
					return;
				}
			}
			
			frm.target = "por"; // iframe의 이름
			frm.action = "index.jsp?name="+input;
			frm.submit();
			
			$(".navbar-nav").append("<li onmousedown = 'fn_liDown(this)'><a href='"+input+".jsp'>"+input+"</a></li>");
			//이곳에서 속성 다시 지정.
			
			
			//파일 만들어주고 기본값만 셋팅해주고 끝내기
			<%
			String name = request.getParameter("name");
			
			if(name != null){
				
				//index.jsp의 모든 것을 복사하고 다시 붙여넣기? 조금 더 효율적인 방법은 없을까?
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
			// 현재 참조하고 있는 페이지가 무엇인지. 이건 가능할듯.
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
			
			frm.target = "por"; // iframe의 이름
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
