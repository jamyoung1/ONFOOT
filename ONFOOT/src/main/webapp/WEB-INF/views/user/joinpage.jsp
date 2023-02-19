<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<link href="/resources/css/styles.css" rel="stylesheet" />

<%@include file="../fragments/header.jsp"%>

<link rel="stylesheet" href="../resources/css/joinpage.css" />

<body class="text-center">
	<div id="container">
		<div id="joinBox">
			<div id="joinBoxTitle">ONLOOK JOIN</div>
			<form id="join-form" method="post">
				<div id="join-inputBox">
					<div class="join-input-form-box">
						<strong style="width: 80px;">아이디</strong>
						 <input type="text" name="userid" class="form-control" id="id-input">
					</div>
							<span class="id-check">아이디를 입력해주세요</span>
							<span class="id-input-re-1">사용 가능한 아이디입니다</span>
							<span class="id-input-re-2">아이디가 이미 존재합니다</span>
					<div class="join-input-form-box">
						<strong style="width: 80px;">비밀번호 </strong>
						 <input type="password" name="passwd" class="form-control" id="pw-input">
					</div>
							<span class="pw-check">비밀번호를 입력해주세요</span>
					<div class="join-input-form-box">
						<strong style="width: 80px;">닉네임</strong>
						 <input type="text" name="name" class="form-control" id="name-input">
					</div>
							<span class="name-check">닉네임를 입력해주세요</span>
					<div class="join-input-form-box">
						<strong style="width: 80px;">주소</strong>
						<input type="text" name="addr" onclick="execution_daum_address()" class="form-control" id="addr-input" readonly="readonly">
					</div>
							<span class="addr-check">주소를 입력해주세요</span>
					<div class="join-input-form-box">
						<strong style="width: 80px;">연락처</strong>
						 <input type="tel" name="phone" class="form-control" id="tel-input">
					</div>
							<span class="tel-check">전화번호를 입력해주세요</span>
					<div class="join-input-form-box">
						<strong style="width: 80px;">이메일</strong> 
						<input type="email" name="email" class="form-control" id="mail-input">
					</div>
							<span class="email-check">이메일을 입력해주세요</span>
					<div class="join-button-join-box">
						<button class="btn btn-primary btn-s" id="join-btn"
							style="width: 100%; height: 50px; background-color: black;">회원가입</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
 
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<script>
	var idCheck = false;
	var pwCheck = false;
	var telCheck = false;
	var nameCheck = false;
	var mailCheck = false;
	var addrCheck = false;
	
	$(document).ready(function(){
	/* 회원가입 */
		$("#join-btn").click(function(){

		var id = $('#id-input').val();
		var pw = $('#pw-input').val();
		var name = $('#name-input').val();
		var addr = $('#addr-input').val();
		var tel = $('#tel-input').val();
		var email = $('#mail-input').val();
		
		if(id == ""){
			$('.id-check').css('display','block');
			idCheck = false;
		}else{
			$('.id-check').css('display','none');
			idCheck = true;
		}
		
		if(pw == ""){
			$('.pw-check').css('display','block');
			pwCheck = false;
		}else{
			$('.pw-check').css('display','none');
			pwCheck = true;
		}
		
		if(name == ""){
			$('.name-check').css('display','block');
			nameCheck = false;
		}else{
			$('.name-check').css('display','none');
			nameCheck = true;
		}
		
		if(addr == ""){
			$('.addr-check').css('display','block');
			addrCheck = false;
		}else{
			$('.addr-check').css('display','none');
			addrCheck = true;
		}
		
		if(tel == ""){
			$(".tel-check").css('display','block');
			telCheck = false;
		}else{
			$('.tel-check').css('display','none');
			telCheck = true;
		}
		
		if(email == ""){
			$('.email-check').css('display','block');
			mailCheck = false;
		}else{
			$('.email-check').css('display','none');
			mailCheck = true;
		}
		
		 /* 최종 유효성 검사 */
        if(idCheck&&pwCheck&&nameCheck&&mailCheck&&addrCheck&&telCheck){
        	$("#join-form").attr("action","/user/join");
    		$("#join-form").submit();
        }
		 return false;
		});
	});
	
	/* 아이디 중복 검사 */
		$('#id-input').on("propertychange change keyup paste input", function(){
			
			var userid = $('#id-input').val();    // id 입력 값 클래스
			var data = {userid : userid}         // '컨트롤에 넘길 데이터 이름 ' : '.id_input에 입력되는 값'
			
			$.ajax({
				type : "post",
				url : "/user/useridChk",          // MemberController로 이동
				data : data,
				success : function(result) {
					if(result !='fail'){
						$('.id-input-re-1').css("display","inline-block");
						$('.id-input-re-2').css("display","none");
						idckCheck = true;
					}else{
						$('.id-input-re-2').css("display","inline-block");
						$('.id-input-re-1').css("display","none");
						idckCheck = false;
					}
				}
			});
		});
	
	/* Daum 주소 api */
	function execution_daum_address() {
		
		new daum.Postcode({
			oncomplete: function(data){
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var addr = ''; // 주소 변수
				                var extraAddr = ''; // 참고항목 변수
				 
				                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    addr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    addr = data.jibunAddress;
				                }
				 
				                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = ' (' + extraAddr + ')';
				                    }
				                    // 주소변수 문자열과 참고항목 문자열 합치기
				                  	addr += extraAddr;
				                
				                } else {
				                    addr += ' ';
				                }				 
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.				      
				                $("#addr-input").val(addr);
				                // 커서를 상세주소 필드로 이동한다.
				                $("#addr-input").focus();
			}
		}).open();
	}
		
	
	</script>