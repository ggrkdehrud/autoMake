<%@ page language='java' contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'%>
<nav class="navbar navbar-default navbar-fixed-top">
	<!-- Brand and toggle get grouped for better mobile display -->
	<div class="navbar-header">
		<button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a href="#" class="navbar-brand">Brand</a>
	</div>
	<!-- Collection of nav links and other content for toggling -->
	<div id="navbarCollapse" class="collapse navbar-collapse">
		<ul class="nav navbar-nav">
			<li class="active"><a href="#">Home</a></li>
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">Page 1-1</a></li>
					<li><a href="#">Page 1-2</a></li>
					<li><a href="#">Page 1-3</a></li>
				</ul>
			</li>
		<li onmousedown="fn_liDown(this)"><a href="히릿.jsp">히릿</a></li></ul>
	</div>
</nav>