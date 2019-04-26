function fn_onReady(){
	var object = document.getElementById("main_right_middle");
	var x = object.offsetTop;
	var y = object.offsetLeft;
	var middle_width = object.offsetWidth;
	var middle_height = object.offsetHeight;
	var scrollT = $(this).scrollTop();
	var scrollW = $(this).width();
	var scrollH = $(window).height();
	nowObject = null;
	nowInnerObject = null;
	nowPage = "index";
	
	$("#circle").offset({top: scrollT+scrollH - 150});
	$("#circle").offset({left: scrollW - 150});

	$(window).resize(function() {
		var object = document.getElementById("main_right_middle");
		var x = object.offsetTop;
		var y = object.offsetLeft;
		var middle_width = object.offsetWidth;
		var middle_height = object.offsetHeight;
		var scrollT = $(this).scrollTop();
		var scrollW = $(this).width();
		var scrollH = $(this).height();
		
		$("#circle").offset({top: scrollT+scrollH - 150});
		$("#circle").offset({left: scrollW - 150});
	});
	
	$(window).scroll(function() {
		var scrollT = $(this).scrollTop();
		var scrollW = $(this).width();
		var scrollH = $(this).height();
        
        $("#circle").offset({top: scrollT+scrollH - 150});
		$("#circle").offset({left: scrollW - 150});
        
	});
}

function fn_addPhoto(){
	alert("Show Modal!!");
}

//서버와 통신하는 공통 모듈을 만들어놓으면 좋겠다
function fn_data(){

}

function fn_liUp(obj){
	if(event.which != 3){
		nowPage = obj.text;
		console.log(nowPage);
		//frm.target = "por"; // iframe의 이름
		frm.action = "go?nowPage="+nowPage;
		frm.submit();
	}
}


function fn_onClickItem(item){
	//item.style.backgroundColor = "black";
}

function fn_onMouseEnter(mouse){
	mouse.style.cursor = "pointer";
}
