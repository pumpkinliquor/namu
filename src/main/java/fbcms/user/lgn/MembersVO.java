package fbcms.user.lgn;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;

/**
 * @Class Name : MembersVO
 * @Description 회원정보 membersVO class
 * @author 이민재
 * @since 2020.11.05
 */

/*@SuppressWarnings("serial")*/
public class MembersVO extends ComDefaultVO /*implements Serializable,UserDetails */{
	private LoginVO loginVO;
	/*주소*/
	private String ADRES;
	/*지역번호*/
	private String AREA_NO;
	/*생년월일*/
	private String BIRTH_DT;
	/*상세주소*/
	private String DETAIL_ADRES;
	/*이메일 수신여부*/
	private String EMAIL_RECV_YN;
	/*끝전화번호*/
	private String END_TELNO;
	/*고유ID*/
	private String ESNTL_ID;
	/*회원가입일시*/
	private String FRIST_JOIN_DT;
	/*그룹ID*/
	private String GROUP_ID;
	/*구분 (01:일반,02:비스타,03:뷰,04:비회원)*/
	private String GUBN_CD;
	/*주민등록번호*/
	private String IHIDNUM;
	/*최종 로그인 일시*/
	private String LAST_LOGIN_DT;
	/*잠금여부*/
	private String LOCK_AT;
	/*잠금회수*/
	private String LOCK_CNT;
	/*잠금최종시점*/
	private String LOCK_LAST_PNTTM;
	/*회원이메일주소*/
	private String MBER_EMAIL_ADRES;
	/*회원팩스번호*/
	private String MBER_FXNUM;
	/*회원ID*/
	private String MBER_ID;
	/*회원명*/
	private String MBER_NM;
	/*회원상태*/
	private String MBER_STTUS;
	/*이동전화번호*/
	private String MBTLNUM;
	/*중간전화번호*/
	private String MIDDLE_TELNO;
	/*비밀번호*/
	private String PASSWORD;
	/*비밀번호정답*/
	private String PASSWORD_CNSR;
	/*비밀번호힌트*/
	private String PASSWORD_HINT;
	/*비밀번호 초기화여부*/
	private String PW_INIT_YN;
	/*가입일자*/
	private String SBSCRB_DE;
	/*성별코드*/
	private String SEXDSTN_CODE;
	/*상태 (01:정상, 02:휴면)*/
	private String STAT_CD;
	/*우편번호*/
	private String ZIP;
	
	
	/*아이디*/
	private String USER_ID;
	/*연동계정코드 (NAVER:네이버, KAKAO:카카오, GOOGLE:구글)*/
	private String ITL_ACCT_CD;
	/*연동여부*/
	private String ITL_YN;
	/*토큰 값*/
	private String TOKEN_SN;
	
	/*계정 연동 데이터*/
	private String google;
	private String naver;
	private String kakao;
	private String googleToken;
	private String naverToken;
	private String kakaoToken;
	
	
	/*검색 시작일*/
	private String searchBgnDate;
	/*검색 종료일*/
	private String serachEndDate;
	
	/** 현재페이지 */
	private int pageIndex = 1;
	
