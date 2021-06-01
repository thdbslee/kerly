
$(document).ready(function(){
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors
			, elPlaceHolder : "content"
			,sSkinURI : "/resources/naverEditor/SmartEditor2Skin.html"
			, fCreator : "createSEditor2"
			, htParams : 
				{
					bUseToolbar : true //툴바사용여부
					,bUseVerticalResizer : true //입력창 크기 조절바 사용여부
					,bUseModeChanger : false //모드탭
				}
			});
			
	
	oEditors.getById["content"].exec("UPDATE_IR_FIELD", []); 
	var content = document.getElementById("content").value;

});


var number = /^[0-9]*$/;
function fn_insert(){
	
	 //Editor 모드
   
	alert("content ->"+content);
	
	if(content == null || content == ""){
		alert("내용을 입력하세요");
		return false;
	}
	
	if(!$("#p_name").val()){
		alert("상품명을 입력하세요"); $("#p_name").focus();
		return false;
	}
	if(!$("#price").val()){
		alert("상품가격을 입력하세요"); $("#price").focus();
		return false;
	}
	if(!number.test($("#price").val())){
		alert("상품가격은 숫자만 입력가능합니다.");
		return false;
	}
	if(!$('#category > option:selected').val()) {
	   alert("상품카테고리를 선택하세요");
	   return false;
	}
	var color = $("#color option:selected").val();
	if(!color){
		alert("색상을 선택하세요");
		return false;
	}
	var p_size = $("#p_size option:selected").val();
	if(!p_size){
		alert("상품 크기를 선택하세요");
		return false;
	}
	var formData = new FormData($("#form")[0]);
	$.ajax({
		processData: false,
		contentType: false,
		type:"POST",
		url:"/category/produce_write_ok.do",      
		data: formData,
		enctype: 'multipart/form-data',
		 success : function(data){
	    	   if(data=="Y"){
	    		   alert("상품 등록 완료");
	    		   window.location.href="/category/shop.do";
	    	   }else{
	    		   alert("상품 등록 실패");
	    		   return false;
	    	   }
	       }
	  ,error:function(request, status, error){

		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

	}

	 
	});
};