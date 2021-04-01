package fbcms.admin.hpm.ctm.service.Impl;

import java.util.List;

/**
 * 센터 관리 템플릿 
 * @author 김명진
 * @since 2020.10.20
 */
public class CenterTemplVO {
	/*센터 02 클리닉 03*/
	private String MNG_GUBN_CD;
	/*센터코드*/
	private String MNG_CD;
	/*관리 순번*/
	private String MNG_SEQ;
	/*클리닉 순번*/
	private String SEQ;
	/*영역 타이틀*/
	private String AREA_TITLE_CT;
	/*노출개수코드*/
	private String SHOW_CNT_CD;
	/*사용여부*/
	private String USE_YN;
	/*VS표기사용여부*/
	private String VS_MARK_USE_YN;
	private List<CenterTemplDetailVO> DTIL_LIST;
	
	
	/**
	 * @return the mNG_GUBN_CD
	 */
	public String getMNG_GUBN_CD() {
		return MNG_GUBN_CD;
	}
	/**
	 * @param mNG_GUBN_CD the mNG_GUBN_CD to set
	 */
	public void setMNG_GUBN_CD(String mNG_GUBN_CD) {
		MNG_GUBN_CD = mNG_GUBN_CD;
	}
	/**
	 * @return the mNG_SEQ
	 */
	public String getMNG_SEQ() {
		return MNG_SEQ;
	}
	/**
	 * @param mNG_SEQ the mNG_SEQ to set
	 */
	public void setMNG_SEQ(String mNG_SEQ) {
		MNG_SEQ = mNG_SEQ;
	}
	/**
	 * @return the sEQ
	 */
	public String getSEQ() {
		return SEQ;
	}
	/**
	 * @param sEQ the sEQ to set
	 */
	public void setSEQ(String sEQ) {
		SEQ = sEQ;
	}
	
	
	/**
	 * @return the dTIL_LIST
	 */
	public List<CenterTemplDetailVO> getDTIL_LIST() {
		return DTIL_LIST;
	}
	/**
	 * @param dTIL_LIST the dTIL_LIST to set
	 */
	public void setDTIL_LIST(List<CenterTemplDetailVO> dTIL_LIST) {
		DTIL_LIST = dTIL_LIST;
	}
	/**
	 * @return the mNG_CD 센터코드
	 */
	public String getMNG_CD() {
		return MNG_CD;
	}
	/**
	 * @param mNG_CD the mNG_CD to set 센터코드
	 */
	public void setMNG_CD(String mNG_CD) {
		MNG_CD = mNG_CD;
	}
	/**
	 * @return the aREA_TITLE_CT 영역 타이틀
	 */
	public String getAREA_TITLE_CT() {
		return AREA_TITLE_CT;
	}
	/**
	 * @param aREA_TITLE_CT the aREA_TITLE_CT to set 영역 타이틀
	 */
	public void setAREA_TITLE_CT(String aREA_TITLE_CT) {
		AREA_TITLE_CT = aREA_TITLE_CT;
	}
	/**
	 * @return the sHOW_CNT_CD노출개수코드
	 */
	public String getSHOW_CNT_CD() {
		return SHOW_CNT_CD;
	}
	/**
	 * @param sHOW_CNT_CD the sHOW_CNT_CD to set 노출개수코드
	 */
	public void setSHOW_CNT_CD(String sHOW_CNT_CD) {
		SHOW_CNT_CD = sHOW_CNT_CD;
	}
	/**
	 * @return the uSE_YN 사용여부
	 */
	public String getUSE_YN() {
		return USE_YN;
	}
	/**
	 * @param uSE_YN the uSE_YN to set 사용여부
	 */
	public void setUSE_YN(String uSE_YN) {
		USE_YN = uSE_YN;
	}
	/**
	 * @return the vS_MARK_USE_YN VS표기사용여부
	 */
	public String getVS_MARK_USE_YN() {
		return VS_MARK_USE_YN;
	}
	/**
	 * @param vS_MARK_USE_YN the vS_MARK_USE_YN to set VS표기사용여부
	 */
	public void setVS_MARK_USE_YN(String vS_MARK_USE_YN) {
		VS_MARK_USE_YN = vS_MARK_USE_YN;
	}
	
}
