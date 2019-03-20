<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">WebSiteName</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Page 1-1</a></li>
					<li><a href="#">Page 1-2</a></li>
					<li><a href="#">Page 1-3</a></li>
				</ul>
			</li>
		<li onmousedown="fn_liDown(this)"><a href="하이.jsp">하이</a></li><li onmousedown="fn_liDown(this)"><a href="ㅋㅋ.jsp">ㅋㅋ</a></li></ul>
		
		<!-- 
		
		카테고리 추가를 누를경우...
		해당 항목을 지우고 변경해주는 작업이 필요하다.
		추가로 Drag & Drop 기능까지?
		
		우클릭 시, 하위메뉴 추가, 카테고리 삭제. 나타내고 선택하도록.
		처음 생성할 때부터 하위 메뉴를 갖는 카테고리입니까 물어보고 해야겠네.
		 -->
		
	</div>
</nav>