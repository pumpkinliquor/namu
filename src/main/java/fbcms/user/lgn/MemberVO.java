package fbcms.user.lgn;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import egovframework.com.cmm.ComDefaultVO;
import egovframework.com.cmm.LoginVO;
/**
 * @Class Name : MemberVO
 * @Description 회원정보 memberVO class
 * @author 김명진
 * @since 2020.10.05
 */
@SuppressWarnings("serial")
public class MemberVO extends ComDefaultVO implements Serializable,UserDetails{
	private LoginVO loginVO;
	/*회원ID*/
	private String USER_ID;			
	/*회원이름*/
	private String USER_NM;			
	/*비밀번호*/
	private String PW_NM;	
	/*휴먼 상태*/
	private String STAT_CD;
	/*회원 구분*/
	private String GUBN_CD;
	/*이메일*/
	private String EMAIL_ID;
	/*화원가입 일*/
	private String FRIST_JOIN_DT;
	/*성별*/
	private String GENDER_CD;	
	/*생일*/
	private String BIRTH_DT;
	/*이동전화*/
	private String MOBILE_PHONE_NO;	
	/*전화번호*/
	private String PHONE_NO;	
	/*우편번호*/
	private String POST_NO;	
	/*주소*/	
	private String ADDR_TX;			
	/*상세주소*/
	private String ADDR_DTIL_TX;			
	/*이메일수신여부*/
	private String EMAIL_RECV_YN="N";	
	/*마지막 로그인 시점*/
	private String LAST_LOGIN_DT;
	
	/*검색 시작일*/
	private String searchBgnDate;
	/*검색 종료일*/
	private String serachEndDate;
	
