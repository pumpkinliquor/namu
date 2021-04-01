package fbcms.user.hpm.hpm;

/**
 * 의료진 즐겨찾기 VO
 * */

public class favoritesDRVO {

	// 유저 아이디	
	String USER_ID;
	
	// 의료진 아이디
	String DR_ID;
	
	// 관심 여부
	String LIKE_YN;

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
	 * @return the dR_ID
	 */
	public String getDR_ID() {
		return DR_ID;
	}

	/**
	 * @param dR_ID the dR_ID to set
	 */
	public void setDR_ID(String dR_ID) {
		DR_ID = dR_ID;
	}

	/**
	 * @return the lIKE_YN
	 */
	public String getLIKE_YN() {
		return LIKE_YN;
	}

	/**
	 * @param lIKE_YN the lIKE_YN to set
	 */
	public void setLIKE_YN(String lIKE_YN) {
		LIKE_YN = lIKE_YN;
	}
	
		
	
}
