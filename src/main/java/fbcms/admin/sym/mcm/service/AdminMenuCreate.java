package fbcms.admin.sym.mcm.service;
 
/** 
 * 메뉴생성 생성을 위한 모델 클래스를 정의한다.
 */
public class AdminMenuCreate {
	
	/** 메뉴번호 */
	private int menuNo;
	
	/** 맵생성ID */
	private String mapCreatId;
	
	/** 권한코드 */
	private String authorCode;

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
	
	
}