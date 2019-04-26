function fn_getTableField(){
	var table = "<div id = 'outer_board' style = 'width:100%; height:400px; border: 1px solid black; background-color: white' onmousemove = 'zzz(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<div id = 'inner_board' style = 'z-index: 2; width:100%; height:350px; border: 1px solid black; background-color: white' onmousemove = 'zzz(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<table style = 'width:100%; height: 100%; text-align: center; margin-left: auto; margin-right: auto;'><colgroup><col width='20%' /><col width='20%' /><col width='20%' /><col width='*' /><col width='20%' /></colgroup>"
			    +"<thead>" 
			    +"<tr><th>Num</th><td>Name</td><td>ID</td><td>Mobile</td><td>Etc</td></tr>" 
			    +"</thead>"
			    +"<tbody>"
			    +"<c:forEach var='result' items='${result}' varStatus='status'>"
			    +"<tr><th>${result.id}</th><td>${result.title}</td><td>${result.content}</td><td>${result.phone}</td><td>${result.etc}</td></tr>"
			    +"</c:forEach>"
			    /*+"<tr><th>1</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
			    +"<tr><th>2</th><td>Naul</td><td>BrowneyedSoul</td><td>010-1324-3546</td><td>Singer</td></tr><tr><th>3</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"*/
				+"</tbody>" 
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
		
		frm.target = "por"; // iframe의 이름
		frm.action = "write ?name="+category;
		frm.submit();
		
		$(".navbar-nav").append("<li onmousedown = 'fn_liDown(this)'><a href='"+category+".jsp'>"+category+"</a></li>");
		//이곳에서 속성 다시 지정.
		
		
		//파일 만들어주고 기본값만 셋팅해주고 끝내기
		
	}else if(tempValue == 1){
		// 팝업창 생성해서 
		
		//$('#myModal').modal(true);
			
		var contents = fn_getTableField();
		
		//alert(fn_createServiceImpl("home"));
		
		$("#main_right_middle").append(contents);
		// 현재 참조하고 있는 페이지가 무엇인지. 이건 가능할듯.
		/* $("html").html(); */
		
		var arr = ["id","title"];
		//var header_contents = fn_createBean("home", arr);
		var header_contents = fn_createServiceImpl("home");
		
		frm.target = "por"; // iframe의 이름
		frm.action = "write?header_contents="+encodeURI(encodeURIComponent(contents))+"&page="+nowPage;
		frm.submit();
		
		
		
	}else if(tempValue == 2){
		
		var contents = fn_getPhotoField();
			
		$("#main_right_middle").append(contents);
	}else if(tempValue == 3){
		
		console.log('3');
		var header_contents = $("#main_right_head").html();
		
		frm.target = "por"; // iframe의 이름
		frm.action = "index.jsp?header_contents="+encodeURI(encodeURIComponent(header_contents))+"page="+nowPage;
		frm.submit();
		
	}
}

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
	console.log("##");
	$("div").not(obj).css("z-index", "1");
	$(obj).css("z-index", "2");
}

function fn_nowPage(name){
	nowPage = name;
}

