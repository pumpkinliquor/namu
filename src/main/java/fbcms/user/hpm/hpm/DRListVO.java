package fbcms.user.hpm.hpm;

public class DRListVO {

	/*
	A	알레르기내과
	BE	유방외과
	C	갑상선외과
	FM	가정의학과
	GI	소화기내과
	GO	소화기외과
	GS	외과
	GY	부인과
	NE	신장내과
	XR	영상의학과
	*/

	// 의사 아이디
	String DR_ID;
	
	// 진료과목 코드
	String MEDI_SBJ_CD;
	
	// 의사 이름
	String DR_NM;
	
	// 특진
	String SPCL_CLINIC_CT;
	
	// 분야
	String FIELD_CT;
	
	// 포지션
	String POSITION_CT;
	
	// PC 이미지 번호
	String PC_IMG_ATCH_NO;
	
	// 모바일 이미지 번호
	String MOBILE_IMG_ATCH_NO;
	
	// 파일 확장자
	String FILE_EXTSN;
	
	// 담당 센터코드
	String MNG_CENTER_CD;
	
	// 담당 센터명
	String MNG_CENTER_NM;
	
	// 전문분야
	String SPCL_FIELD_TX;
	
	// 약력
	String HISTORY_TX;
	
	// 약력2
	String HISTORY_TX2;
	
	// 블로그 주소
	String BLOG_ADD_TX;
	
	// 추가노출 설정코드
	String ADD_OPEN_SET_CD;
	
	// 검색 태그
	String SEARCH_TAG_CT;

	// 방송 출연
	String BROAD_APPEAR_TX;
	
	// 블로그 사용 여부
	String BLOG_USE_YN;
	
	// 진로 예약 문구
	String CLINIC_APPO_WORD_CT;
	
	// 정렬 순번
	String ORDER_NO;

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
	 * @return the mEDI_SBJ_CD
	 */
	public String getMEDI_SBJ_CD() {
		return MEDI_SBJ_CD;
	}

	/**
	 * @param mEDI_SBJ_CD the mEDI_SBJ_CD to set
	 */
	public void setMEDI_SBJ_CD(String mEDI_SBJ_CD) {
		MEDI_SBJ_CD = mEDI_SBJ_CD;
	}

	/**
	 * @return the dR_NM
	 */
	public String getDR_NM() {
		return DR_NM;
	}

	/**
	 * @param dR_NM the dR_NM to set
	 */
	public void setDR_NM(String dR_NM) {
		DR_NM = dR_NM;
	}

	/**
	 * @return the sPCL_CLINIC_CT
	 */
	public String getSPCL_CLINIC_CT() {
		return SPCL_CLINIC_CT;
	}

	/**
	 * @param sPCL_CLINIC_CT the sPCL_CLINIC_CT to set
	 */
	public void setSPCL_CLINIC_CT(String sPCL_CLINIC_CT) {
		SPCL_CLINIC_CT = sPCL_CLINIC_CT;
	}

	/**
	 * @return the fIELD_CT
	 */
	public String getFIELD_CT() {
		return FIELD_CT;
	}

	/**
	 * @param fIELD_CT the fIELD_CT to set
	 */
	public void setFIELD_CT(String fIELD_CT) {
		FIELD_CT = fIELD_CT;
	}

	/**
	 * @return the pOSITION_CT
	 */
	public String getPOSITION_CT() {
		return POSITION_CT;
	}

	/**
	 * @param pOSITION_CT the pOSITION_CT to set
	 */
	public void setPOSITION_CT(String pOSITION_CT) {
		POSITION_CT = pOSITION_CT;
	}

	/**
	 * @return the pC_IMG_ATCH_NO
	 */
	public String getPC_IMG_ATCH_NO() {
		return PC_IMG_ATCH_NO;
	}

	/**
	 * @param pC_IMG_ATCH_NO the pC_IMG_ATCH_NO to set
	 */
	public void setPC_IMG_ATCH_NO(String pC_IMG_ATCH_NO) {
		PC_IMG_ATCH_NO = pC_IMG_ATCH_NO;
	}

	/**
	 * @return the mOBILE_IMG_ATCH_NO
	 */
	public String getMOBILE_IMG_ATCH_NO() {
		return MOBILE_IMG_ATCH_NO;
	}

	/**
	 * @param mOBILE_IMG_ATCH_NO the mOBILE_IMG_ATCH_NO to set
	 */
	public void setMOBILE_IMG_ATCH_NO(String mOBILE_IMG_ATCH_NO) {
		MOBILE_IMG_ATCH_NO = mOBILE_IMG_ATCH_NO;
	}
	
	/**
	 * @return the fILE_EXTSN
	 */
	public String getFILE_EXTSN() {
		return FILE_EXTSN;
	}

	/**
	 * @param fILE_EXTSN the fILE_EXTSN to set
	 */
	public void setFILE_EXTSN(String fILE_EXTSN) {
		FILE_EXTSN = fILE_EXTSN;
	}

