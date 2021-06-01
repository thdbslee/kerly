//아이디 정규식 소문자,숫자만 2글자 이상 12자미만
var idReg = /^[a-z0-9]{2,12}$/;
// 비밀번호 정규식 대소문자,숫자  1글자이상
var pwReg = /^[A-Za-z0-9]{1,12}$/; 
// 이름 정규식 한글만입력가능 2글자이상
var nameReg = /^[가-힣]{2,6}$/;
// 이메일 검사 정규식
var mailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식 -생략하기
var phoneReg = /^[0-9]*$/;
	/*/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;*/

$(document).ready(function(){
	//아이디 중복체크 확인 
	$("#USER_ID").blur(function(){
		var USER_ID = $("#USER_ID").val();
		$.ajax({
		contentType:"application/x-www-form-urlencoded;charset=UTF-8",
		type:"get",
		url:"/idchk_Confirm.do?USER_ID="+USER_ID,
		//data:$("#frm").serialize(),
		success:function(data){
			if(data=="Y"){ //이미존재하는아이디 
				$("#id_chk").text("이미 사용중인 아이디입니다.");
				$("#id_chk").css("color","red");
				$("#idcount").val("n");
			}
			else{ //사용가능아이디일때 
				if(idReg.test(USER_ID)){ //정규식에맞게입력
					$("#id_chk").text("사용가능한 아이디입니다.");
					$("#id_chk").css("color","blue");
					$("#idcount").val("y");
				}else if(USER_ID==""){
					$("#id_chk").text("아이디는 필수 정보입니다.");
					$("#id_chk").css("color","red");
				}else{
					$("#id_chk").text("영어소문자,숫자만입력가능(2글자이상)");
					$("#id_chk").css("color","red");
				}
			}
			
		},
		error:function(request,error){
			alert("error");
		}
		}); 

	});
	//이름에 특수문자 들어가지않도록 설정 
	$("#USER_NAME").blur(function(){
		var name=$("#USER_NAME").val();
		if(name!=""){
			if(!nameReg.test(name)){
				$("#name_chk").text('올바른 이름형식을 입력하세요(한글만 입력가능)');
				$("#name_chk").css("color","red");	
			}else{
				$("#name_chk").text('');
			}
		}else{
			$("#name_chk").text('이름 필수정보입니다.');
			$("#name_chk").css("color","red");	
		}
	});
	//핸드폰번호
	$("#USER_PHONE").blur(function(){
		var ph=$("#USER_PHONE").val();
		 ph = ph.replace(/ /gi, "").replace(/-/gi, "");
		if(ph!=""){
			if(!phoneReg.test(ph)){
				$("#ph_chk").text("숫자만입력가능(-)제외하고 입력하세요");
				$("#ph_chk").css("color","red");	
			}else{
				$("#ph_chk").text('');
			}
		}else{
			$("#ph_chk").text('번호 필수정보입니다.');
			$("#ph_chk").css("color","red");	
		}
	});
	
	//비밀번호확인란체크 
	$("#re-password").blur(function(){
		var pwd = $("#USER_PASSWD").val();
		var re_pwd = $("#re-password").val();
	
		if(re_pwd==""){
			$("#re_chk").text("비밀번호 확인란 필수정보입니다.");
			$("#re_chk").css("color","red");
		}else{
			$("#re_chk").text('');
		}
		if(pwd!=re_pwd){
			$("#pw_chk").text("비밀번호가일치하지않습니다.");
			$("#pw_chk").css("color","red");
		}
		
	});
	$("#USER_PASSWD").blur(function(){
		if($("#USER_PASSWD").val()==""){
			$("#pw_chk").text("비밀번호 필수정보입니다.");
			$("#pw_chk").css("color","blue");
		}else{
			$("#pw_chk").text('');
		}
	});
});

function fn_join(){

	if(!$("#USER_NAME").val()){
		alert("이름을 입력하세요");
		$("#USER_NAME").focus();
		return false;
	}else{
		if(!nameReg.test($("#USER_NAME").val())){
			alert("올바른 형식으로 입력하세요");
			return false;
		}
	}
	
	if(!$("#USER_ID").val()){
		alert("아이디를 입력하세요");$("#USER_ID").focus();
		return false;
	}else{
		if(!idReg.test($("#USER_ID").val())){
			alert("올바른 형식으로 입력하세요");
			return false;
		}
	}
	if($("#idcount").val()=="n"){
		alert("이미사용중인아이디입니다.");
		return false;
	}
	
	if(!$("#USER_PHONE").val()){
		alert("번호 입력하세요.")
		$("#USER_PHONE").focus();
		return false;
	}else{
		if(!phoneReg.test($("#USER_PHONE").val())){
			alert("올바른 형식으로 입력하세요");
			return false;
		}
	}
	if(!$("#USER_ADDRESS").val()){
		alert("주소를 입력하세요");
		$("#USER_ADDRESS").focus();
		return false;
	}
	if(!$("#USER_PASSWD").val()){
		alert("비밀번호를 입력하세요");
		$("#USER_PASSWD").focus();
		return false;
	}
	if(!$("#re-password").val()){
		alert("비밀번호 확인란 입력하세요");
		$("#re-password").focus();
		return false;
	}else{
		if($("#USER_PASSWD").val()!=$("#re-password").val()){
			alert("비밀번호가 일치하지않습니다. 다시 입력해주세요.");
			return false;
		}
	}
	

   $.ajax({
	contentType:"application/x-www-form-urlencoded;charset=UTF-8",
	type:"POST",
	url:"/join_ok.do",
	data:$("#frm").serialize(),
	success:function(data){
		if(data=="Y"){
			alert("가입완료");
			location.href="/index.jsp"
		}
		else{
			alert("등록실패");
		}
	},
	error:function(request,error){
		alert("error");
	}
   }); 
}