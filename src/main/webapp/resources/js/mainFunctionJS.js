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

function fn_onFocus(obj){
	$("div").click(function() {
		  $("div").not(obj).css("z-index", "1")
		  $(obj).css("z-index", "2")
	});
}

function fn_addPhoto(){
	alert("Show Modal!!");
}

//서버와 통신하는 공통 모듈을 만들어놓으면 좋겠다
function fn_data(){

}


function fn_onClickItem(item){
	//item.style.backgroundColor = "black";
}

function fn_onMouseEnter(mouse){
	mouse.style.cursor = "pointer";
}