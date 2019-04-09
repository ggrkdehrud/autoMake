<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>
<head>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="/resources/js/divHandling.js"></script>
	<script type="text/javascript" src="/resources/js/mainFunctionJS.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
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
				if($(".navbar-nav").children().length >= 2){
					if(category == $(".navbar-nav").children()[i].children[0].text){
						alert("이미 동일한 이름의 카테고리가 존재합니다.");
						return;
					}
				}else{
					break;
				}
				
			}
			
			frm.target = "por"; // iframe의 이름
			frm.action = "index.jsp?name="+category;
			frm.submit();
			
			$(".navbar-nav").append("<li onmousedown = 'fn_liDown(this)'><a href='"+category+".jsp'>"+category+"</a></li>");
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
			// 팝업창 생성해서 
			
			$('#myModal').modal(true);
				
			var contents = fn_getTableField();
			
			$("#main_right_middle").append(contents);
			// 현재 참조하고 있는 페이지가 무엇인지. 이건 가능할듯.
			
			
			var arr = ["id","title"];
			var header_contents = fn_createBean("Home", arr);
			 
			frm.target = "por"; // iframe의 이름
			frm.action = "index.jsp?header_contents="+encodeURI(encodeURIComponent(header_contents));
			frm.submit();
			
			<%
			String header_content = request.getParameter("header_contents");
			
			if(header_content != null){
				String basicPath = this.getClass().getResource("").getPath();
				basicPath = basicPath.substring(1, basicPath.indexOf(".metadata"));
				String strPath = basicPath+"\\settingProject\\src\\main\\java\\set\\set\\set\\bean\\HomeBean1.java";
				
				header_content = URLDecoder.decode(header_content,"UTF-8");
				System.out.println(header_content);
				FileOutputStream fos = new FileOutputStream(strPath);
				OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");
				BufferedWriter bw = new BufferedWriter(osw);
				bw.write(header_content);
				bw.flush();
				osw.close();
				fos.close();
			}
			%>
			
			
			
		}else if(tempValue == 2){
			/* var contents = "<div id = 'add' style = 'width:800px; height:800px; border: 1px solid black; background-color: white' onmouseenter = 'fn_enterDiv(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\1.jpg' width=100% height=100%></div></div>"
				+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\2.jpg' width=100% height=100%></div></div>"
				+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\3.jpg' width=100% height=100%></div></div>"
				+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\4.jpg' width=100% height=100%></div></div>"
				+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\5.jpg' width=100% height=100%></div></div>"
				+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\6.jpg' width=100% height=100%></div></div>"
				+"</div>"; */
			
			var contents = fn_getPhotoField();
				
			$("#main_right_middle").append(contents);
		}else if(tempValue == 3){
			
			console.log('asd');
			var header_contents1 = $("#main_right_head").html();
			
			frm.target = "por"; // iframe의 이름
			frm.action = "index.jsp?header_contents1="+encodeURI(encodeURIComponent(header_contents1));
			frm.submit();
			
			<%
			String header_content1 = request.getParameter("header_contents1");
			
			if(header_content1 != null){
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

</script>