/**
 * 
 */
$(document).ready(function(){

});
	function fn_egov_link_page(){
	
		document.frm.action = '/category/shop.do';
	   	document.frm.submit();
		
	}
	function fn_menu(INX){
		location.href="/category/shop.do?category="+INX;
	}
	function fn_detail(inx)
	{
		location.href="/category/product_Detail.do?INX="+inx;
	}
	function fn_delete(){
		var INX_CHK = $("input[name='INX_CHK']:checked").val();
		if(!INX_CHK){
			alert("삭제할 상품을 선택하세요");
			return false;
		}
		/*var frm = jQuery("#form").serialize();
		alert(frm);*/
		if(confirm("선택된 상품을 삭제하시겠습니까 ? ")){
			$.ajax({
				contentType :"application/x-www-form-urlencoded;charset=UTF-8",
				type : "POST",
				url : "/category/product_delete.do",
				data : $("#form").serialize(),
				success:function(success){
					if(success=="Y"){
						alert("삭제완료");
						window.location.reload();
					}else{
						alert("삭제실패");
					}
				}
			  ,error:function(request,status,error){
			    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			   }
	
	
			
			});
		}

}
	