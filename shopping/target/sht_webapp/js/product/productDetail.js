$(document).ready(function(){
	
});
function fn_edit(){
	var P_INX = $("#P_INX").val();
	location.href="/category/product_update.do?INX="+P_INX;
}
function fn_purchase(){
	if(!$("#USER_ID").val()){
		alert("장바구니 기능은 로그인 후 사용가능합니다.");
		return false;
	}
	if($("#amount").val() == 0){
		alert("수량을 선택하세요");
		return false;
	}
	/*var frm = jQuery("#form").serialize();
	alert(frm);*/
	 $.ajax({
			contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			type:"POST",
			url:"/cart_insert.do",
			data: $("#form").serialize(),
			success:function(data){
				if(data=="Y" ){
					if(confirm("장바구니로 이동하시겠습니까 ?")== true){
						location.href="/cart.do";
					}else{
						 location.reload();
					}
					
				}else if(data=="U"){
					if (confirm("장바구니로 이동하시겠습니까?") == true){    //확인
					    location.href="/cart.do";
					}else{   //취소
					    window.location.reload();
					}


				
					
					
				}
				else{
					alert("장바구니담기실패");
					return false;
				}
			},
			error:function(request,error){
				alert("error");
			}
		   }); 
}