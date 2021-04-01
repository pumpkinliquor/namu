<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>


<!-- container -->
<div class="container" id="contents">

	<!-- contents s -->
	<div class="contents w1200">

		<section class="re_login login02">
			<header>아이디&#47;비밀번호 찾기</header>
			<ul class="tab_list02">
				<!-- tab -->
				<li class="selected"><a href="javascript:void(0);" title="선택된 탭">아이디 찾기</a></li>
				<li><a href="javascript:void(0);">비밀번호 찾기</a></li>
			</ul>

			<section class="tab_box">
				<!-- tab contents1 s -->

				<!-- 아이디 찾기 -->
				<div id="find_id">
					<div class="re_loginbox">
						<p>
							<label for="name">이름</label> <input type="text" id="name"
								placeholder="이름을 입력해주세요">
						</p>
						<p>
							<label for="phfirst">휴대폰</label> <select title="휴대폰 앞자리" id="phfirst">
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>018</option>
								<option>019</option>
							</select> <span>-</span> <input type="text" title="휴대폰 중간자리" id="phmid" maxlength="4" onkeypress="onlyNumber()">
							<span>-</span> <input type="text" title="휴대폰 뒷자리" id="phlast" maxlength="4" onkeypress="onlyNumber()">
						</p>
					</div>
					<div class="btn_Lbox">
						<!-- btn box -->
						<a href="javascript:void(0);" class="btn bblue" id="find1">아이디 찾기</a>
					</div>
				</div>

				<!-- 아이디 -->

				<div id="found_id" style="display: none">
					<p class="login_top_txt">회원님의 아이디는 아래와 같습니다</p>
					<div class="box_gray">
						<p class="idfind">
							<strong id="changeID">A123**</strong> (가입일: <zz id="changeDate">2019.07.16</zz>)
						</p>
					</div>
					<div class="btn_Lbox">
						<a href="javascript:void(0);" class="btn bgreen" id="findPw">비밀번호 찾기</a>
						<a href="/user/lgn/sin/userLogin.do" class="btn bblue">로그인</a>
					</div>
				</div>

			</section>
			<!-- //tab contents1 e -->

			<section class="tab_box">
				<!-- tab contents2 s -->
				<!-- 비밀번호 찾기 -->
				<div id="find_pw">
					<div class="re_loginbox">
						<p>
							<label for="reid">아이디</label>
							<input type="text" id="reid" maxlength="12" placeholder="아이디를 입력해주세요">
						</p>
					</div>
					<div class="btn_Lbox">
						<!-- btn box -->
						<a href="javascript:void(0);" class="btn bblue" id="find2">확인</a>
					</div>

				</div>


				<!-- 비밀번호 찾기 -->
				
				<div id="inputInfo" style="display: none">
				
					<div class="re_loginbox">
						<p><label for="reName">이름</label>
							<input type="text" id="reName" placeholder="이름을 입력해주세요">
						</p>
						<p><label for="rephfirst">휴대폰</label>
							<select title="휴대폰 앞자리" id="rephfirst">
								<option>010</option>
							</select>
							<span>-</span>
							<input type="text" title="휴대폰 중간자리" id="rephmid" maxlength="4" onkeypress="onlyNumber()">
							<span>-</span>
							<input type="text" title="휴대폰 뒷자리" id="rephlast" maxlength="4" onkeypress="onlyNumber()">
						</p>
					</div>
					<div class="btn_Lbox">
						<a href="javascript:void(0);" class="btn bblue" id="submitinfo">비밀번호 재설정</a>
					</div>
				</div>
				
				<div id="auth" style="display: none">
				<!-- 비밀번호 재설정 --> 
					<p class="login_top_txt">비밀번호 재설정을 위해 본인인증을 진행해주세요</p>
					<div class="box_gate">
						<a href="javascript:void(0);" class="b_gate06" id="phoneAuth">휴대전화 인증</a>
					</div>
					<div class="btn_Lbox">
						<a href="javascript:void(0);" class="btn bgreen ml0" id="back">이전</a>
					</div>
				</div>
				
			</section>
			<!-- //tab contents2 e -->
		</section>

	</div>
	<!-- //contents e -->
	
	<form action="/user/lgn/sin/pwreset.do" method="post" id="hiddenform">
		<input type="hidden" id="USER_ID" name="USER_ID">
	</form>
</div>


<script src="/js/fbcms/user/ajax_cmm.js"></script>

