function fn_outDiv(obj){
	/*if(obj.value == "resizing"){
		return false;
	}else{
		$("#main").css('cursor', 'default');
		obj.value = "";
	}*/
	
	
	// 이곳에서도 동시에 진행중이라는것을 알려줘야함.
	
	if(obj.id == "inner_board"){
		nowInnerObject = null;
		//console.log("out");
	}
}

function zzz(obj){
	if(obj.id == "inner_board"){
		nowInnerObject = obj;
	}else{
		if(nowInnerObject != null){
			return false;
		}else{
			
		}
	}
	
	var x = event.pageX;
	var y = event.pageY; 
	var width = obj.offsetWidth;
	var height = obj.offsetHeight;
	var top = obj.offsetTop;
	var left = obj.offsetLeft;
	
	/*if(obj.id == "inner_board"){
		console.log("X: "+x);
		console.log("result: "+(left));
		console.log("inner: "+$("#inner_board").offset().left);
	}*/
	if((x <= (left + width) && x >= ((left + width) -7)) && (y <= (top + height) && y >= ((top + height) -7))){
		$("#main").css('cursor', 'nw-resize');
		//우측 하단
		console.log("@@@");
		obj.onmousedown = function(){
			if(obj.id == "inner_board"){
				nowInnerObject = obj;
			}else{
				if(nowInnerObject != null){
					return false;
				}
			}
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
			if(obj.id == "inner_board"){
				nowInnerObject = obj;
			}else{
				if(nowInnerObject != null){
					return false;
				}
			}
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
			if(obj.id == "inner_board"){
				nowInnerObject = obj;
			}else{
				if(nowInnerObject != null){
					return false;
				}
			}
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
			if(obj.id == "inner_board"){
				nowInnerObject = obj;
			}else{
				if(nowInnerObject != null){
					return false;
				}
			}
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
		//fn_outDiv(obj);

		obj.onmousedown = function(){
			if(obj.id == "inner_board"){
				nowInnerObject = obj;
			}else{
				if(nowInnerObject != null){
					return false;
				}
			}
			
			$("#main").css('cursor', 'move');
			// 이곳에서 obj를 설정해줘야되. 개발모드라는 뜻. 내부에 값을 넣어놓진 말자 아직까진!
			var click_x = event.pageX;
			var click_y = event.pageY; 
			obj.value = "resizing";
			nowObject = obj;
			//$("div").not(obj).css("z-index", "1");
			//$(obj).css("z-index", "2");

			window.onmousemove = function(e){
				if(nowObject == null){
					e.preventDefault();
					return false;
				}
				var x = event.pageX;
				var y = event.pageY;

				var real_distance_x = click_x - left;
				var real_distance_y = click_y - top;
				
				if(obj.id == "outer_board"){
					//var inner_board1 = document.getElementById('inner_board');
					var inner_board = $("#inner_board");
					//var temp_top = inner_board.offset().top;
					//var temp_left = inner_board.offset().left;
					//console.log(inner_board.offset().top);
					//inner_board1.style.top = 50+'px';
					//inner_board1.style.left = 50+'px';
					inner_board.offset({top: 50});
					inner_board.offset({left: 50});
					console.log("@@@@");
					
					//console.log("##");
				}
				
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

function fn_enterDiv(obj){
	//console.log(obj);
	if(obj.id == "inner_board"){
		nowInnerObject = obj;
	}else{
		if(nowInnerObject != null){
			return false;
		}
	}
	obj.onmousemove = function(){
		var x = event.pageX;
		var y = event.pageY; 
		var width = obj.offsetWidth;
		var height = obj.offsetHeight;
		var top = obj.offsetTop;
		var left = obj.offsetLeft;
		
		//console.log(obj);
		
		if((x <= (left + width) && x >= ((left + width) -7)) && (y <= (top + height) && y >= ((top + height) -7))){
			$("#main").css('cursor', 'nw-resize');
			//우측 하단
			
			obj.onmousedown = function(){
				if(obj.id == "inner_board"){
					nowInnerObject = obj;
				}else{
					if(nowInnerObject != null){
						return false;
					}
				}
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
				/*$("div").not(obj).css("z-index", "1");
				$(obj).css("z-index", "2");*/

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