	/*비밀번호 초기화 여부*/
	private String PW_INIT_YN;
	
	
	
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
	 * @return the STAT_CD
	 */
	public String getSTAT_CD() {
		return STAT_CD;
	}
	/**
	 * @param STAT_CD the STAT_CD to set
	 */
	public void setSTAT_CD(String STAT_CD) {
		this.STAT_CD = STAT_CD;
	}
	/**
	 * @return the LAST_LOGIN_DT
	 */
	public String getLAST_LOGIN_DT() {
		return LAST_LOGIN_DT;
	}
	/**
	 * @return the GUBN_CD
	 */
	public String getGUBN_CD() {
		return GUBN_CD;
	}
	/**
	 * @param GUBN_CD the GUBN_CD to set
	 */
	public void setGUBN_CD(String GUBN_CD) {
		this.GUBN_CD = GUBN_CD;
	}
	/**
	 * @param LAST_LOGIN_DT the LAST_LOGIN_DT to set
	 */
	public void setLAST_LOGIN_DT(String LAST_LOGIN_DT) {
		this.LAST_LOGIN_DT = LAST_LOGIN_DT;
	}
	/**
	 * @return the FRIST_JOIN_DT
	 */
	public String getFRIST_JOIN_DT() {
		return FRIST_JOIN_DT;
	}
	/**
	 * @param FRIST_JOIN_DT the FRIST_JOIN_DT to set
	 */
	public void setFRIST_JOIN_DT(String FRIST_JOIN_DT) {
		this.FRIST_JOIN_DT = FRIST_JOIN_DT;
	}
	/**
	 * @return the searchBgnDate
	 */
	public String getSearchBgnDate() {
		if(searchBgnDate!=null)
			return searchBgnDate.replaceAll("\\.",  "-");
		else return searchBgnDate;
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
		if(serachEndDate!=null)
			return serachEndDate.replaceAll("\\.", "-");
		else return serachEndDate;
	}
	/**
	 * @param serachEndDate the serachEndDate to set
	 */
	public void setSerachEndDate(String serachEndDate) {
		this.serachEndDate = serachEndDate;
	}
	/**
	 * @return the USER_ID
	 */
	public String getUSER_ID() {
		return USER_ID;
	}
	/**
	 * @param USER_ID the USER_ID to set
	 */
	public void setUSER_ID(String USER_ID) {
		this.USER_ID = USER_ID;
	}
	/**
	 * @return the USER_NM
	 */
	public String getUSER_NM() {
		return USER_NM;
	}
	/**
	 * @param USER_NM the USER_NM to set
	 */
	public void setUSER_NM(String USER_NM) {
		this.USER_NM = USER_NM;
	}
	/**
	 * @return the PW_NM
	 */
	public String getPW_NM() {
		return PW_NM;
	}
	/**
	 * @param PW_NM the PW_NM to set
	 */
	public void setPW_NM(String PW_NM) {
		this.PW_NM = PW_NM;
	}
	/**
	 * @return the MOBILE_PHONE_NO
	 */
	public String getMOBILE_PHONE_NO() {
		return MOBILE_PHONE_NO;
	}
	/**
	 * @param MOBILE_PHONE_NO the MOBILE_PHONE_NO to set
	 */
	public void setMOBILE_PHONE_NO(String MOBILE_PHONE_NO) {
		this.MOBILE_PHONE_NO = MOBILE_PHONE_NO;
	}
	/**
	 * @return the PHONE_NO
	 */
	public String getPHONE_NO() {
		return PHONE_NO;
	}
	/**
	 * @param PHONE_NO the PHONE_NO to set
	 */
	public void setPHONE_NO(String PHONE_NO) {
		this.PHONE_NO = PHONE_NO;
	}
	/**
	 * @return the GENDER_CD
	 */
	public String getGENDER_CD() {
		return GENDER_CD;
	}
	/**
	 * @param GENDER_CD the GENDER_CD to set
	 */
	public void setGENDER_CD(String GENDER_CD) {
		this.GENDER_CD = GENDER_CD;
	}
	/**
	 * @return the BIRTH_DT
	 */
	public String getBIRTH_DT() {
		return BIRTH_DT;
	}
	/**
	 * @param BIRTH_DT the BIRTH_DT to set
	 */
	public void setBIRTH_DT(String BIRTH_DT) {
		this.BIRTH_DT = BIRTH_DT;
	}
	/**
	 * @return the EMAIL_ID
	 */
	public String getEMAIL_ID() {
		return EMAIL_ID;
	}
	/**
	 * @param EMAIL_ID the EMAIL_ID to set
	 */
	public void setEMAIL_ID(String EMAIL_ID) {
		this.EMAIL_ID = EMAIL_ID;
	}
	/**
	 * @return the ADDR_TX
	 */
	public String getADDR_TX() {
		return ADDR_TX;
	}
	/**
	 * @param ADDR_TX the ADDR_TX to set
	 */
	public void setADDR_TX(String ADDR_TX) {
		this.ADDR_TX = ADDR_TX;
	}
	/**
	 * @return the ADDR_DTIL_TX
	 */
	public String getADDR_DTIL_TX() {
		return ADDR_DTIL_TX;
	}
	/**
	 * @param ADDR_DTIL_TX the ADDR_DTIL_TX to set
	 */
	public void setADDR_DTIL_TX(String ADDR_DTIL_TX) {
		this.ADDR_DTIL_TX = ADDR_DTIL_TX;
	}
	/**
	 * @return the POST_NO
	 */
	public String getPOST_NO() {
		return POST_NO;
	}
	/**
	 * @param POST_NO the POST_NO to set
	 */
	public void setPOST_NO(String POST_NO) {
		this.POST_NO = POST_NO;
	}
	/**
	 * @return the EMAIL_RECV_YN
	 */
	public String getEMAIL_RECV_YN() {
		return EMAIL_RECV_YN;
	}
	/**
	 * @param EMAIL_RECV_YN the EMAIL_RECV_YN to set
	 */
	public void setEMAIL_RECV_YN(String EMAIL_RECV_YN) {
		this.EMAIL_RECV_YN = EMAIL_RECV_YN;
	}
	private String AUTHORITY = "ROLE_USER";
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(AUTHORITY));
        return auth;
	}

	@Override
	public String getPassword() {
		return this.PW_NM;
	}

	@Override
	public String getUsername() {
		return this.USER_ID;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		if(STAT_CD.equals("01"))
			return true;
		else
			return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		if(STAT_CD.equals("01"))
			return true;
		else
			return false;
	}
	
}
