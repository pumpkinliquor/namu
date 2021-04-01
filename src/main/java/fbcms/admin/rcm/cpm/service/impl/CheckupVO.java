package fbcms.admin.rcm.cpm.service.impl;

import egovframework.com.cmm.ComDefaultVO;


public class CheckupVO extends ComDefaultVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*검진코드*/
	private String DTIL_CD;
	/*검진명*/
	private String DTIL_CODE_NM;
	/*사용여부*/
	private String USE_YN;
	/*순서*/
	private int    ORDER_NO;
	/*삭제*/
	private String DEL_YN;
	/**
	 * @return 검진코드
	 */
	public String getDTIL_CD() {
		return DTIL_CD;
	}
	/**
	 * @param dTIL_CD 검진코드
	 */
	public void setDTIL_CD(String dTIL_CD) {
		DTIL_CD = dTIL_CD;
	}
	/**
	 * @return 검진명
	 */
	public String getDTIL_CODE_NM() {
		return DTIL_CODE_NM;
	}
	/**
	 * @param dTIL_CODE_NM 검진명
	 */
	public void setDTIL_CODE_NM(String dTIL_CODE_NM) {
		DTIL_CODE_NM = dTIL_CODE_NM;
	}
	/**
	 * @return 사용여부
	 */
	public String getUSE_YN() {
		return USE_YN;
	}
	/**
	 * @param uSE_YN 사용여부
	 */
	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
	}
	/**
	 * @return 순서
	 */
	public int getORDER_NO() {
		return ORDER_NO;
	}
	/**
	 * @param oRDER_NO 순서
	 */
	public void setORDER_NO(int oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
	/**
	 * @return 삭제
	 */
	public String getDEL_YN() {
		return DEL_YN;
	}
	/**
	 * @param dEL_YN 삭제
	 */
	public void setDEL_YN(String dEL_YN) {
		DEL_YN = dEL_YN;
	}
	

}
