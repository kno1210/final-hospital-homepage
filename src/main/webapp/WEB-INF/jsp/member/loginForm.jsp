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
		<link rel="icon" href="data:;base64,iVBORw0KGgo=">
		
		<script>
			function loginCheck() {
				var id = $("#mid").val();
				var pw = $("#mpassword").val();
				
				var loginData = {
					"mid":id,
					"mpassword":pw
				};
				var jsonData = JSON.stringify(loginData);

				//console.log(loginData.mid, loginData.mpassword);
				
				$("#errorMid").html("");
				$("#errorMpassword").html("");
				
				idCheck = (id == "" || id == undefined || id == null)
				pwCheck = (pw == "" || pw == undefined || pw == null)
				
				if(idCheck || pwCheck) {
					if(idCheck) {
						$("#errorMid").html("ID를 입력하세요.");
					}
					if(pwCheck) {
						$("#errorMpassword").html("PW를 입력하세요.");
					}
				}
				else {
					
					$.ajax({
						url:"login.do",
						type:"POST",
						data:{mid:id, mpassword:pw},
						success:function(data) {
							if(data.result == "success") {
								console.log("성공");
								window.location.href = "${pageContext.request.contextPath}/home/main.do";
							}
							else if(data.result == "errorMid") {
								$("#errorMid").html("ID가 존재하지 않습니다.");
							}
							else if(data.result == "errorMpassword") {
								$("#errorMpassword").html("PW가 잘못 입력되었습니다.");
							}
							else {
								console.log("Fail");
							}
						}
					});
				}
			}
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/loginForm.jsp</h5>
		
		<form method="post">
			<table>
				<tr>
					<td>ID </td>
					<td>
						<input type="text" id="mid" name="mid"/>
						<span id="errorMid" style="color:red"></span><br/><br/>
					</td>
					
				</tr>
				
				<tr>
					<td>PW </td>
					<td>
						<input type="password" id="mpassword" name="mpassword"/>
						<span id="errorMpassword" style="color:red"></span><br/>
					</td>
				</tr>
			</table>
			<!-- <input type="submit" value="로그인"/> -->
			<a href="javascript:loginCheck()" class="btn btn-info btn-sm">로그인</a>
		</form>
		
		<%-- <form method="post" action="login.do">
			<table>
				<tr>
					<td>ID </td>
					<td><input type="text" id="id"/></td>
				</tr>
				
				<tr>
					<td>PW </td>
					<td><input type="text" id="password"/></td>
				</tr>
			</table>
			<input type="submit" value="로그인"/>
		</form> --%>
		
	</body>
</html>