	/** 페이지갯수 */
	private int pageUnit = 10;
	
	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;
	
	
	
	
	/**
	 * @return the uSER_ID
	 */
	public String getUSER_ID() {
		return USER_ID;
	}
	/**
	 * @param uSER_ID the uSER_ID to set
	 */
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	/**
	 * @return the iTL_ACCT_CD
	 */
	public String getITL_ACCT_CD() {
		return ITL_ACCT_CD;
	}
	/**
	 * @param iTL_ACCT_CD the iTL_ACCT_CD to set
	 */
	public void setITL_ACCT_CD(String iTL_ACCT_CD) {
		ITL_ACCT_CD = iTL_ACCT_CD;
	}
	/**
	 * @return the iTL_YN
	 */
	public String getITL_YN() {
		return ITL_YN;
	}
	/**
	 * @param iTL_YN the iTL_YN to set
	 */
	public void setITL_YN(String iTL_YN) {
		ITL_YN = iTL_YN;
	}
	/**
	 * @return the loginVO
	 */
	public LoginVO getLoginVO() {
		return loginVO;
	}
	/**
	 * @param loginVO the loginVO to set
	 */
	public void setLoginVO(LoginVO loginVO) {
		this.loginVO = loginVO;
	}
	/**
	 * @return the aDRES
	 */
	public String getADRES() {
		return ADRES;
	}
	/**
	 * @param aDRES the aDRES to set
	 */
	public void setADRES(String aDRES) {
		ADRES = aDRES;
	}
	/**
	 * @return the aREA_NO
	 */
	public String getAREA_NO() {
		return AREA_NO;
	}
	/**
	 * @param aREA_NO the aREA_NO to set
	 */
	public void setAREA_NO(String aREA_NO) {
		AREA_NO = aREA_NO;
	}
	/**
	 * @return the bIRTH_DT
	 */
	public String getBIRTH_DT() {
		return BIRTH_DT;
	}
	/**
	 * @param bIRTH_DT the bIRTH_DT to set
	 */
	public void setBIRTH_DT(String bIRTH_DT) {
		BIRTH_DT = bIRTH_DT;
	}
	/**
	 * @return the dETAIL_ADRES
	 */
	public String getDETAIL_ADRES() {
		return DETAIL_ADRES;
	}
	/**
	 * @param dETAIL_ADRES the dETAIL_ADRES to set
	 */
	public void setDETAIL_ADRES(String dETAIL_ADRES) {
		DETAIL_ADRES = dETAIL_ADRES;
	}
	/**
	 * @return the eMAIL_RECV_YN
	 */
	public String getEMAIL_RECV_YN() {
		return EMAIL_RECV_YN;
	}
	/**
	 * @param eMAIL_RECV_YN the eMAIL_RECV_YN to set
	 */
	public void setEMAIL_RECV_YN(String eMAIL_RECV_YN) {
		EMAIL_RECV_YN = eMAIL_RECV_YN;
	}
	/**
	 * @return the eND_TELNO
	 */
	public String getEND_TELNO() {
		return END_TELNO;
	}
	/**
	 * @param eND_TELNO the eND_TELNO to set
	 */
	public void setEND_TELNO(String eND_TELNO) {
		END_TELNO = eND_TELNO;
	}
	/**
	 * @return the eSNTL_ID
	 */
	public String getESNTL_ID() {
		return ESNTL_ID;
	}
	/**
	 * @param eSNTL_ID the eSNTL_ID to set
	 */
	public void setESNTL_ID(String eSNTL_ID) {
		ESNTL_ID = eSNTL_ID;
	}
	/**
	 * @return the fRIST_JOIN_DT
	 */
	public String getFRIST_JOIN_DT() {
		return FRIST_JOIN_DT;
	}
	/**
	 * @param fRIST_JOIN_DT the fRIST_JOIN_DT to set
	 */
	public void setFRIST_JOIN_DT(String fRIST_JOIN_DT) {
		FRIST_JOIN_DT = fRIST_JOIN_DT;
	}
	/**
	 * @return the gROUP_ID
	 */
	public String getGROUP_ID() {
		return GROUP_ID;
	}
	/**
	 * @param gROUP_ID the gROUP_ID to set
	 */
	public void setGROUP_ID(String gROUP_ID) {
		GROUP_ID = gROUP_ID;
	}
	/**
	 * @return the gUBN_CD
	 */
	public String getGUBN_CD() {
		return GUBN_CD;
	}
	/**
	 * @param gUBN_CD the gUBN_CD to set
	 */
	public void setGUBN_CD(String gUBN_CD) {
		GUBN_CD = gUBN_CD;
	}
	/**
	 * @return the iHIDNUM
	 */
	public String getIHIDNUM() {
		return IHIDNUM;
	}
	/**
	 * @param iHIDNUM the iHIDNUM to set
	 */
	public void setIHIDNUM(String iHIDNUM) {
		IHIDNUM = iHIDNUM;
	}
	/**
	 * @return the lAST_LOGIN_DT
	 */
	public String getLAST_LOGIN_DT() {
		return LAST_LOGIN_DT;
	}
	/**
	 * @param lAST_LOGIN_DT the lAST_LOGIN_DT to set
	 */
	public void setLAST_LOGIN_DT(String lAST_LOGIN_DT) {
		LAST_LOGIN_DT = lAST_LOGIN_DT;
	}
	/**
	 * @return the lOCK_AT
	 */
	public String getLOCK_AT() {
		return LOCK_AT;
	}
	/**
	 * @param lOCK_AT the lOCK_AT to set
	 */
	public void setLOCK_AT(String lOCK_AT) {
		LOCK_AT = lOCK_AT;
	}
	/**
	 * @return the lOCK_CNT
	 */
	public String getLOCK_CNT() {
		return LOCK_CNT;
	}
	/**
	 * @param lOCK_CNT the lOCK_CNT to set
	 */
	public void setLOCK_CNT(String lOCK_CNT) {
		LOCK_CNT = lOCK_CNT;
	}
	/**
	 * @return the lOCK_LAST_PNTTM
	 */
	public String getLOCK_LAST_PNTTM() {
		return LOCK_LAST_PNTTM;
	}
	/**
	 * @param lOCK_LAST_PNTTM the lOCK_LAST_PNTTM to set
	 */
	public void setLOCK_LAST_PNTTM(String lOCK_LAST_PNTTM) {
		LOCK_LAST_PNTTM = lOCK_LAST_PNTTM;
	}
	/**
	 * @return the mBER_EMAIL_ADRES
	 */
	public String getMBER_EMAIL_ADRES() {
		return MBER_EMAIL_ADRES;
	}
	/**
	 * @param mBER_EMAIL_ADRES the mBER_EMAIL_ADRES to set
	 */
	public void setMBER_EMAIL_ADRES(String mBER_EMAIL_ADRES) {
		MBER_EMAIL_ADRES = mBER_EMAIL_ADRES;
	}
	/**
	 * @return the mBER_FXNUM
	 */
	public String getMBER_FXNUM() {
		return MBER_FXNUM;
	}
	/**
	 * @param mBER_FXNUM the mBER_FXNUM to set
	 */
	public void setMBER_FXNUM(String mBER_FXNUM) {
		MBER_FXNUM = mBER_FXNUM;
	}
	/**
	 * @return the mBER_ID
	 */
	public String getMBER_ID() {
		return MBER_ID;
	}
	/**
	 * @param mBER_ID the mBER_ID to set
	 */
	public void setMBER_ID(String mBER_ID) {
		MBER_ID = mBER_ID;
	}
	/**
	 * @return the mBER_NM
	 */
	public String getMBER_NM() {
		return MBER_NM;
	}
	/**
	 * @param mBER_NM the mBER_NM to set
	 */
	public void setMBER_NM(String mBER_NM) {
		MBER_NM = mBER_NM;
	}
	/**
	 * @return the mBER_STTUS
	 */
	public String getMBER_STTUS() {
		return MBER_STTUS;
	}
	/**
	 * @param mBER_STTUS the mBER_STTUS to set
	 */
	public void setMBER_STTUS(String mBER_STTUS) {
		MBER_STTUS = mBER_STTUS;
	}
	/**
	 * @return the mBTLNUM
	 */
	public String getMBTLNUM() {
		return MBTLNUM;
	}
	/**
	 * @param mBTLNUM the mBTLNUM to set
	 */
	public void setMBTLNUM(String mBTLNUM) {
		MBTLNUM = mBTLNUM;
	}
	/**
	 * @return the mIDDLE_TELNO
	 */
	public String getMIDDLE_TELNO() {
		return MIDDLE_TELNO;
	}
	/**
	 * @param mIDDLE_TELNO the mIDDLE_TELNO to set
	 */
	public void setMIDDLE_TELNO(String mIDDLE_TELNO) {
		MIDDLE_TELNO = mIDDLE_TELNO;
	}
	/**
	 * @return the pASSWORD
	 */
	public String getPASSWORD() {
		return PASSWORD;
	}
	/**
	 * @param pASSWORD the pASSWORD to set
	 */
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	/**
	 * @return the pASSWORD_CNSR
	 */
	public String getPASSWORD_CNSR() {
		return PASSWORD_CNSR;
	}
	/**
	 * @param pASSWORD_CNSR the pASSWORD_CNSR to set
	 */
	public void setPASSWORD_CNSR(String pASSWORD_CNSR) {
		PASSWORD_CNSR = pASSWORD_CNSR;
	}
	/**
	 * @return the pASSWORD_HINT
	 */
	public String getPASSWORD_HINT() {
		return PASSWORD_HINT;
	}
	/**
	 * @param pASSWORD_HINT the pASSWORD_HINT to set
	 */
	public void setPASSWORD_HINT(String pASSWORD_HINT) {
		PASSWORD_HINT = pASSWORD_HINT;
	}
	/**
	 * @return the pW_INIT_YN
	 */
	public String getPW_INIT_YN() {
		return PW_INIT_YN;
	}
	/**
	 * @param pW_INIT_YN the pW_INIT_YN to set
	 */
	public void setPW_INIT_YN(String pW_INIT_YN) {
		PW_INIT_YN = pW_INIT_YN;
	}
	/**
	 * @return the sBSCRB_DE
	 */
	public String getSBSCRB_DE() {
		return SBSCRB_DE;
	}
	/**
	 * @param sBSCRB_DE the sBSCRB_DE to set
	 */
	public void setSBSCRB_DE(String sBSCRB_DE) {
		SBSCRB_DE = sBSCRB_DE;
	}
	/**
	 * @return the sEXDSTN_CODE
	 */
	public String getSEXDSTN_CODE() {
		return SEXDSTN_CODE;
	}
	/**
	 * @param sEXDSTN_CODE the sEXDSTN_CODE to set
	 */
	public void setSEXDSTN_CODE(String sEXDSTN_CODE) {
		SEXDSTN_CODE = sEXDSTN_CODE;
	}
	/**
	 * @return the sTAT_CD
	 */
	public String getSTAT_CD() {
		return STAT_CD;
	}
	/**
	 * @param sTAT_CD the sTAT_CD to set
	 */
	public void setSTAT_CD(String sTAT_CD) {
		STAT_CD = sTAT_CD;
	}
	/**
	 * @return the zIP
	 */
	public String getZIP() {
		return ZIP;
	}
	/**
	 * @param zIP the zIP to set
	 */
	public void setZIP(String zIP) {
		ZIP = zIP;
	}
	/*
	*//**
	 * @return the aUTHORITY
	 *//*
	public String getAUTHORITY() {
		return AUTHORITY;
	}
	*//**
	 * @param aUTHORITY the aUTHORITY to set
	 *//*
	public void setAUTHORITY(String aUTHORITY) {
		AUTHORITY = aUTHORITY;
	}*/
	/**
	 * @return the searchBgnDate
	 */
	public String getSearchBgnDate() {
		return searchBgnDate;
	}
	/**
	 * @param searchBgnDate the searchBgnDate to set
	 */
	public void setSearchBgnDate(String searchBgnDate) {
		this.searchBgnDate = searchBgnDate;
	}
	/**
	 * @return the serachEndDate
	 */
	public String getSerachEndDate() {
		return serachEndDate;
	}
	/**
	 * @param serachEndDate the serachEndDate to set
	 */
	public void setSerachEndDate(String serachEndDate) {
		this.serachEndDate = serachEndDate;
	}
	/**
	 * @return the pageIndex
	 */
	public int getPageIndex() {
		return pageIndex;
	}
	/**
	 * @param pageIndex the pageIndex to set
	 */
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	/**
	 * @return the pageUnit
	 */
	public int getPageUnit() {
		return pageUnit;
	}
	/**
	 * @param pageUnit the pageUnit to set
	 */
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	/**
	 * @return the pageSize
	 */
	public int getPageSize() {
		return pageSize;
	}
	/**
	 * @param pageSize the pageSize to set
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	/**
	 * @return the firstIndex
	 */
	public int getFirstIndex() {
		return firstIndex;
	}
	/**
	 * @param firstIndex the firstIndex to set
	 */
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	/**
	 * @return the lastIndex
	 */
	public int getLastIndex() {
		return lastIndex;
	}
	/**
	 * @param lastIndex the lastIndex to set
	 */
	public void setLastIndex(int lastIndex) {
		this.lastIndex = lastIndex;
	}
	/**
	 * @return the recordCountPerPage
	 */
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	/**
	 * @param recordCountPerPage the recordCountPerPage to set
	 */
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	/**
	 * @return the tOKEN_SN
	 */
	public String getTOKEN_SN() {
		return TOKEN_SN;
	}
	/**
	 * @param tOKEN_SN the tOKEN_SN to set
	 */
	public void setTOKEN_SN(String tOKEN_SN) {
		TOKEN_SN = tOKEN_SN;
	}
	/**
	 * @return the google
	 */
	public String getGoogle() {
		return google;
	}
	/**
	 * @param google the google to set
	 */
	public void setGoogle(String google) {
		this.google = google;
	}
	/**
	 * @return the naver
	 */
	public String getNaver() {
		return naver;
	}
	/**
	 * @param naver the naver to set
	 */
	public void setNaver(String naver) {
		this.naver = naver;
	}
	/**
	 * @return the kakao
	 */
	public String getKakao() {
		return kakao;
	}
	/**
	 * @param kakao the kakao to set
	 */
	public void setKakao(String kakao) {
		this.kakao = kakao;
	}
	/**
	 * @return the googleToken
	 */
	public String getGoogleToken() {
		return googleToken;
	}
	/**
	 * @param googleToken the googleToken to set
	 */
	public void setGoogleToken(String googleToken) {
		this.googleToken = googleToken;
	}
	/**
	 * @return the naverToken
	 */
	public String getNaverToken() {
		return naverToken;
	}
	/**
	 * @param naverToken the naverToken to set
	 */
	public void setNaverToken(String naverToken) {
		this.naverToken = naverToken;
	}
	/**
	 * @return the kakaoToken
	 */
	public String getKakaoToken() {
		return kakaoToken;
	}
	/**
	 * @param kakaoToken the kakaoToken to set
	 */
	public void setKakaoToken(String kakaoToken) {
		this.kakaoToken = kakaoToken;
	}
	
	

}
