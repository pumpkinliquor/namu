<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- container -->
<div id="container">
	<div class="no_con">
		<h4 class="con_in_tit02 mb15">비급여진료비 안내</h4>
		<div class="scrollbox">
			<div class="tdetail tdetail04">
				<table>
					<caption>분류, 명칭, 금액, 최소금액, 최대금액, 비고로 이루어진 표</caption>
					<col style="width:184px">
					<col>
					<col style="width:200px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<thead>
						<tr>
							<th  scope="col" colspan="2">분류</th>
							<th  scope="col" rowspan="2">구분(명칭)</th>
							<th  scope="col" rowspan="2">금 액</th>
							<th  scope="col" rowspan="2">최소금액</th>
							<th  scope="col" rowspan="2">최대금액</th>
							<th  scope="col" rowspan="2">비고</th>
						</tr>
						<tr>
							<th scope="col">중분류</th>
							<th scope="col">소분류</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row" rowspan="2">상급병실료</th>
							<th scope="row">특실</th>
							<td>특실</td>
							<td>500,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<th scope="row">1인실</th>
							<td>1인실</td>
							<td>250,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row" rowspan="3">교육상담료</th>
							<th scope="row">당뇨병교육</th>
							<td>교육.상담-당뇨</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">고혈압교육</th>
							<td>교육.상담-고혈압</td>
							<td>15,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">고지혈증교육</th>
							<td>교육.상담-이상지질혈증</td>
							<td>15,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row" rowspan="4">검체검사료</th>
							<th scope="row">Helicobacter Pylori 검사(내시경하)<br>-CLO Test〔UreaseTest〕</th>
							<td>clo test</td>
							<td>12,672</td>
							<td>-</td>
							<td>-</td>
							<td>사용부서:<br>건강검진</td>
                        </tr>
                        <tr>
							<th scope="row">성호르몬결합글로불린</th>
							<td>성호르몬결합글로불린</td>
							<td>50,600</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">항뮬러관호르몬〔불임, 폐경〕</th>
							<td>anti mullerian hormone</td>
							<td>96,860</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">인플루엔자 A-B 바이러스 항원검사<br>〔현장검사〕</th>
							<td>인플루엔자A.B바이러스항원검사(현장검사)</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">생식, 임신 및 분만</th>
							<th scope="row">자궁경부확대촬영검사</th>
							<td>-</td>
							<td>20,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row" rowspan="2">진정내시경 환자관리료</th>
							<th scope="row">위</th>
							<td>위내시경수면관리료</td>
							<td>-</td>
							<td>80,000</td>
							<td>220,000</td>
							<td>-</td>
						</tr>
						<tr>
							<th scope="row">대장</th>
							<td>대장내시경수면관리료</td>
							<td>-</td>
							<td>110,000</td>
							<td>170,000</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">기능검사료</th>
							<th scope="row">요소호흡검사</th>
							<td>[비급여]U.B.T<br>(요소호흡검사)</td>
							<td>17,820</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="scrollbox">
			<div class="tdetail tdetail04">
				<table>
					<caption>분류, 명칭, 금액, 최소금액, 최대금액, 비고로 이루어진 표</caption>
					<col style="width:184px">
					<col>
					<col style="width:200px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<thead>
						<tr>
							<th  scope="col" colspan="2">분류</th>
							<th  scope="col" rowspan="2">구분(명칭)</th>
							<th  scope="col" rowspan="2">금 액</th>
							<th  scope="col" rowspan="2">최소금액</th>
							<th  scope="col" rowspan="2">최대금액</th>
							<th  scope="col" rowspan="2">비고</th>
						</tr>
						<tr>
							<th scope="col">중분류</th>
							<th scope="col">소분류</th>
						</tr>
					</thead>
					<tbody>
                        <tr>
							<th scope="row" rowspan="22">초음파검사료</th>
							<th scope="row">횡파 탄성 초음파 영상</th>
							<td>sono SWE</td>
							<td>50,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
						</tr>
						<tr>
							<th scope="row">초음파검사-유방</th>
							<td>sono breast</td>
							<td>130,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사-유방</th>
							<td>sono F/U breast</td>
							<td>70,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사-유방</th>
							<td>sono F/U breast</td>
							<td>25,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사-유방(유도초음파)</th>
							<td>sono breast : CNB1</td>
							<td>210,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사-유방(유도초음파)</th>
							<td>sono breast : CNB2</td>
							<td>70,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사-갑상선</th>
							<td>sono thyroid</td>
							<td>90,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사-혈관-경동맥</th>
							<td>sono carotid artery</td>
							<td>80,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사-심장-경흉부심초음파-일반</th>
							<td>sono Echocardiograrhy</td>
							<td>130,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사</th>
							<td>일반</td>
							<td>50,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사</th>
							<td>sono soft tissue mass</td>
							<td>70,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파검사</th>
							<td>intraop ultrasonography</td>
							<td>100,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파내시경</th>
							<td>상부(수면)</td>
							<td>350,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파내시경</th>
							<td>하부(수면)</td>
							<td>360,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파내시경</th>
							<td>상부(비수면)</td>
							<td>250,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">초음파내시경</th>
							<td>하부(비수면)</td>
							<td>260,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="scrollbox">
			<div class="tdetail tdetail04">
				<table>
					<caption>분류, 명칭, 금액, 최소금액, 최대금액, 비고로 이루어진 표</caption>
					<col style="width:184px">
					<col>
					<col style="width:200px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<thead>
						<tr>
							<th  scope="col" colspan="2">분류</th>
							<th  scope="col" rowspan="2">구분(명칭)</th>
							<th  scope="col" rowspan="2">금 액</th>
							<th  scope="col" rowspan="2">최소금액</th>
							<th  scope="col" rowspan="2">최대금액</th>
							<th  scope="col" rowspan="2">비고</th>
						</tr>
						<tr>
							<th scope="col">중분류</th>
							<th scope="col">소분류</th>
						</tr>
					</thead>
					<tbody>
                        <tr>
							<th scope="row" rowspan="2">검사료</th>
							<th scope="row">당뇨검사</th>
							<td>연속혈당측정검사(초회)</td>
							<td>50,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">당뇨검사</th>
							<td>연속혈당측정검사(2차이후)</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">수술실재료대</th>
							<th scope="row">Rainbow RD set-2</th>
							<td>-</td>
							<td>240,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">처치재료대</th>
							<th scope="row">ROGG LATEXFREE SHORT STRECH</th>
							<td>-</td>
							<td>38,350</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">검사재료</th>
							<th scope="row">프리스타일리브레CGM SENSOR</th>
							<td>-</td>
							<td>84,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="scrollbox">
			<div class="tdetail tdetail04">
				<table>
					<caption>분류, 명칭, 금액, 최소금액, 최대금액, 비고로 이루어진 표</caption>
					<col style="width:184px">
					<col>
					<col style="width:200px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<thead>
						<tr>
							<th  scope="col" colspan="2">분류</th>
							<th  scope="col" rowspan="2">구분(명칭)</th>
							<th  scope="col" rowspan="2">금 액</th>
							<th  scope="col" rowspan="2">최소금액</th>
							<th  scope="col" rowspan="2">최대금액</th>
							<th  scope="col" rowspan="2">비고</th>
						</tr>
						<tr>
							<th scope="col">중분류</th>
							<th scope="col">소분류</th>
						</tr>
					</thead>
					<tbody>
                        <tr>
							<th scope="row" rowspan="8">처치료</th>
							<td scope="row">진공보조 유방 생검시 유도 초음파</td>
							<td>BOTH</td>
							<td>800,000</td>
							<td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">진공보조 유방 생검시 유도 초음파</th>
							<td>multi추가</td>
							<td>600,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">진공보조 유방 생검시 유도 초음파</th>
							<td>진공보조 유방 생검시 <br>유도 초음파 <br>A,B,C,D,E,F,G,H</td>
							<td>-</td>
							<td>1,200,000</td>
							<td>3,000,000</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">함몰유두 성형술</th>
							<td>한쪽</td>
							<td>-</td>
							<td>400,000</td>
							<td>500,000</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">함몰유두 성형술</th>
							<td>양쪽</td>
							<td>-</td>
							<td>800,000</td>
							<td>1,000,000</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">함몰유두 성형술</th>
							<td>재수술</td>
							<td>35,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">위 보톡스</th>
							<td>위 보톡스</td>
							<td>1,000,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">위풍선 삽입술</th>
							<td>엔드볼</td>
							<td>4,500,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row" rowspan="9">처치재료</th>
							<th scope="row">INNOMED SILICONE TAPE</th>
							<td>-</td>
							<td>50,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">좌욕기</th>
							<td>-</td>
							<td>11,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">STANPAD</th>
							<td>-</td>
							<td>136,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">SAFETY LOCK</th>
							<td>-</td>
							<td>20,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">Safe Pad</th>
							<td>-</td>
							<td>20,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">폴리클립</th>
							<td>-</td>
							<td>16,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">BNG FIX</th>
							<td>-</td>
							<td>13,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">GM SUTION FIX</th>
							<td>-</td>
							<td>24,200</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">PROSTER SKIN CARE</th>
							<td>-</td>
							<td>88,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="scrollbox">
			<div class="tdetail tdetail04">
				<table>
					<caption>분류, 명칭, 금액, 최소금액, 최대금액, 비고로 이루어진 표</caption>
					<col style="width:184px">
					<col>
					<col style="width:200px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<thead>
						<tr>
							<th  scope="col" colspan="2">분류</th>
							<th  scope="col" rowspan="2">구분(명칭)</th>
							<th  scope="col" rowspan="2">금 액</th>
							<th  scope="col" rowspan="2">최소금액</th>
							<th  scope="col" rowspan="2">최대금액</th>
							<th  scope="col" rowspan="2">비고</th>
						</tr>
						<tr>
							<th scope="col">중분류</th>
							<th scope="col">소분류</th>
						</tr>
					</thead>
					<tbody>
                        <tr>
							<th scope="row" rowspan="10">예방접종료</th>
							<td>대상포진</td>
							<td>조스타박스</td>
							<td>180,000</td>
							<td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">A형간염백신</th>
							<td>-</td>
							<td>80,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">B형간염백신</th>
							<td>유박스비</td>
							<td>35,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">가다실주</th>
							<td>-</td>
							<td>180,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">가다실9주</th>
							<td>-</td>
							<td>210,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">엠엠알</th>
							<td>-</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">부스트릭스</th>
							<td>-</td>
							<td>40,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">에스케이티디백신주</th>
							<td>-</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">폐구균주사</th>
							<td>프리베나13주</td>
							<td>130,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">인플루엔자</th>
							<td>-</td>
							<td>40,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="scrollbox">
			<div class="tdetail tdetail04">
				<table>
					<caption>분류, 명칭, 금액, 최소금액, 최대금액, 비고로 이루어진 표</caption>
					<col style="width:184px">
					<col>
					<col style="width:200px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<thead>
						<tr>
							<th  scope="col" colspan="2">분류</th>
							<th  scope="col" rowspan="2">구분(명칭)</th>
							<th  scope="col" rowspan="2">금 액</th>
							<th  scope="col" rowspan="2">최소금액</th>
							<th  scope="col" rowspan="2">최대금액</th>
							<th  scope="col" rowspan="2">비고</th>
						</tr>
						<tr>
							<th scope="col">중분류</th>
							<th scope="col">소분류</th>
						</tr>
					</thead>
					<tbody>
                        <tr>
							<th scope="row" rowspan="15">약제</th>
							<td>네비도주</td>
							<td>-</td>
							<td>350,000</td>
							<td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">멘비오주</th>
							<td>-</td>
							<td>150,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">위너프페리주502ml</th>
							<td>-</td>
							<td>120,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">라보솔</th>
							<td>-</td>
							<td>60,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">바이타솔주</th>
							<td>-</td>
							<td>70,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">콤비플렉스엠시티페리주</th>
							<td>-</td>
							<td>100,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">아스코플러스주</th>
							<td>-</td>
							<td>15,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">닥터라민100ml</th>
							<td>-</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">닥터라민250ml</th>
							<td>-</td>
							<td>50,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">비에비스</th>
							<td>-</td>
							<td>80,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">비비에스</th>
							<td>-</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">네오미노화겐</th>
							<td>-</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">구치온주</th>
							<td>-</td>
							<td>40,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">비타민D3비오엔주</th>
							<td>-</td>
							<td>50,000</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                        <tr>
							<th scope="row">브리디온주</th>
							<td>-</td>
							<td>243,200</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="scrollbox">
			<div class="tdetail tdetail04">
				<table>
					<caption>분류, 명칭, 금액, 최소금액, 최대금액, 비고로 이루어진 표</caption>
					<col style="width:184px">
					<col>
					<col style="width:200px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<col style="width:125px">
					<thead>
						<tr>
							<th  scope="col" colspan="2">분류</th>
							<th  scope="col" rowspan="2">구분(명칭)</th>
							<th  scope="col" rowspan="2">금 액</th>
							<th  scope="col" rowspan="2">최소금액</th>
							<th  scope="col" rowspan="2">최대금액</th>
							<th  scope="col" rowspan="2">비고</th>
						</tr>
						<tr>
							<th scope="col">중분류</th>
							<th scope="col">소분류</th>
						</tr>
					</thead>
					<tbody>
                        <tr>
							<th scope="row" rowspan="15">제증명수수료</th>
							<td>진단서</td>
							<td>일반진단서</td>
							<td>10,000</td>
							<td>-</td>
                            <td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">사망진단서</th>
							<td>-</td>
							<td>10,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">장애진단서</th>
							<td>-</td>
							<td>15,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">장애인증명서</th>
							<td>장애인증명서<br>(소득공제용)</td>
							<td>-</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">소견서</th>
							<td>-</td>
							<td>10,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">수술(시술)확인서</th>
							<td>-</td>
							<td>3,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">병사용진단서</th>
							<td>-</td>
							<td>20,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">확인서</th>
							<td>통원확인서</td>
							<td>3,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">진료기록사본</th>
							<td>chart복사(5장기본)</td>
							<td>1,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">진료기록사본</th>
							<td>추가 장당(6매 이상)</td>
							<td>100</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">진료기록(영상)</th>
							<td>CD COPY</td>
							<td>10,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">입원사실 증명서</th>
							<td>입퇴원확인서</td>
							<td>3,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">채용신체 검사서</th>
							<td>채용신체검사</td>
							<td>30,000</td>
							<td>-</td>
							<td>-</td>
                            <td>사용부서:<br>건강검진</td>
                        </tr>
                        <tr>
							<th scope="row">제증명서 사본</th>
							<td>추가 및 재발급</td>
							<td>1,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
                        <tr>
							<th scope="row">영문(진단서/소견서)</th>
							<td>진단서/소견서</td>
							<td>20,000</td>
							<td>-</td>
							<td>-</td>
                            <td>-</td>
                        </tr>
					</tbody>
				</table>
			</div>
		</div>
		<p class="desc02 c_point mt20">* “의료기관의 제증명수수료 항목 및 금액에 관한 기준” 고시 발표에 따라 제증명서 발급을 위한 진찰료는 별도 산정됩니다. (2017년 9월 21일부터 시행) </p>