	/**
	 * @return the mNG_CENTER_CD
	 */
	public String getMNG_CENTER_CD() {
		return MNG_CENTER_CD;
	}

	/**
	 * @param mNG_CENTER_CD the mNG_CENTER_CD to set
	 */
	public void setMNG_CENTER_CD(String mNG_CENTER_CD) {
		MNG_CENTER_CD = mNG_CENTER_CD;
	}

	/**
	 * @return the mNG_CENTER_NM
	 */
	public String getMNG_CENTER_NM() {
		return MNG_CENTER_NM;
	}

	/**
	 * @param mNG_CENTER_NM the mNG_CENTER_NM to set
	 */
	public void setMNG_CENTER_NM(String mNG_CENTER_NM) {
		MNG_CENTER_NM = mNG_CENTER_NM;
	}

	/**
	 * @return the sPCL_FIELD_TX
	 */
	public String getSPCL_FIELD_TX() {
		return SPCL_FIELD_TX;
	}

	/**
	 * @param sPCL_FIELD_TX the sPCL_FIELD_TX to set
	 */
	public void setSPCL_FIELD_TX(String sPCL_FIELD_TX) {
		SPCL_FIELD_TX = sPCL_FIELD_TX;
	}

	/**
	 * @return the hISTORY_TX
	 */
	public String getHISTORY_TX() {
		return HISTORY_TX;
	}

	/**
	 * @param hISTORY_TX the hISTORY_TX to set
	 */
	public void setHISTORY_TX(String hISTORY_TX) {
		HISTORY_TX = hISTORY_TX;
	}

	/**
	 * @return the hISTORY_TX2
	 */
	public String getHISTORY_TX2() {
		return HISTORY_TX2;
	}

	/**
	 * @param hISTORY_TX2 the hISTORY_TX2 to set
	 */
	public void setHISTORY_TX2(String hISTORY_TX2) {
		HISTORY_TX2 = hISTORY_TX2;
	}

	/**
	 * @return the bLOG_ADD_TX
	 */
	public String getBLOG_ADD_TX() {
		return BLOG_ADD_TX;
	}

	/**
	 * @param bLOG_ADD_TX the bLOG_ADD_TX to set
	 */
	public void setBLOG_ADD_TX(String bLOG_ADD_TX) {
		BLOG_ADD_TX = bLOG_ADD_TX;
	}

	/**
	 * @return the aDD_OPEN_SET_CD
	 */
	public String getADD_OPEN_SET_CD() {
		return ADD_OPEN_SET_CD;
	}

	/**
	 * @param aDD_OPEN_SET_CD the aDD_OPEN_SET_CD to set
	 */
	public void setADD_OPEN_SET_CD(String aDD_OPEN_SET_CD) {
		ADD_OPEN_SET_CD = aDD_OPEN_SET_CD;
	}

	/**
	 * @return the sEARCH_TAG_CT
	 */
	public String getSEARCH_TAG_CT() {
		return SEARCH_TAG_CT;
	}

	/**
	 * @param sEARCH_TAG_CT the sEARCH_TAG_CT to set
	 */
	public void setSEARCH_TAG_CT(String sEARCH_TAG_CT) {
		SEARCH_TAG_CT = sEARCH_TAG_CT;
	}

	/**
	 * @return the bROAD_APPEAR_TX
	 */
	public String getBROAD_APPEAR_TX() {
		return BROAD_APPEAR_TX;
	}

	/**
	 * @param bROAD_APPEAR_TX the bROAD_APPEAR_TX to set
	 */
	public void setBROAD_APPEAR_TX(String bROAD_APPEAR_TX) {
		BROAD_APPEAR_TX = bROAD_APPEAR_TX;
	}

	/**
	 * @return the bLOG_USE_YN
	 */
	public String getBLOG_USE_YN() {
		return BLOG_USE_YN;
	}

	/**
	 * @param bLOG_USE_YN the bLOG_USE_YN to set
	 */
	public void setBLOG_USE_YN(String bLOG_USE_YN) {
		BLOG_USE_YN = bLOG_USE_YN;
	}

	/**
	 * @return the cLINIC_APPO_WORD_CT
	 */
	public String getCLINIC_APPO_WORD_CT() {
		return CLINIC_APPO_WORD_CT;
	}

	/**
	 * @param cLINIC_APPO_WORD_CT the cLINIC_APPO_WORD_CT to set
	 */
	public void setCLINIC_APPO_WORD_CT(String cLINIC_APPO_WORD_CT) {
		CLINIC_APPO_WORD_CT = cLINIC_APPO_WORD_CT;
	}

	/**
	 * @return the oRDER_NO
	 */
	public String getORDER_NO() {
		return ORDER_NO;
	}

	/**
	 * @param oRDER_NO the oRDER_NO to set
	 */
	public void setORDER_NO(String oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}

	
	
	
	
}
	
	