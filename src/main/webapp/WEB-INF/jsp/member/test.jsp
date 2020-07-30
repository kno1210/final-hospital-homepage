<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		
		<script
    		src="https://cdnjs.cloudflare.com/ajax/libs/i18next/17.0.18/i18next.min.js"
    		type="text/javascript">
		</script>
	</head>
	<body>
		<h5 class="alert alert-info">/i18nTest.jsp</h5>
		
		<select id="lang-select" onchange="i18next.changeLanguage(this.value)">
	      <option value="en">English</option>
	      <option value="ko">Korean</option>
	      <option value="fr">French</option>
	    </select>
	    <h1 id="title" data-i18n="translation.title"></h1>
	    <p id="content" data-i18n="translation.content"></p>		
	</body>
	
	<script>
		const isKorean = navigator.language === "ko-KR";
		if (isKorean) {
			document
			.getElementById("lang-select")
	    	.options[1].setAttribute("selected", true);
		}
		/* i18next.init({
			lng: isKorean ? "ko" : "en",
			debug:true,
			resources:{
				ko:"${pageContext.request.contextPath}/WEB-INF/i18n/ko.json",
				en:{
					transtion:{
						title:"Hello",
						content:"Have a nice day"
					}
				},
				fr:{
					translation:{
						title:"Bonjour",
						content:"Passez une bonne journée"
					}
				}
			},
			
		},
		function(err, t) {
			if(err) {
				console.error(err);
			}
			else {
				updateContent();
			}
		}); */
		
		$(function() {
			i18next.init({
				resGetPath:"${pageContext.request.contextPath}/WEB-INF/i18n/__lng__.json",
				lng: isKorean ? "ko" : "en"
			    /* backend: {
			      // for all available options read the backend's repository readme file
			      loadPath: '/locales/{{lng}}/{{ns}}.json'
			    } */
			}
			/* function (t){ 
		        $('#tabContainer').i18n(); 
		        $('#side-menu').i18n(); 
		        $('.navbar-top-links').i18n(); 
		    } */);
			
			console.log();
			
		});
		
		function updateContent() {
			document.getElementById("title").innerHTML = i18next.t("title");
			document.getElementById("content").innerHTML = i18next.t("content");
		}

		i18next.on("languageChanged", () => {
			updateContent();
		});
	</script>
</html>