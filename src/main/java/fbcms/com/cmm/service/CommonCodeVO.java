package fbcms.com.cmm.service;

/**
 * 공통코드  VO 클래스
 * @author 김명진
 * @since 2020.10.14
 */
public class CommonCodeVO {
	/*공통코드*/
	private String COMMON_CODE;
	/*코드*/
	private String CODE;
	/*코드명*/
	private String NAME;
	
	/**
	 * @return the cOMMON_CODE
	 */
	public String getCOMMON_CODE() {
		return COMMON_CODE;
	}
	/**
	 * @param cOMMON_CODE the cOMMON_CODE to set
	 */
	public void setCOMMON_CODE(String cOMMON_CODE) {
		COMMON_CODE = cOMMON_CODE;
	}
	/**
	 * @return the cODE
	 */
	public String getCODE() {
		return CODE;
	}
	/**
	 * @param cODE the cODE to set
	 */
	public void setCODE(String cODE) {
		CODE = cODE;
	}
	/**
	 * @return the nAME
	 */
	public String getNAME() {
		return NAME;
	}
	/**
	 * @param nAME the nAME to set
	 */
	public void setNAME(String nAME) {
		NAME = nAME;
	}
}
