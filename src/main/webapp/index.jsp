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
			
			var contents = "<div id = '1' style='width:100px;height:100px;background-color:red'></div>";
			
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
