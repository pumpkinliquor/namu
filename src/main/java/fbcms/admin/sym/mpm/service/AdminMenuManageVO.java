package fbcms.admin.sym.mpm.service;

/** 
 * 메뉴목록관리 처리를 위한 VO 클래스르를 정의한다
 */

public class AdminMenuManageVO {

	/** 메뉴번호 */
	private int menuNo;
	
	/** 메뉴순서 */
	private int menuOrdr;
	
	/** 메뉴명 */
	private String menuNm;
	
	/** 상위메뉴번호 */
	private int upperMenuNo;
	
	/** 메뉴설명 */
	private String menuDc;
	
	/** 관련이미지경로 */
	private String relateImagePath;
	
	/** 관련이미지명 */
	private String relateImageNm;
	
	/** 프로그램파일명 */
	private String progrmFileNm;
	
	/** 생성자ID **/
	private String creatPersonId;
	
	/** 권한코드 */
	private String authorCode;
	
	/** 기타VO변수 */
	private String tempValue;
	private int tempInt;
	
	/** Login 메뉴관련 VO변수 */
	/** tmp_Id */
	private String tmpId;
	
	/** tmp_Password */
	private String tmpPassword;
	
	/** tmp_Name */
	private String tmpName;
	
	/** tmp_UserSe */
	private String tmpUserSe;
	
	/** tmp_Email */
	private String tmpEmail;
	
	/** tmp_OrgnztId */
	private String tmpOrgnztId;
	
	/** tmp_UniqId */
	private String tmpUniqId;
	
	/** tmp_Cmd */
	private String tmpCmd;

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
	 * @return the tempValue
	 */
	public String getTempValue() {
		return tempValue;
	}

	/**
	 * @param tempValue the tempValue to set
	 */
	public void setTempValue(String tempValue) {
		this.tempValue = tempValue;
	}

	/**
	 * @return the tempInt
	 */
	public int getTempInt() {
		return tempInt;
	}

	/**
	 * @param tempInt the tempInt to set
	 */
	public void setTempInt(int tempInt) {
		this.tempInt = tempInt;
	}

	/**
	 * @return the tmpId
	 */
	public String getTmpId() {
		return tmpId;
	}

	/**
	 * @param tmpId the tmpId to set
	 */
	public void setTmpId(String tmpId) {
		this.tmpId = tmpId;
	}

	/**
	 * @return the tmpPassword
	 */
	public String getTmpPassword() {
		return tmpPassword;
	}

	/**
	 * @param tmpPassword the tmpPassword to set
	 */
	public void setTmpPassword(String tmpPassword) {
		this.tmpPassword = tmpPassword;
	}

	/**
	 * @return the tmpName
	 */
	public String getTmpName() {
		return tmpName;
	}

	/**
	 * @param tmpName the tmpName to set
	 */
	public void setTmpName(String tmpName) {
		this.tmpName = tmpName;
	}

	/**
	 * @return the tmpUserSe
	 */
	public String getTmpUserSe() {
		return tmpUserSe;
	}

	/**
	 * @param tmpUserSe the tmpUserSe to set
	 */
	public void setTmpUserSe(String tmpUserSe) {
		this.tmpUserSe = tmpUserSe;
	}

	/**
	 * @return the tmpEmail
	 */
	public String getTmpEmail() {
		return tmpEmail;
	}

	/**
	 * @param tmpEmail the tmpEmail to set
	 */
	public void setTmpEmail(String tmpEmail) {
		this.tmpEmail = tmpEmail;
	}

	/**
	 * @return the tmpOrgnztId
	 */
	public String getTmpOrgnztId() {
		return tmpOrgnztId;
	}

	/**
	 * @param tmpOrgnztId the tmpOrgnztId to set
	 */
	public void setTmpOrgnztId(String tmpOrgnztId) {
		this.tmpOrgnztId = tmpOrgnztId;
	}

	/**
	 * @return the tmpUniqId
	 */
	public String getTmpUniqId() {
		return tmpUniqId;
	}

	/**
	 * @param tmpUniqId the tmpUniqId to set
	 */
	public void setTmpUniqId(String tmpUniqId) {
		this.tmpUniqId = tmpUniqId;
	}

	/**
	 * @return the tmpCmd
	 */
	public String getTmpCmd() {
		return tmpCmd;
	}

	/**
	 * @param tmpCmd the tmpCmd to set
	 */
	public void setTmpCmd(String tmpCmd) {
		this.tmpCmd = tmpCmd;
	}
	
}