<script type="text/javascript">
	
	// 전화번호에 숫자만 넣었는지 확인
	function onlyNumber(){
		if(event.keyCode < 48 || event.keyCode > 57) {
			event.returnValue=false;
		}
	}
	$("#find1").click(function(){
			var name = $("#name").val()
			if(name==""||name==" "){
				alert("이름을 입력해주세요.");
				$("#name").focus();
				return false;
			} else if($("#phmid").val()==""||$("#phmid").val()==" "){
				alert("핸드폰 중간 번호를 입력해주세요.");
				$("#phmid").focus();
				return false;
			} else if($("#phlast").val()==""||$("#phlast").val()==" "){
				alert("핸드폰 마지막 번호를 입력해주세요.");
				$("#phlast").focus();
				return false;
			}
			var phone = $("#phfirst").val()+"-"+$("#phmid").val()+"-"+$("#phlast").val()
			var obj = {
					url:"/user/lgn/sin/findId.do"
					, data: {name:name,phone:phone}
					, dataType : "json"
					, fnSuccess: function(data){
						if(data){
							$("#found_id").show();
							$("#find_id").hide();
							var id = data.mber_ID;
							id = id.substring(0, (id.length-2))+"**";
							$("#changeID").text(id);
							var date = data.frist_JOIN_DT;
							date = date.substring(0,10);
							$("#changeDate").text(date);
							$("#findPw").on("click",function(){
								$(".tab_list02 > li:nth-child(2)").addClass("selected");
								$(".tab_list02 > li:nth-child(1)").removeClass("selected");
								$(".tab_box:eq(0)").hide();
								$(".tab_box:eq(1)").show();
								
							})
						}						
					}
					, fnError: function(){
						alert("일치하는 정보가 없습니다. 다시 확인해 주세요!");
					}
				}
				fnAjax(obj);
	});
	
		$("#find2").click(function() {
			if($("#reid").val()=="" || $("#reid").val()==" "){
				alert("ID값이 비었습니다")
				$("#rephmid").focus();
				return false;
			}
			var USER_ID = $("#reid").val();
			var obj = {
				url : "/user/lgn/api/joinCheck.do",
				data : {USER_ID : USER_ID},
				dataType : "text",
				fnSuccess : function(data) {
					if(data==1){
						$("#find_pw").hide();
						$("#inputInfo").show();
						// 비밀번호 재설정 버튼 클릭 시
						$("#submitinfo").on("click",function(){
							var name = $("#reName").val()
							if(name==""||name==" "){
								alert("이름 값이 비어있습니다.");
								$("#reName").focus();
								return false;
							}
						
							
							if($("#rephmid").val()==""||$("#rephmid").val()==" "){
								alert("핸드폰 중간 번호 값이 비어있습니다.");
								$("#rephmid").focus();
								return false;
							}
							
							if($("#rephlast").val()==""||$("#rephlast").val()==" "){
								alert("핸드폰 마지막 값이 비어있습니다.");
								$("#rephlast").focus();
								return false;
							}
							var phone = $("#rephfirst").val()+"-"+$("#rephmid").val()+"-"+$("#rephlast").val();
							var obj = {
								url:"/user/lgn/sin/findId.do"
								, data: {
									  name : name
									, phone : phone
									, USER_ID : USER_ID
									}
								, dataType : "json"
								, fnSuccess: function(data){
									if(USER_ID==data.mber_ID){
										$("#inputInfo").hide();
										$("#auth").show();
										// 본인인증
										$("#phoneAuth").on("click",function(){
											var URL = "<c:url value='/danal/Ready.do'/>";
											var popupName = "_blank";
											var popupOptions = 'top=10, left=10, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no';
											
											window.open(URL, popupName, popupOptions);
										})
										$("#back").on("click",function(){
											var check = confirm("뒤로가기 시 모든 정보가 사라 질 수 있습니다. 계속하시겠습니까?");
											if(check==true) {
												window.history.back();
											}
										})
									}					
									else{
										alert("ID의 회원정보와 일치하지 않습니다")
									}
								}
								, fnError: function(){
										alert("일치하는 정보가 없습니다. 다시 확인해 주세요!");
								}
							}
							fnAjax(obj);
						})
					}else if(data==0){
						alert("입력한 ID를 다시 확인해 주세요")
					}else{
						alert("나올 수 없는 곳!!! 이곳은 에러입니다!!!")
					}
				}
				,fnError: function(error){
					alert(error)
				}
			}

			fnAjax(obj);
		});
		
	// 본인인증 완료 후 처리
	function fnNextStep(tid, name, iden, phone) {
		var inputPhone = $("#rephfirst").val()+$("#rephmid").val()+$("#rephlast").val();
		
		if(inputPhone == phone) {	// 입력 휴대폰번호와 본인인증 휴대폰 번호 일치 시 비밀번호 변경 진행
			var reid = $("#reid").val();
		
			$("#USER_ID").val(reid);
			$("#hiddenform").submit();
		}
	}
	
	</script>
	
	