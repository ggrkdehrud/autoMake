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

function fn_getTableField(){
	var table = "<div id = 'outer_board' style = 'width:100%; height:400px; border: 1px solid black; background-color: white' onmousemove = 'zzz(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<div id = 'inner_board' style = 'z-index: 2; width:350px; height:350px; border: 1px solid black; background-color: white' onmousemove = 'zzz(this)' onmouseout = 'fn_outDiv(this)'>"
				+"<table style = 'width:100%; height: 100%; text-align: center; margin-left: auto; margin-right: auto;'><colgroup><col width='20%' /><col width='20%' /><col width='20%' /><col width='*' /><col width='20%' /></colgroup>"
			    +"<thead><tr><th>Num</th><td>Name</td><td>ID</td><td>Mobile</td><td>Etc</td></tr></thead><tbody><tr><th>1</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
			    +"<tr><th>2</th><td>Naul</td><td>BrowneyedSoul</td><td>010-1324-3546</td><td>Singer</td></tr><tr><th>3</th><td>Ingza</td><td>INGZA</td><td>010-1234-5678</td><td>Publisher</td></tr>"
				+"</tbody></table></div></div>";
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

function fn_createDBTable(arr){
	var content = "";
	// table 생성 쿼리문을 작성해야한다.
	// 이건... 사용자가 하도록 만들어야겠네
	// 쿼리문만 만들어서 내보내주는 용도!
	
	return null;
}

function fn_createController(name, arr){
	var content = "";
	
	
	return content;
}

function fn_createService(name){
	var content = "package set.set.set.service\n"
	+"import set.set.set.bean."+name+"Bean\n\n"
	+"public interface "+name+"Service {\n"
	+"public "+name+"Bean readData("+name+"Bean "+name+"Bean);\n"
	+"\tpublic void insertData("+name+"Bean "+name+"Bean);\n"
	+"\tpublic void deleteData("+name+"Bean "+name+"Bean);\n"
	+"\tpublic void updateData("+name+"Bean "+name+"Bean);\n"
	+"}";
	
	return content;
}

function fn_createServiceImpl(){
	
	
	return null;
}

function fn_createDao(){
	var content = "package set.set.set.dao\n"
	+"import set.set.set.bean."+name+"Bean\n\n"
	+"public interface "+name+"Service {\n"
	+"public "+name+"Bean readData("+name+"Bean "+name+"Bean);\n"
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


/*!function( $ ){

	  "use strict"

	  CSS TRANSITION SUPPORT (https://gist.github.com/373874)
	  * ======================================================= 

	  var transitionEnd

	  $(document).ready(function () {

	    $.support.transition = (function () {
	      var thisBody = document.body || document.documentElement
	        , thisStyle = thisBody.style
	        , support = thisStyle.transition !== undefined || thisStyle.WebkitTransition !== undefined || thisStyle.MozTransition !== undefined || thisStyle.MsTransition !== undefined || thisStyle.OTransition !== undefined
	      return support
	    })()

	    // set CSS transition event type
	    if ( $.support.transition ) {
	      transitionEnd = "TransitionEnd"
	      if ( $.browser.webkit ) {
	      	transitionEnd = "webkitTransitionEnd"
	      } else if ( $.browser.mozilla ) {
	      	transitionEnd = "transitionend"
	      } else if ( $.browser.opera ) {
	      	transitionEnd = "oTransitionEnd"
	      }
	    }

	  })


	  MODAL PUBLIC CLASS DEFINITION
	  * ============================= 

	  var Modal = function ( content, options ) {
	    this.settings = $.extend({}, $.fn.modal.defaults, options)
	    this.$element = $(content)
	      .delegate('.close', 'click.modal', $.proxy(this.hide, this))

	    if ( this.settings.show ) {
	      this.show()
	    }

	    return this
	  }

	  Modal.prototype = {

	      toggle: function () {
	        return this[!this.isShown ? 'show' : 'hide']()
	      }

	    , show: function () {
	        var that = this
	        this.isShown = true
	        this.$element.trigger('show')

	        escape.call(this)
	        backdrop.call(this, function () {
	          var transition = $.support.transition && that.$element.hasClass('fade')

	          that.$element
	            .appendTo(document.body)
	            .show()

	          if (transition) {
	            that.$element[0].offsetWidth // force reflow
	          }

	          that.$element.addClass('in')

	          transition ?
	            that.$element.one(transitionEnd, function () { that.$element.trigger('shown') }) :
	            that.$element.trigger('shown')

	        })

	        return this
	      }

	    , hide: function (e) {
	        e && e.preventDefault()

	        if ( !this.isShown ) {
	          return this
	        }

	        var that = this
	        this.isShown = false

	        escape.call(this)

	        this.$element
	          .trigger('hide')
	          .removeClass('in')

	        $.support.transition && this.$element.hasClass('fade') ?
	          hideWithTransition.call(this) :
	          hideModal.call(this)

	        return this
	      }

	  }


	  MODAL PRIVATE METHODS
	  * ===================== 

	  function hideWithTransition() {
	    // firefox drops transitionEnd events :{o
	    var that = this
	      , timeout = setTimeout(function () {
	          that.$element.unbind(transitionEnd)
	          hideModal.call(that)
	        }, 500)

	    this.$element.one(transitionEnd, function () {
	      clearTimeout(timeout)
	      hideModal.call(that)
	    })
	  }

	  function hideModal (that) {
	    this.$element
	      .hide()
	      .trigger('hidden')

	    backdrop.call(this)
	  }

	  function backdrop ( callback ) {
	    var that = this
	      , animate = this.$element.hasClass('fade') ? 'fade' : ''
	    if ( this.isShown && this.settings.backdrop ) {
	      var doAnimate = $.support.transition && animate

	      this.$backdrop = $('<div class="modal-backdrop ' + animate + '" />')
	        .appendTo(document.body)

	      if ( this.settings.backdrop != 'static' ) {
	        this.$backdrop.click($.proxy(this.hide, this))
	      }

	      if ( doAnimate ) {
	        this.$backdrop[0].offsetWidth // force reflow
	      }

	      this.$backdrop.addClass('in')

	      doAnimate ?
	        this.$backdrop.one(transitionEnd, callback) :
	        callback()

	    } else if ( !this.isShown && this.$backdrop ) {
	      this.$backdrop.removeClass('in')

	      $.support.transition && this.$element.hasClass('fade')?
	        this.$backdrop.one(transitionEnd, $.proxy(removeBackdrop, this)) :
	        removeBackdrop.call(this)

	    } else if ( callback ) {
	       callback()
	    }
	  }

	  function removeBackdrop() {
	    this.$backdrop.remove()
	    this.$backdrop = null
	  }

	  function escape() {
	    var that = this
	    if ( this.isShown && this.settings.keyboard ) {
	      $(document).bind('keyup.modal', function ( e ) {
	        if ( e.which == 27 ) {
	          that.hide()
	        }
	      })
	    } else if ( !this.isShown ) {
	      $(document).unbind('keyup.modal')
	    }
	  }


	  MODAL PLUGIN DEFINITION
	  * ======================= 

	  $.fn.modal = function ( options ) {
	    var modal = this.data('modal')

	    if (!modal) {

	      if (typeof options == 'string') {
	        options = {
	          show: /show|toggle/.test(options)
	        }
	      }

	      return this.each(function () {
	        $(this).data('modal', new Modal(this, options))
	      })
	    }

	    if ( options === true ) {
	      return modal
	    }

	    if ( typeof options == 'string' ) {
	      modal[options]()
	    } else if ( modal ) {
	      modal.toggle()
	    }

	    return this
	  }

	  $.fn.modal.Modal = Modal

	  $.fn.modal.defaults = {
	    backdrop: false
	  , keyboard: false
	  , show: false
	  }


	  MODAL DATA- IMPLEMENTATION
	  * ========================== 

	  $(document).ready(function () {
	    $('body').delegate('[data-controls-modal]', 'click', function (e) {
	      e.preventDefault()
	      var $this = $(this).data('show', true)
	      $('#' + $this.attr('data-controls-modal')).modal( $this.data() )
	    })
	  })

	}( window.jQuery || window.ender );*/