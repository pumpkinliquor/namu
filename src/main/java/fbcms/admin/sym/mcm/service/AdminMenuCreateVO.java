package fbcms.admin.sym.mcm.service;
 
/** 
 * 메뉴생성 처리를 위한 VO 클래스르를 정의한다
 */
public class AdminMenuCreateVO {
	
	/** 메뉴번호 */
	private int menuNo;
	
	/** 맵생성ID */
	private String mapCreatId;
	/** 권한코드 */
	private String authorCode;
	
	/** 권한명 */
	private String authorNm;
	
	/** 권한설명 */
	private String authorDc;
	
	/** 권한생성일자 */
	private String authorCreatDe;
	
	/** 생성자ID **/
	private String creatPersonId;

	/**
	 * @return the menuNo
	 */
	public int getMenuNo() {
		return menuNo;
	}

	/**
	 * @param menuNo the menuNo to set
	 */
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}

	/**
	 * @return the mapCreatId
	 */
	public String getMapCreatId() {
		return mapCreatId;
	}

	/**
	 * @param mapCreatId the mapCreatId to set
	 */
	public void setMapCreatId(String mapCreatId) {
		this.mapCreatId = mapCreatId;
	}

	/**
	 * @return the authorCode
	 */
	public String getAuthorCode() {
		return authorCode;
	}

	/**
	 * @param authorCode the authorCode to set
	 */
	public void setAuthorCode(String authorCode) {
		this.authorCode = authorCode;
	}

	/**
	 * @return the authorNm
	 */
	public String getAuthorNm() {
		return authorNm;
	}

	/**
	 * @param authorNm the authorNm to set
	 */
	public void setAuthorNm(String authorNm) {
		this.authorNm = authorNm;
	}

	/**
	 * @return the authorDc
	 */
	public String getAuthorDc() {
		return authorDc;
	}

	/**
	 * @param authorDc the authorDc to set
	 */
	public void setAuthorDc(String authorDc) {
		this.authorDc = authorDc;
	}

	/**
	 * @return the authorCreatDe
	 */
	public String getAuthorCreatDe() {
		return authorCreatDe;
	}

	/**
	 * @param authorCreatDe the authorCreatDe to set
	 */
	public void setAuthorCreatDe(String authorCreatDe) {
		this.authorCreatDe = authorCreatDe;
	}

	/**
	 * @return the creatPersonId
	 */
	public String getCreatPersonId() {
		return creatPersonId;
	}

	/**
	 * @param creatPersonId the creatPersonId to set
	 */
	public void setCreatPersonId(String creatPersonId) {
		this.creatPersonId = creatPersonId;
	}
	
	   
}