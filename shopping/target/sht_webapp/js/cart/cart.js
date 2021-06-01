$(document).ready(function(){

	   $("input[name='AMOUNT']").on("keyup", function() {
	      $(this).val($(this).val().replace(/[^0-9]/g,""));
	   });
	   // 체크박스 전체선택, 전체해제 
	   $("#all_chk").click(function(){
		   var chk = $("#all_chk").is(":checked");
		   if(chk){
			   $("input:checkbox").prop("checked",true);
		   }else{
			   $("input:checkbox").prop("checked",false);
		   }
	   });

});

function fn_add(amount , p_inx){

	var userID = $("#USER_ID").val();
	$.ajax({
		contentType :"application/x-www-form-urlencoded;charset=UTF-8",
		type :"POST",
		url  :"/cart_amount_plus.do",
		data : {"AMOUNT" :amount ,"P_INX" : p_inx ,"USER_ID" : userID},
		success : function(data){
			if(data=="Y"){
				window.location.reload();
			}else{
				alert("증가 실패");
			}
		},
		error:function(request,error){
			alert("request->"+request+",error ->"+error);
		}
	});
	
}
function fn_min(amount,p_inx){
	if(amount < 1){
		alert("수량은 한개 이상부터 선택가능합니다.");
		return false;
	}
	var userID = $("#USER_ID").val();
	$.ajax({
		contentType :"application/x-www-form-urlencoded;charset=UTF-8",
		type :"POST",
		url  : "/cart_amount_minus.do",
		data :{"AMOUNT" :amount , "P_INX":p_inx,"USER_ID":userID},
		success :function(data){
			if(data=="Y"){
				window.location.reload();
			}else{
				alert("실패");
			}
		}
	});
	
}
function fn_purchase(){
	var INX_CHK = $("input[name='INX_CHK']:checked").val();
	if(INX_CHK){
		if(confirm('선택한 상품을 결제하시겠습니까 ?')){
			location.href="/cart_purchase.do";
		}
	}else{
		if(confirm('장바구니 전체 상품을 결제하시겠습니까 ?')){
			$.ajax({
				type:"POST",
				url:"/cart_purchase.do",   
				contentType :"application/x-www-form-urlencoded;charset=UTF-8",
				data: $("#form").serialize(),
				success:function(success){
					if(success=="Y"){
						window.location.href="/cart_purchaseForm.do";
					}
				} ,error:function(request,status,error){
				    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				   }

			
			});
		}
	}
}
function fn_delete(){
	if($("input[name=INX_CHK]:checked").length == 0){
		  alert("삭제할 장바구니 선택하세요");
		  return ;
	  }
	
		if(confirm('선택한 게시물 삭제하시겠습니까 ?')){
			$.ajax({
				type:"POST",
				url:"/cart_delete.do",   
				contentType :"application/x-www-form-urlencoded;charset=UTF-8",
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