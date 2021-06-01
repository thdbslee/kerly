
var phoneReg = /^[0-9]*$/; //숫자만 입력가능 
var nameReg = /^[가-힣]{2,6}$/; //한글만가능 
$(document).ready(function(){
	$("#USER_NAME").blur(function(){
		var nm = $("#USER_NAME").val();
		if(nm!=""){
			if(!nameReg.test(ph)){
				$("#nm_chk").text("이름은 한글로만 가능합니다.");
			}
		}else{
			$("#nm_chk").text("변경하실 이름을 입력하세요");
		}
	});
	
	$("#USER_PHONE").blur(function(){
		var ph = $("#USER_PHONE").val();
		 ph = ph.replace(/ /gi, "").replace(/-/gi, "");
		 if(ph!=""){ 
			 if(!phoneReg.test(ph)){
				 $("#ph_chk").text("숫자만입력가능(-)제외하고 입력하세요");
				 $("#ph_chk").css("color",red);
			 }
		 }else{
			 $("#ph_chk").text("번호 필수정보입니다.");
			 $("#ph_chk").css("color",red);
		 }
	});
});

function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        			        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
          /*   document.getElementById('member_post').value = data.zonecode; */
            if(roadAddr !== ''){
                document.getElementById("ADR").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("ADR").value = jibunAddr;
            }
        }
    }).open();
}
function fn_edit(){
	var ADR = $("#ADR").val();
	var DEADR = $("#DEADR").val();
	var add = ADR+DEADR ; 
	$("#USER_ADDRESS").val(add);
	

	if(!$("#USER_NAME").val()){
		alert("변경할 이름을 입력하세요");
		return false;
	}else{
		if(!nameReg.test($("#USER_NAME").val())){
			alert("이름은 한글만 입력가능 합니다.");
		}
	}
	//phoneReg
	if(!$("#USER_PHONE").val()){
		alert("번호를 입력하세요");
		return false;
	}else{
		if(!phoneReg.test($("#USER_PHONE").val())){
			alert("숫자만입력가능(-)제외하고 입력하세요");
			return false;
		}
	}
	if(!$("#DEADR").val()){
		alert("상세주소를 입력하세요");
		return false;
	}
	$.ajax({
		contentType :"application/x-www-form-urlencoded;charset=UTF-8",
		type :"POST",
		url  :"/customerInfoEdit_ok.do",
		dataType : "json",
		data : $("#frm").serialize(),
		success : function(data){
			if(data==true){
				alert("고객 정보 변경 완료 ");
				self.close();
				opener.document.location.reload();
			}else{
				alert("고객 정보 변경 실패");
				return false;
			}
		},
		error:function(request,error){
			alert("request->"+request+",error ->"+error);
		}
	});
}