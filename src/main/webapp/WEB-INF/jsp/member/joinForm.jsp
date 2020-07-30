<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/bootstrap/css/bootstrap.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/popper/popper.min.js"></script>
		<script src="${pageContext.request.contextPath}/resource/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.css">
		<script src="${pageContext.request.contextPath}/resource/jquery-ui/jquery-ui.min.js"></script>
	
		<script>
			//커서가 입력창에서 벗어나면 유효성 검사
			checkCnt = 0; //정상적으로 입력된 데이터 수 //6이면 가입 가능 
			
			$(function() {
				var id = $("#mid");
				var pw = $("#mpassword");
				var name = $("#mname");
				var tel = $("#mtel");
				var email = $("#memail");
				var birth = $("#mbirth");
				
				/* $("#errorMid").html("");
				$("#errorMpassword").html("");
				$("#errorMname").html("");
				$("#errorMtel").html("");
				$("#errorMemail").html("");
				$("#errorMbirth").html(""); */
					  
				//ID
				//커서가 입력창 안에 있을 경우
				/* id.focus(function() {
					id.val("");
				}) */
				//커서가 입력창 안에 없을 경우
				id.blur(function() {
					$("#errorMid").html("");
					if(id.val() == "") { //입력하지 않았을 경우
						$("#errorMid").html("ID를 입력하세요.");
					}
					else {
						var result = checkId(id.val());
						if(result == "wrongStr") {
							$("#errorMid").html("ID는 영문 대소문자와 숫자만 가능합니다.");
						}
						else if(result == "wrongSpace") {
							$("#errorMid").html("ID에는 공백이 불가능합니다.");
						}
						else if(result == "wrongLen") {
							$("#errorMid").html("ID는 4자리 이상 10자리 이하만 가능합니다.");
						}
						
						//중복 검사
						else if(isDuplicated(id.val())) {
							$("#errorMid").html("중복된 ID입니다.");
						}
					}
				});
				
				  
				//PW
				//커서가 입력창 안에 있을 경우
				/* pw.focus(function() {
					pw.val("");
				}) */
				//커서가 입력창 안에 없을 경우
				pw.blur(function() {
					$("#errorMpassword").html("");
					if(pw.val() == "") { //입력하지 않았을 경우
						$("#errorMpassword").html("비밀번호를 입력하세요.");
					}
					else if(pw.val() == "dd") { //정해진 입력방식에 맞지 않을 경우
						
					}
				});
				
				// NAME
				// 커서가 입력창 안에 있을 경우
				/* name.focus(function() {
					name.val("");
				}) */
				// 커서가 입력창 안에 없을 경우
				name.blur(function() {
					$("#errorMname").html("");
					if(name.val() == "") { // 입력하지 않았을 경우
						$("#errorMname").html("이름을 입력하세요.");
					}
					else if(name.val() == "dd") { // 정해진 입력방식에 맞지 않을 경우
						
					}
				});
				
				// TEL
				// 커서가 입력창 안에 있을 경우
				/* tel.focus(function() {
					tel.val("");
				}) */
				// 커서가 입력창 안에 없을 경우
				tel.blur(function() {
					$("#errorMtel").html("");
					if(tel.val() == "") { // 입력하지 않았을 경우
						$("#errorMtel").html("전화번호를 입력하세요.");
					}
					else if(tel.val() == "") { // 정해진 입력방식에 맞지 않을 경우
						
					}
				});
				
				// EMAIL
				// 커서가 입력창 안에 있을 경우
				/* email.focus(function() {
					email.val("");
				}) */
				// 커서가 입력창 안에 없을 경우
				email.blur(function() {
					$("#errorMemail").html("");
					if(email.val() == "") { // 입력하지 않았을 경우
						$("#errorMemail").html("Email을 입력하세요.");
					}
					else if(email.val() == "dd") { // 정해진 입력방식에 맞지 않을 경우
						
					}
				});
				
				// BIRTH
				// 커서가 입력창 안에 있을 경우
				/* birth.focus(function() {
					birth.val("");
				}) */
				// 커서가 입력창 안에 없을 경우
				birth.blur(function() {
					$("#errorMbirth").html("");
					if(birth.val() == "") { // 입력하지 않았을 경우
						$("#errorMbirth").html("생년월일을 입력하세요.");
					}
					else if(birth.val() == "dd") { // 정해진 입력방식에 맞지 않을 경우
						
					}
				});
			});
			
			//ID
			//영문 대소문자와 숫자만 가능
			//4~ 10자리
			function checkId(id) {
				if(checkWhiteSpace(id)) {
					return "wrongSpace"; //형식에 맞지 않음
				}
				else if(checkSpecialChar(id) || !checkEnglish(id)) {
					return "wrongStr";
				}
				else if(checkCharLen(id, 4, 10)) { //글자수가 맞지 않음
					return "wrongLen";
				}
				
				//id 중복검사
				                                  
			}
			
			//PW
			//영문 대소문자와 숫자만 가능
			//4~ 10자리
			function checkPassword(pw) {
				if(checkWhiteSpace(pw)) {
					return "wrongStr";
				}
				else if(checkCharLen(pw, 4, 10)) { //글자수가 맞지 않음
					return "wrongLen";
				}
			}
			
			//Name
			//한글만 가능
			function checkName(name) {
				
			}
			
			//Tel
			//숫자만 가능
			//01011112222 (11자리)
			function checkTel(tel) {
				
			}
			
			//Mail
			//영문 대소문자/숫자/특수문자@영문 대소문자/숫자.영문 소문자
			function checkEmail(email) {
				
			}
			
			//Birth
			//이건 텍스트로 입력받을 게 아니라
			//달력에서 선택하거나
			//select box를 만들어서 선택하게 하자
			function checkBirth(birth) {
				
			}
			
			//글자수 체크
			function checkCharLen(str, minLen, maxLen) {
				return (str.length < minLen || str.length > maxLen)
			}
			
			//문자열 체크
			function checkWhiteSpace(str) { //공백 체크
				var pattWhiteSpace = /\s/;
				return pattWhiteSpace.test(str);
			}
			
			function checkEnglish(str) { //영문 대소문자 체크
				var pattEng = /[A-Za-z]+/;
				return pattEng.test(str);
			}
			
			function checkSpecialChar(str) { //특수문자 체크
				var pattSpecial = /adf/;
				return pattSpecial.test(str);
			}
			
			//ID 중복 체크
			function isDuplicated(id) {
				var result = true;
				$.ajax({
					url:"checkDup.do",
					type:"POST",
					data:{id:id},
					success:function(data) {
						if(data.result == "not dup") {
							result = false;
						}
						else {
							result = true;
						}
					}
				});
				return result;
			}
			
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/joinForm.jsp</h5>

		<form method="post" action="join.do">
			ID : <input type="text" id="mid" name="mid"/><span id="errorMid" style="color:red"></span><br/>
			PW : <input type="password" id="mpassword" name="mpassword"/><span id="errorMpassword" style="color:red"></span><br/>
			<!-- PW 확인 : <input type="password" id="mpassword2" name="mpassword2"/><span id="errorMpassword2" style="color:red"></span><br/> -->
			NAME : <input type="text" id="mname" name="mname"/><span id="errorMname" style="color:red"></span><br/>
			TEL : <input type="text" id="mtel" name="mtel"/><span id="errorMtel" style="color:red"></span><br/>
			EMAIL : <input type="text" id="memail" name="memail"/><span id="errorMemail" style="color:red"></span><br/>
			BIRTH : <input type="text" id="mbirth" name="mbirth"/><span id="errorMbirth" style="color:red"></span><br/>
			<input type="submit" value="가입"/>
		</form>
		
		
<%-- 		<form:form method="post" action="login.do" modelAttribute="member">
			<table>
				<tr>
					<td>ID </td>
					<td>
						<form:input path="mid" id="mid" value="Input your ID"/>
						<span id="errorMid" style="color:red"></span><br/><br/>
					</td>
					
				</tr>
				
				<tr>
					<td>PW </td>
					<td>
						<form:input path="mpassword" id="mpassword" value="Input your PW"/>
						<span id="errorMpassword" style="color:red"></span><br/>
					</td>
				</tr>
			</table>
			<input type="submit" value="로그인"/>
		</form:form> --%>
	</body>
</html>