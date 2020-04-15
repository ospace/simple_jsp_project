var com = {

	/**
	 * 숫자 체크
	 */
	isNumber : function(str){
		var reg =  /^[0-9]+$/ ;
		return reg.test(str);
	},
	
	/**
	 * 메일 체크
	 */
	isEmail : function(str){
		var reg = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/ ;
		return reg.test(str);
	},
	
	//달력
	calendar : function(id,obj){
		
		var options = {
			    format: "yyyy-mm-dd",
			    todayBtn: "linked",
			    language: "kr",
			    keyboardNavigation: false,
			    forceParse: false,
			    todayHighlight: true,
			    autoclose : true
		};
		$.extend(options, obj);
		
		 $('#' + id).datepicker(options);
	},
	
	/**
	 * Ajax 요청
	 */
	requestAjax : function(obj, callbackFnc){
		
		var options = {
				type : "GET", 
				async : true,
				params : {}
			};
		$.extend(options, obj);
		
		 $.ajax({      
	    	type : options.type,  
	    	async : options.async,
	    	url : options.url,
	    	contentType: options.contentType,
	        data : options.params,
	        beforeSend : function(xhr){
				xhr.setRequestHeader("AJAX", "true");
		    },
	        success : function(response){   
	        	data = response;
	        	if( typeof callbackFnc ===  "function") callbackFnc(data);
	        },   
	        error : function(xhr) {
	        	if(xhr.status == "403"){
	        		document.location.href = "/main";
	        	}else{
	    	        alert("에러 : " + xhr.status);
		       	}
	        }
	    });  
	 
	},
	
	
	/**
	 * 윈도우 팝업창
	 */
	wPopup : function(params){
		
		var options = {
			title : "관리도구",
			width : 600,
			height : 400,
			scrollbars : "no"
		};
		
		$.extend( options, params );
		
		var left = (screen.width/2)-(options.width /2);
		var top = (screen.height/2)-( options.height /2);
		if( options.left != undefined ) left = left +  options.left;
		if( options.top != undefined ) top = top +  options.top; 
		
		var winObj = window.open(options.url, options.title.replace(/ /g,'_'), 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=' + options.scroll + ', width='+options.width+', height='+options.height+', top='+top+', left='+left);
		winObj.document.title = options.title
	},
	
	 formatBytes : function(a,b){
		if(0==a)return"0 Bytes";
		var c=1024,
		d=b||2,e=["Bytes","KB","MB","GB","TB","PB","EB","ZB","YB"],
		f=Math.floor(Math.log(a)/Math.log(c));
		return parseFloat((a/Math.pow(c,f)).toFixed(d))+" "+e[f]
	},
	
	formatNumber : function(p){
	    return p.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	},
	setFormatNumber : function(obj){
		$(obj).val( $(obj).val().replace(/,/g,'').replace(/\B(?=(\d{3})+(?!\d))/g, ",") );
	},

	
	/**
	 * 에디터
	 */
	editor : function(id){
		//http://summernote.org/
		$('#' + id).summernote({
	 		toolbar: [
	 		    ['style', ['bold', 'italic', 'underline', 'clear']], 
	 		    ['fontname', ['fontname']], 
	 		    ['fontsize', ['fontsize']],
	 		    ['color', ['color']],
	 		    ['table', ['table']],
	 		    ['para', ['ul', 'ol', 'paragraph']],
	 		    ['height', ['height']],
	 		    ['codeview',['codeview']], 
	 		  ],
			height: 400,                
			lang: 'ko-KR',
			fontNames: ['맑은 고딕', '굴림체','돋움체','바탕체','궁서체','Arial Black', 'Comic Sans MS', 'Courier New', 'Merriweather']
		});
	 
	 	$('#' + id).summernote('fontName', '맑은 고딕');
	},
	

	
	/**
	 * 레이어 팝업
	 * https://stephanwagner.me/jBox
	 */
	jboxPopup : null,
	popup : function(obj){
		
		if( this.jboxPopup != null ) this.jboxPopup.destroy();
		
		var options = {
				title : '&nbsp;',			// 제목
				width : 600,			// 너비
				height : 400,			// 높이
				zIndex : 9999,			
				content : "",
			};
		
		$.extend( options, obj );
	
		this.jboxPopup = new jBox('Modal', {
			draggable: 'title',
			width: options.width,
			height: options.height,
			animation: false,
			closeButton: 'title',
			title: options.title,
			zIndex : options.zIndex,
			closeOnClick: false,			//클릭시 안 닫힘
		});
		
		if(obj.url != undefined){
			this.requestAjax({
				type : options.type,
				url : options.url,
				async : false,
				params : options.params
			},function(data){
				options.content =data;
			});
		}
		
		this.jboxPopup.setContent(options.content);
		this.jboxPopup.open();
	},
	popupClose : function(){
		this.jboxPopup.close();
	},
	
	
	/**
	 * 알림 레이어
	 */
	notice : function(msg){
		new jBox('Notice', {
			  content: msg,
			  color: 'black',
			  autoClose: 2000,
			  position: {
			      x: 'center',
			      y: 'top'
			  },
			  offset: {
			      y: 20
			  },
		});
	},
	
	/**
	 * 확인 창 레이어
	 */
	jboxConfirm : null,
	confirm : function(obj) {
		
		if(this.jboxConfirm != null) this.jboxConfirm.destroy();
			
		this.jboxConfirm = new jBox('Confirm', {
			  confirmButton: '확인',
			  cancelButton: '취소',
			  content : obj.content,
			  confirm : obj.confirm,
			  cancel : obj.cancel,
		});
		
		this.jboxConfirm.open();
	},
	confirmClose : function(){
		this.jboxConfirm.destroy();
	},
	
	/**
	 * 폼 Validation 체크
	 */
	validation : function(selector) {
		var result = true;
		
		$(selector).find(".required").each(function(idx){
			
			var value = "";
			
			var $this = $(this);
			var $tdObj = $this.next();
			var $obj = $tdObj.find('input, select, textarea');
				
			if($obj.length < 1) return result;
			
			if( $obj.attr("type") == "radio" ){
				$obj = $tdObj.find( 'input[id=' + $obj.attr("id") + ']' );
				for( var i = 0; i < $obj.length; i++){
					if( $obj[i].checked ) value = "checked";				
				}
			}else{
				if( typeof $obj[0].getValue == 'function' ){
					value = $obj[0].getValue();
				}else{
					value = $obj.val();
				}
			}
			
			if( value == undefined || value == "" ){
				com.notice($this.text() +  " 값은 필수입니다.");
				$obj.focus();
				result = false;
				return false;
			}
			
		});
		
		return result;
	},
	

	loading : function(selector) {
		
		if( $("#loading").length > 0 ) this.loadingClose();
		
		var height = $(selector).height();
		var width = $(selector).width();
		var top = $(selector).offset().top;
		
		var html = "<div id='loading' style='z-index:10000;top:" + top + "px;height:" + height + "px;'>" 
					+ "	<div class='loading-cell'>"
					+ "	<div class='loading-box'>"
					+	"		<p><img src='/static/image/loading.svg' width='30' height='30'></p><p>loading ...<p>"
					+ "	</div>"
					+ "	</div>"
					+ "</div>"
		
		$("body").append(html); 
	},
	
	
	
	loadingClose : function() {
		$("#loading").remove();
	},
	
	/**
	 *  리스트 데이터 Object  MVC 에서 받을 수 있는 Object  로 변환
	 *  dataList[0].dataTitle : 'abcd'
	 *  dataList[1].dataTitle : 'efgh'
	 *  ...
	 */
	converListToObject : function(name, objList){
		
		var obj = {};
		$(objList).each(function(i,val){
		    $.each(val,function(k,v){
		        obj[name + "[" + i + "]." + k] = v;
			});
		    
		});
		//console.log( obj )
		return obj
		
	},
	
	/**
	 * textarea 높이 내용에 맞게 조정
	 */
	autoHeight : function(obj){
		$(obj).height( $(obj).prop("scrollHeight") + 16)
	}
	
};

//--------------------------------------------------------------------  Jquery plugin
/**
 * 함수 토글
 */
$.fn.clickToggle = function(func1, func2) {
    var funcs = [func1, func2];
    this.data('toggleclicked', 0);
    this.click(function() {
        var data = $(this).data();
        var tc = data.toggleclicked;
        $.proxy(funcs[tc], this)();
        data.toggleclicked = (tc + 1) % 2;
    });
    return this;
};

/**
 * form data To Object
 */
jQuery.fn.serializeObject = function() {
    var obj = null;
    try {
        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
            var arr = this.serializeArray();
            if (arr) {
                obj = {};
                jQuery.each(arr, function() {
                    obj[this.name] = this.value;
                });
            }
        }
    } catch (e) {
        alert(e.message);
    }
 
    return obj;
};



