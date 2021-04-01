package fbcms.user.lgn;

import egovframework.com.cmm.LoginVO;

public class UserInterlockVO {
	private LoginVO loginVO;
	/*아이디*/
	private String USER_ID;
	/*연동계정코드 (NAVER:네이버, KAKAO:카카오, GOOGLE:구글)*/
	private String ITL_ACCT_CD;
	/*연동여부*/
	private String ITL_YN;
	/*토큰*/
	private String TOKEN_SN;
	/*토큰2*/
	private String TOKEN2_SN;
	/*입력아이디*/
	private String ADD_ID;
	/*입력일자*/
	private String ADD_DT;
	/*수정아이디*/
	private String UPDT_ID;
	/*수정일자*/
	private String UPDT_DT;
	/*삭제여부*/
	private String DEL_YN;
	/*연동아이디*/
	private String ITL_ID;
	/*연동이메일*/
	private String ITL_EMAIL_ID;
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
	 * @return the tOKEN2_SN
	 */
	public String getTOKEN2_SN() {
		return TOKEN2_SN;
	}
	/**
	 * @param tOKEN2_SN the tOKEN2_SN to set
	 */
	public void setTOKEN2_SN(String tOKEN2_SN) {
		TOKEN2_SN = tOKEN2_SN;
	}
	/**
	 * @return the aDD_ID
	 */
	public String getADD_ID() {
		return ADD_ID;
	}
	/**
	 * @param aDD_ID the aDD_ID to set
	 */
	public void setADD_ID(String aDD_ID) {
		ADD_ID = aDD_ID;
	}
	/**
	 * @return the aDD_DT
	 */
	public String getADD_DT() {
		return ADD_DT;
	}
	/**
	 * @param aDD_DT the aDD_DT to set
	 */
	public void setADD_DT(String aDD_DT) {
		ADD_DT = aDD_DT;
	}
	/**
	 * @return the uPDT_ID
	 */
	public String getUPDT_ID() {
		return UPDT_ID;
	}
	/**
	 * @param uPDT_ID the uPDT_ID to set
	 */
	public void setUPDT_ID(String uPDT_ID) {
		UPDT_ID = uPDT_ID;
	}
	/**
	 * @return the uPDT_DT
	 */
	public String getUPDT_DT() {
		return UPDT_DT;
	}
	/**
	 * @param uPDT_DT the uPDT_DT to set
	 */
	public void setUPDT_DT(String uPDT_DT) {
		UPDT_DT = uPDT_DT;
	}
	/**
	 * @return the dEL_YN
	 */
	public String getDEL_YN() {
		return DEL_YN;
	}
	/**
	 * @param dEL_YN the dEL_YN to set
	 */
	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}
	/**
	 * @return the iTL_ID
	 */
	public String getITL_ID() {
		return ITL_ID;
	}
	/**
	 * @param iTL_ID the iTL_ID to set
	 */
	public void setITL_ID(String iTL_ID) {
		ITL_ID = iTL_ID;
	}
	/**
	 * @return the iTL_EMAIL_ID
	 */
	public String getITL_EMAIL_ID() {
		return ITL_EMAIL_ID;
	}
	/**
	 * @param iTL_EMAIL_ID the iTL_EMAIL_ID to set
	 */
	public void setITL_EMAIL_ID(String iTL_EMAIL_ID) {
		ITL_EMAIL_ID = iTL_EMAIL_ID;
	}
	
	
}
