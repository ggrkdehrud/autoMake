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
	});
	
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
			
			$(".navbar-nav").append("<li><a href='"+input+".jsp'>"+input+"</a></li>");
			//ì´ê³³ìì ìì± ë¤ì ì§ì .
			
			
			//íì¼ ë§ë¤ì´ì£¼ê³  ê¸°ë³¸ê°ë§ ìíí´ì£¼ê³  ëë´ê¸°
			<%
			String name = request.getParameter("name");
			
			if(name != null){
				
				//index.jspì ëª¨ë  ê²ì ë³µì¬íê³  ë¤ì ë¶ì¬ë£ê¸°? ì¡°ê¸ ë í¨ì¨ì ì¸ ë°©ë²ì ììê¹?
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
			
			$("#main_right_middle").append(temp_query);
			
			
			
			
			
		}else if(tempValue == 2){
			$("#main_right_bottom").append(menuList[tempValue]);
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
