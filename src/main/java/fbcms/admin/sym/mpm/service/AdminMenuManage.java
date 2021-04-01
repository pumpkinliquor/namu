package fbcms.admin.sym.mpm.service;

/**
 * 메뉴관리, 메뉴 생성을 위한 모델 클래스를 정의한다.
 */

public class AdminMenuManage {

	/**
	 * 메뉴설명
	 */
	private String menuDc;
	
	/**
	 * 메뉴명
	 */
	private String menuNm;
	
	/**
	 * 메뉴번호
	 */
	private int menuNo;
	
	/**
	 * 메뉴순서
	 */
	private int menuOrdr;
	
	/**
	 * 프로그램파일명
	 */
	private String progrmFileNm;
	
	/**
	 * 관련이미지명
	 */
	private String relateImageNm;
	
	/**
	 * 관련이미지경로
	 */
	private String relateImagePath;
	
	/**
	 * 상위메뉴번호
	 */
	private int upperMenuNo;

	/**
	 * @return the menuDc
	 */
	public String getMenuDc() {
		return menuDc;
	}

	/**
	 * @param menuDc the menuDc to set
	 */
	public void setMenuDc(String menuDc) {
		this.menuDc = menuDc;
	}

	/**
	 * @return the menuNm
	 */
	public String getMenuNm() {
		return menuNm;
	}

	/**
	 * @param menuNm the menuNm to set
	 */
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

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
	 * @return the menuOrdr
	 */
	public int getMenuOrdr() {
		return menuOrdr;
	}

	/**
	 * @param menuOrdr the menuOrdr to set
	 */
	public void setMenuOrdr(int menuOrdr) {
		this.menuOrdr = menuOrdr;
	}

	/**
	 * @return the progrmFileNm
	 */
	public String getProgrmFileNm() {
		return progrmFileNm;
	}

	/**
	 * @param progrmFileNm the progrmFileNm to set
	 */
	public void setProgrmFileNm(String progrmFileNm) {
		this.progrmFileNm = progrmFileNm;
	}

	/**
	 * @return the relateImageNm
	 */
	public String getRelateImageNm() {
		return relateImageNm;
	}

	/**
	 * @param relateImageNm the relateImageNm to set
	 */
	public void setRelateImageNm(String relateImageNm) {
		this.relateImageNm = relateImageNm;
	}

	/**
	 * @return the relateImagePath
	 */
	public String getRelateImagePath() {
		return relateImagePath;
	}

	/**
	 * @param relateImagePath the relateImagePath to set
	 */
	public void setRelateImagePath(String relateImagePath) {
		this.relateImagePath = relateImagePath;
	}

	/**
	 * @return the upperMenuNo
	 */
	public int getUpperMenuNo() {
		return upperMenuNo;
	}

	/**
	 * @param upperMenuNo the upperMenuNo to set
	 */
	public void setUpperMenuNo(int upperMenuNo) {
		this.upperMenuNo = upperMenuNo;
	}



}