$(document).ready(function(){
	
});
function fn_goExcel(){
	$("#form").method="POST";
	$("#form").action="/exportToExcel.do";
	$("#form").submit();
}
function fn_userSearch(){	
	if(!$("#userSearch").val()){
		alert("검색명을 입력하세요");
		return false;
	}
	$("#searchfrm").submit();
}
function fn_list(){
	location.href="/customerInfo.do";
}
function fn_delete(){
	var INX = $("input[name='INX']:checked").val();
	var len = $("input[name='INX']:checked").length;
	
	if(len < 1){
		alert("삭제할 회원을 입력하세요");
		return false;
	}
	if(confirm('선택한 게시물 삭제하시겠습니까 ?')){
		$.ajax({
			type:"POST",
			url:"/customerDelete.do",   
			contentType :"application/x-www-form-urlencoded;charset=UTF-8",
			dataType	: "json",
			data: $("#form").serialize(),
			success:function(success){
				if(success=="Y"){
					alert("삭제완료.");
					location.reload();
				}else{
					alert("삭제실패.");	
				}
			} ,error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   }

		
		});
	}
}
function fn_update(){
	var INX = $("input[name='INX']:checked").val();
	if(!INX){
		alert("수정할 회원을 선택하세요");
		return false;
	}
	var len = $("input[name='INX']:checked").length;
	
	if(len > 1){
		alert("수정할 회원을 한명만 선택하세요");
		return false;
	}else{
		window.open("/customerInfoEdit.do?INX="+INX, 'update','width=600px,height=800px');
		//window.open("/boardDetail.do?INX="+INX,'detail','width=600px,height=800px');
	}
}
/**
 * 
 */
