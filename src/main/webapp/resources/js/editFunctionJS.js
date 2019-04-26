function fn_getInnerTableField(arr){
	//입력받은 값으로 Field를 구현하는 코드를 작성해야 한다.
	var width = 100/arr.length;
	
	var table = "<table style = 'width:100%; height: 100%; text-align: center; margin-left: auto; margin-right: auto;'>"
			   +"<colgroup>";
	
	for(var i = 0; i < arr.length; i++){
		table += "<col width='"+width+"%' />";
	}
	
		table += "</colgroup>"
				+"<thead>"
			    +"<tr>";
		
	for(var i = 0; i < arr.length; i++){
		table += "<td>"+arr[i]+"</td>";
	}
		table += "</tr>"
			    +"</thead>"
			    +"<tbody>"
			    +"</tbody>"
			    //+"<c:if test='${result.size() == 0 }'>"
			    +"<tfoot>"
			    +"<tr>"
			    +"<td colspan='5'>현재 데이타가 없습니다.</td>"
			    +"</tr>"
			    +"</tfoot>"
			    //+"</c:if>"
				+"</table>";
	
	return table;
}

function fn_getTableField(arr){
	//입력받은 값으로 Field를 구현하는 코드를 작성해야 한다.
	var width = 100/arr.length;
	
	var table = "<div id = 'outer_board' style = 'width:100%; height:400px; border: 1px solid black; background-color: white' onmousemove = 'fn_moveDiv(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<div id = 'inner_board' style = 'z-index: 2; width:100%; height:350px; border: 1px solid black; background-color: white' onmousemove = 'fn_moveDiv(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<table style = 'width:100%; height: 100%; text-align: center; margin-left: auto; margin-right: auto;'>"
				+"<colgroup>";
	
	for(var i = 0; i < arr.length; i++){
		table += "<col width='"+width+"%' />";
	}		    
	
		table += "</colgroup>"
				+"<thead>"
			    +"<tr>";
	
	for(var i = 0; i < arr.length; i++){
		table += "<td>"+arr[i]+"</td>";
	}
		table += "</tr>"
			    +"</thead>"
			    +"<tbody>"
			    +"</tbody>"
			    //+"<c:if test='${result.size() == 0 }'>"
			    +"<tfoot>"
			    +"<tr>"
			    +"<td colspan='5'>현재 데이타가 없습니다.</td>"
			    +"</tr>"
			    +"</tfoot>"
			    //+"</c:if>"
				+"</table></div></div>";
	
	return table;
}

function fn_getPhotoField(){
	var photo = "<div id = 'add' style = 'width:800px; height:800px; border: 1px solid black; background-color: white' onmouseenter = 'fn_enterDiv(this)' onmouseout = 'fn_outDiv(this)'>"
		+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\1.jpg' width=100% height=100%></div></div>"
		+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\2.jpg' width=100% height=100%></div></div>"
		+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\3.jpg' width=100% height=100%></div></div>"
		+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\4.jpg' width=100% height=100%></div></div>"
		+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\5.jpg' width=100% height=100%></div></div>"
		+"<div style='width:200px; height:250px; display:inlie-block; float: left'><div style='width:182px; height: 230px'><img src='resources\\images\\6.jpg' width=100% height=100%></div></div>"
		+"</div>";
	
	return photo;
}

function fn_createDBTable(name, arr){
	var content = "";
	// table 생성 쿼리문을 작성해야한다.
	// 이건... 사용자가 하도록 만들어야겠네
	// 쿼리문만 만들어서 내보내주는 용도!
	
	return null;
}

function fn_createMybatis(name, arr){
	
}

function fn_createController(name, arr){
	var content = "";
	
	
	return content;
}

function fn_createService(name){
	var content = "package set.set.set.service\n"
	+"import java.util.ArrayList;\n"
	+"import set.set.set.bean."+name+"Bean\n\n"
	+"public interface "+name+"Service {\n"
	+"public ArrayList<"+name+"Bean> readAllData();\n"
	+"public "+name+"Bean readData(String primaryKey);\n"
	+"\tpublic void insertData("+name+"Bean "+name+"Bean);\n"
	+"\tpublic void deleteData("+name+"Bean "+name+"Bean);\n"
	+"\tpublic void updateData("+name+"Bean "+name+"Bean);\n"
	+"}";
	
	return content;
}

