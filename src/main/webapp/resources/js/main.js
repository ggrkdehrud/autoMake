
var menuList = new Array();
//main_right_head_photo
//menuList[0] = "<div class = 'main_right_head_menu'>MENU</div>";
menuList[0] = "<li><a href='#'>Page 5</a></li>";
menuList[1] = "<div class = 'main_right_head_photo'></div>";	
menuList[2] = "<div class = 'main_right_head_board'>BOARD</div>";









var query = "여기서는 서버에서 받아와서 뿌려주는 코드를 짜야겠구나.";
//게시판이든 뭐든 원하는 형태로 만들 수 있도록 해줘야함.
var i = 0;
var query = "<div class = 'photo_box'>"+query+"</div>";


var temp_query = "<div class = 'table'>"+
"<table><tr><td>dd</td></tr></table>"+
"</div>";


//서버와 통신하는 공통 모듈을 만들어놓으면 좋겠다
function fn_data(){
	
}


function fn_onClickItem(item){
	//item.style.backgroundColor = "black";
}

function fn_onMouseEnter(mouse){
	mouse.style.cursor = "pointer";
}