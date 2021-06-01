$(document).ready(function(){
	
});

function fn_login(){
	 $.ajax({
			contentType:"application/x-www-form-urlencoded;charset=UTF-8",
			type:"POST",
			url:"/login_ok.do",
			data:$("#frm").serialize(),
			success:function(data){
				if(data=="Y"){
					alert("로그인완료");
					location.href="/main.do";
				}
				else{
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					return false;
				}
			},
			error:function(request,error){
				alert("error");
			}
		   }); 
}
/**
 * 
 */