function fn_createServiceImpl(name){
	var big_name = name.substring(0,1).toUpperCase()+name.substring(1, name.length);
	var content = "package set.set.set.service\n"
	+"import java.lang.reflect.Method;\n"
	+"import javax.annotation.Resource;\n"
	+"import org.springframework.stereotype.Service;\n"
	+"import set.set.set.bean."+big_name+"Bean;\n"
	+"import set.set.set.dao."+big_name+"Dao;\n"
	+"import set.set.set.service."+big_name+"Service;\n\n"
	+"@Service('"+big_name+"Service')\n"
	+"public class "+big_name+"ServiceImpl implements "+big_name+"Service{\n"
	+"\t@Resource(name="+big_name+"Dao)\n"
	+"\tprivate "+big_name+"Dao "+name+"Dao;\n"
	+"\t@Override\n"
	+"\tpublic ArrayList<"+big_name+"Bean> readAllData() {\n"
	+"\t\treturn null;\n"
	+"\t}\n"
	+"\t@Override\n"
	+"\tpublic "+big_name+"Bean readData(String primaryKey) {\n"
	+"\t\treturn null;\n"
	+"\t}\n"
	+"\t@Override\n"
	+"\tpublic void insertData("+big_name+"Bean "+name+"Bean) {\n"
	+"\t\t"+name+"Dao.insertData("+name+"Bean);\n"
	+"\t}\n"
	+"\t@Override\n"
	+"\tpublic void deleteData("+big_name+"Bean "+name+"Bean) {\n"
	+"\t\t"+name+"Dao.deleteData("+name+"Bean);\n"
	+"\t}\n"
	+"\t@Override\n"
	+"\tpublic void updateData("+big_name+"Bean "+name+"Bean) {\n"
	+"\t\t"+name+"Dao.updateData("+name+"Bean);\n"
	+"\t}\n"
	+"}";
	
	return content;
}

function fn_createDao(){
	var content = "package set.set.set.dao\n"
	+"import java.util.ArrayList;\n"
	+"import set.set.set.bean."+name+"Bean\n\n"
	+"public interface "+name+"Dao {\n"
	+"public ArrayList<"+name+"Bean> readAllData();\n"
	+"public "+name+"Bean readData(String primaryKey);\n"
	+"\tpublic void insertData("+name+"Bean "+name+"Bean);\n"
	+"\tpublic void deleteData("+name+"Bean "+name+"Bean);\n"
	+"\tpublic void updateData("+name+"Bean "+name+"Bean);\n"
	+"}";
	
	return content;
}

function fn_createDaoImpl(){
	
	
	return null;
}

