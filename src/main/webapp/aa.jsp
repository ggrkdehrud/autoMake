<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

</head>
<body>

<!-- 
<canvas id="canvas" width="1200" height="900" style="border: 4px dashed #bcbcbc;"></canvas>
 -->
 
 <div id = "a" style = "width:1400px; height: 900px; border: 1px solid; position: relative"></div>
 
 
<script type="text/javascript">

var array = new Array();
var whiteArray = new Array();
$(document).ready(function() {
	startCanvas();
	//var array = new Array();
});

function startCanvas(){
	var canvas = document.getElementById('a');
	
	//var ctx = canvas.getContext('2d');
	
	var a = $('#a');
	
	var k = 0;
	var row = 14;
	var cel = 9;
	var count = row*cel;
	var width = (a.width()-row*2) / row;
	var height = (a.height()-cel*2) / cel;
	
	var content = "<div style='width:"+width+"px; height:"+height+"px; border: 1px solid; float: left; position: relative' onmouseover=onMouse(this) onmouseout=leaveMouse(this)></div>";
	
	//var array = Array(Array(), Array());
	/* for(i = 0; i < count; i++){
		a.append(content);
	} */
	
	//var array = new Array();
	
	for(var i = 0; i < cel; i++){
		array[i] = new Array();
		for(var j = 0; j < row; j++){
			a.append($(content));
			console.log(i+" "+j);
			var tempContent = a.children()[k++];
			$(tempContent).val(i+" "+j);
			array[i][j] = tempContent;
		}
	}
	
	console.log("##");
}

function onMouse(obj){
	whiteArray = new Array();
	var cel = $(obj).val().split(" ")[0];
	var row = $(obj).val().split(" ")[1];
	
	if((row == 13) || (cel == 8)){
		if((row == 13) && (cel == 8)){
			$(array[cel][row]).css('background','red');
			whiteArray[0] = $(array[cel][row]);
		}else if(row == 13){
			$(array[cel][row]).css('background','red');
			$(array[parseInt(cel)+1][row]).css('background','red');
			
			whiteArray[0] = $(array[cel][row]);
			whiteArray[1] = $(array[parseInt(cel)+1][row]);
		}else{
			$(array[cel][row]).css('background','red');
			$(array[cel][parseInt(row)+1]).css('background','red');
			
			whiteArray[0] = $(array[cel][row]);
			whiteArray[1] = $(array[cel][parseInt(row)+1]);
		}
	}else{
		$(array[cel][row]).css('background','green');
		$(array[cel][parseInt(row)+1]).css('background','green');
		$(array[parseInt(cel)+1][row]).css('background','green');
		$(array[parseInt(cel)+1][parseInt(row)+1]).css('background','green');
		
		whiteArray[0] = $(array[cel][row]);
		whiteArray[1] = $(array[cel][parseInt(row)+1]);
		whiteArray[2] = $(array[parseInt(cel)+1][row]);
		whiteArray[3] = $(array[parseInt(cel)+1][parseInt(row)+1]);
	}
}

function leaveMouse(obj){
	for(var i = 0; i < whiteArray.length; i++){
		whiteArray[i].css('background','white');
	}
}

</script>



</body>
</html>