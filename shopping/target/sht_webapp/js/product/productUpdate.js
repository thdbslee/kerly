
$(document).ready(function(){
	
});
function fn_edit(){
	
	if(!$("#IMG_1").val()){
		$("#IMG_1").val($("#fileName").val());
	}
	var formData = new FormData($("#form")[0]);
	alert(formData);
	alert("formData ->"+formData);
	$.ajax({
		processData: false,
		contentType: false,
		type:"POST",
		url:"/category/produce_update_ok.do",      
		data: formData,
		enctype: 'multipart/form-data',
		 success : function(data){
	    	   if(data=="Y"){
	    		   alert("상품 수정 완료");
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

}