function fn_createBean(name, arr){
	var content = "package set.set.set.bean;\n\n"
	+"class "+name+"Bean1 {\n";
	
	for(i = 0; i < arr.length; i++){
		content += "\tprivate String "+arr[i]+";\n";
		content += "\tpublic void set"+arr[i].substring(0,1).toUpperCase()+arr[i].substring(1, arr[i].length)+"(String "+arr[i]+") {\n"
		+"\t\tthis."+arr[i]+" = "+arr[i]+";\n"
		+"\t}\n"
		+"\tpublic String get"+arr[i].substring(0,1).toUpperCase()+arr[i].substring(1, arr[i].length)+"() {\n"
		+"\t\treturn this."+arr[i]+";\n"
		+"\t}\n"
	}
	content += "}";
	
	return content;
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
			if($(".navbar-nav").children().length >= 2){
				if(category == $(".navbar-nav").children()[i].children[0].text){
					alert("이미 동일한 이름의 카테고리가 존재합니다.");
					return;
				}
			}else{
				break;
			}
			
		}
		
		$(".navbar-nav").append("<li><a onmouseup='fn_liUp(this)' onmousedown = 'fn_liDown(this)'>"+category+"</a></li>");
		
		var header_contents = $("#main_right_head").html();
		
		frm.target = "por"; // iframe의 이름
		frm.action = "createCategory?name="+category+"&headerContent="+encodeURI(encodeURIComponent(header_contents.trim()));
		frm.submit();
		
		//이곳에서 속성 다시 지정.
		
		
		//파일 만들어주고 기본값만 셋팅해주고 끝내기
		
	}else if(tempValue == 1){
		// 팝업창 생성해서 
		$('#myModal .modal-body').eq(0).html("");
		$('#myModal .modal-body').eq(0).append("<input type='button' class='btn btn-success' onclick='fn_addValue(this)' value='추가'>");
		
		$('#myModal').modal(true);
		
		// 현재 참조하고 있는 페이지가 무엇인지. 이건 가능할듯.
		/* $("html").html(); */
		
		/*var arr = ["id","title"];
		//var header_contents = fn_createBean("home", arr);
		var header_contents = fn_createServiceImpl("home");
		
		frm.target = "por"; // iframe의 이름
		frm.action = "write?header_contents="+encodeURI(encodeURIComponent(contents))+"&page="+nowPage;
		frm.submit();*/
		
		
		
	}else if(tempValue == 2){
		$('#myModal .modal-body').eq(0).html("");
		
		//사진필드생성, 사진첩 생성. 두개를 나누는 checkbox를 만든다.
		
		
		
		$('#myModal').modal(true);
		
		
		/*var contents = fn_getPhotoField();
			
		$("#main_right_middle").append(contents);*/
	}else if(tempValue == 3){
		
		console.log('3');
		var header_contents = "";
		var middle_contents = $("#main_right_middle").html();
		var bottom_contents = "";
		var name = "파일럿";
		
		frm.target = "por"; // iframe의 이름
		frm.action = "BFWrite?header_contents="+encodeURI(encodeURIComponent(header_contents))+"&middle_contents="+encodeURI(encodeURIComponent(middle_contents))+"&bottom_contents="+bottom_contents+"&name="+name+"&page="+nowPage;
		frm.submit();
		
		//header 부분 middle 부분 bottom 부분 나눠서 query를 날리자.
	}
}

function fn_liDown(obj){
	if(event.which == 3){
		var delete_confirm = confirm("정말 삭제하시겠습니까?");
		
		if(delete_confirm){
			//우선 obj에 해당하는 파일을 삭제하고
			//header를 수정해주고
			
			$(obj.parentElement).remove();
			
			var header_contents = $("#main_right_head").html();
			
			frm.target = "por"; // iframe의 이름
			frm.action = "deleteCategory?name="+obj.text+"&headerContent="+encodeURI(encodeURIComponent(header_contents.trim()));
			frm.submit();
			//ajax가 나으려나?

			alert("삭제완료!");
		}
	}
}

function fn_onFocus(obj){
	$("div").not(obj).css("z-index", "1");
	$(obj).css("z-index", "2");
}

function fn_nowPage(name){
	nowPage = name;
}

function fn_deleteValue(obj){
	obj.parentElement.remove();
}

function fn_addValue(obj){
	var body_content = "<div class='form-group' draggable='true' ondragstart='fn_dragStartTableField(event, this)' ondragover='fn_onMouseEnterTableField(event, this)' ondragend='fn_dragEndTableField(event)''>"
		+"<label for='us'>항목</label>"
		+"<input type='text' class='form-control' id='usr_kor'>"
		+"<input type='button' class='btn btn-danger' onclick='fn_deleteValue(this)' value='삭제'>"
		+"</div>";
	
	obj.remove();
	$('#myModal .modal-body').eq(0).append(body_content);
	$('#myModal .modal-body').eq(0).append("<input type='button' class='btn btn-success' onclick='fn_addValue(this)' value='추가'>");
}

