package fbcms.user.hpm.hpm;


// 진료과 관리하는 VO

public class specialityVO {
	
	
	// 관리 코드
	String MNG_CD;
	
	// 진료과명
	String MNG;
	
	// 간단 소개
	String SIMPLE_INTRO_TX;
	
	// 소개
	String INTRO_TX;

	// 주요 질환
	String MAJOR_DISS_CDS;
	
	// 의료진 아이디(복수)
	String DR_IDS;

	/**
	 * @return the mNG_CD
	 */
	public String getMNG_CD() {
		return MNG_CD;
	}

	/**
	 * @param mNG_CD the mNG_CD to set
	 */
	public void setMNG_CD(String mNG_CD) {
		MNG_CD = mNG_CD;
	}

	/**
	 * @return the mNG
	 */
	public String getMNG() {
		return MNG;
	}

	/**
	 * @param mNG the mNG to set
	 */
	public void setMNG(String mNG) {
		MNG = mNG;
	}

	/**
	 * @return the sIMPLE_INTRO_TX
	 */
	public String getSIMPLE_INTRO_TX() {
		return SIMPLE_INTRO_TX;
	}

	/**
	 * @param sIMPLE_INTRO_TX the sIMPLE_INTRO_TX to set
	 */
	public void setSIMPLE_INTRO_TX(String sIMPLE_INTRO_TX) {
		SIMPLE_INTRO_TX = sIMPLE_INTRO_TX;
	}

	/**
	 * @return the iNTRO_TX
	 */
	public String getINTRO_TX() {
		return INTRO_TX;
	}

	/**
	 * @param iNTRO_TX the iNTRO_TX to set
	 */
	public void setINTRO_TX(String iNTRO_TX) {
		INTRO_TX = iNTRO_TX;
	}

	/**
	 * @return the mAJOR_DISS_CDS
	 */
	public String getMAJOR_DISS_CDS() {
		return MAJOR_DISS_CDS;
	}

	/**
	 * @param mAJOR_DISS_CDS the mAJOR_DISS_CDS to set
	 */
	public void setMAJOR_DISS_CDS(String mAJOR_DISS_CDS) {
		MAJOR_DISS_CDS = mAJOR_DISS_CDS;
	}

	/**
	 * @return the dR_IDS
	 */
	public String getDR_IDS() {
		return DR_IDS;
	}

	/**
	 * @param dR_IDS the dR_IDS to set
	 */
	public void setDR_IDS(String dR_IDS) {
		DR_IDS = dR_IDS;
	}

	
	
	
}