function fn_saveValue(obj){
	var valueArray = new Array();
	
	for(var i = 0; i < $('#myModal .modal-body')[0].children.length-1; i++){
		valueArray.push($('#myModal .modal-body')[0].children[i].children[1].value);
	}
	
	var addforEach = "<c:forEach var='result' items='${result}'>"
	    +"";
	    
	/*for(var i = 0; i < valueArray.length; i++){
		addforEach += "<td><c:out value='${result."+valueArray[i]+"}'/></td>";
	}*/
	    
		addforEach += ""
	    +"</c:forEach>";
	
	var add_value = "<tr>";
	
	for(var i = 0; i < valueArray.length; i++){
		add_value += "<td><c:out value='${result."+valueArray[i]+"}'/></td>";
	}
		add_value += "</tr>";
	//서버쪽먼저 처리해야한다. 서버쪽 처리하는 로직 구현해야한다.
	console.log(addforEach);
	if($(obj.parentElement.value).length == 0){
		var now_obj = $(fn_getTableField(valueArray));
		$("#main_right_middle").eq(0).append(now_obj);
		$($(now_obj)[0].children[0].children[0].children[2]).eq(0).append(addforEach);
		$($(now_obj)[0].children[0].children[0].children[2].children[0]).eq(0).append(add_value);
		
		$(obj.parentElement.parentElement.parentElement.parentElement).modal("hide");
		console.log($("#main_right_middle").html());
	}else{
		$(obj.parentElement.value.children[0]).remove();
		$(obj.parentElement.value).append(fn_getInnerTableField(valueArray));
		$(obj.parentElement.value.children[0].children[2]).append(addforEach);
		$(obj.parentElement.parentElement.parentElement.parentElement).modal("hide");
	}
}

function fn_onMouseEnterTableField(e, obj){
	e.preventDefault();
	console.log("@@@");
	if(obj == drag_obj){
		return false;
	}
	
	var temp_before_div = "<div id='temp-before-div' style='border-style:solid' class='form-group' ondrop='fn_dropTableField(event, this)' ondragleave='fn_dragLeaveTableField(event, this)' ondragover='fn_dragOverTableField(event, this)'>"
		+"<label for='us'> </label><br><br><br><br><br>"
		+"</div>";
	var temp_after_div = "<div id='temp-after-div' style='border-style:solid' class='form-group' ondrop='fn_dropTableField(event, this)' ondragleave='fn_dragLeaveTableField(event, this)' ondragover='fn_dragOverTableField(event, this)'>"
		+"<label for='us'> </label><br><br><br><br><br>"
		+"</div>";
	
	var x = event.pageX;
	var y = event.pageY;
	var width = $(obj).width();
	var height = $(obj).height();
	var top = $(obj).offset().top;
	var left = $(obj).offset().left;
	var p_width = $(obj).parent().width();
	var p_height = $(obj).parent().height();
	var p_top = $(obj).parent().offset().top;
	var p_left = $(obj).parent().offset().left;
	
	if((x >= width && (x <= (width + left))) && (y >= top && (y <= (top + (height/3))))){
		//console.log("1");
		
		if(obj != $(drag_obj).next()[0]){
			if($("#temp-after-div").length > 0){
				$("#temp-after-div").remove();
			}
			if($("#temp-before-div").length == 0){
				$(obj).before($(temp_before_div));
			}
		}else{
			return false;
		}
	}else if((x >= width && (x <= (width + left))) && (y >= (top + (height/3)) && (y <= (top + ((height/3)*2))))){
		//console.log("2");
		$("#temp-before-div").remove();
		$("#temp-after-div").remove();
	}else if((x >= width && (x <= (width + left))) && (y >= (top + ((height/3)*2)) && (y <= (top + ((height/3)*3))))){
		//console.log("3");
		if(obj != $(drag_obj).prev()[0]){
			if($("#temp-before-div").length > 0){
				$("#temp-before-div").remove();
			}
			if($("#temp-after-div").length == 0){
				$(obj).after($(temp_after_div));
			}
		}else{
			return false;
		}
	}
}

function fn_dragStartTableField(e, obj){
	drag_obj = obj;
}

function fn_dropTableField(e, obj){
	e.preventDefault();
	$(obj).after(drag_obj);
	$(obj).remove();
	drag_obj = null;
}

function fn_dragOverTableField(e, obj){
	e.preventDefault();
	$(obj).css("border-style","dashed");
}

function fn_dragEndTableField(e){
	e.preventDefault();
	$("#temp-before-div").remove();
	$("#temp-after-div").remove();
}

function fn_dragLeaveTableField(e, obj){
	e.preventDefault();
	$(obj).css("border-style","solid");
}

