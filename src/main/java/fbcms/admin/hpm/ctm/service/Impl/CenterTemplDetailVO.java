package fbcms.admin.hpm.ctm.service.Impl;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

/**
 * 센터 관리 템플릿 세부
 * @author 김명진
 * @since 2020.10.20
 */
public class CenterTemplDetailVO {
	/*센터 02 클리닉 03*/
	private String MNG_GUBN_CD;
	/*센터코드*/
	private String MNG_CD;
	/*관리 순번*/
	private String MNG_SEQ;
	/*순번*/
	private String SEQ;
	/*상세 순번*/
	private String DTIL_SEQ;
	/*타이틀*/
	private String TITLE_CT;
	/*텍스트*/
	private String TEXT_TX;
	/*이미지 파일 번호*/
	private String IMG_ATCH_NO;
	/*이미지 파일*/
	private MultipartFile IMG_FILE;
	/*이미지 파일이름*/
	private String IMG_FILE_NM;
	/*동영상 파일 번호*/
	private String VIDEO_ATCH_NO;
	/*동영상 파일*/
	private MultipartFile VIDEO_FILE;
	/*동영상 파일 이름*/
	private String VIDEO_FILE_NM;
	
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
	 * @return the iMG_FILE
	 */
	public MultipartFile getIMG_FILE() {
		return IMG_FILE;
	}
	/**
	 * @param iMG_FILE the iMG_FILE to set
	 */
	public void setIMG_FILE(MultipartFile iMG_FILE) {
		IMG_FILE = iMG_FILE;
	}
	
	/**
	 * @return the iMG_FILE_NM
	 */
	public String getIMG_FILE_NM() {
		return IMG_FILE_NM;
	}
	/**
	 * @param iMG_FILE_NM the iMG_FILE_NM to set
	 */
	public void setIMG_FILE_NM(String iMG_FILE_NM) {
		IMG_FILE_NM = iMG_FILE_NM;
	}
	/**
	 * @return the vIDEO_FILE_NM
	 */
	public String getVIDEO_FILE_NM() {
		return VIDEO_FILE_NM;
	}
	/**
	 * @param vIDEO_FILE_NM the vIDEO_FILE_NM to set
	 */
	public void setVIDEO_FILE_NM(String vIDEO_FILE_NM) {
		VIDEO_FILE_NM = vIDEO_FILE_NM;
	}
	/**
	 * @return the vIDEO_FILE
	 */
	public MultipartFile getVIDEO_FILE() {
		return VIDEO_FILE;
	}
	/**
	 * @param vIDEO_FILE the vIDEO_FILE to set
	 */
	public void setVIDEO_FILE(MultipartFile vIDEO_FILE) {
		VIDEO_FILE = vIDEO_FILE;
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
	 * @return the dTIL_SEQ 상세 순번
	 */
	public String getDTIL_SEQ() {
		return DTIL_SEQ;
	}
	/**
	 * @param dTIL_SEQ the dTIL_SEQ to set 상세 순번
	 */
	public void setDTIL_SEQ(String dTIL_SEQ) {
		DTIL_SEQ = dTIL_SEQ;
	}
	/**
	 * @return the tITLE_CT 타이틀
	 */
	public String getTITLE_CT() {
		return TITLE_CT;
	}
	/**
	 * @param tITLE_CT the tITLE_CT to set 타이틀
	 */
	public void setTITLE_CT(String tITLE_CT) {
		TITLE_CT = tITLE_CT;
	}
	/**
	 * @return the tEXT_TX 텍스트
	 */
	public String getTEXT_TX() {
		return TEXT_TX;
	}
	/**
	 * @param tEXT_TX the tEXT_TX to set 텍스트
	 */
	public void setTEXT_TX(String tEXT_TX) {
		TEXT_TX = tEXT_TX;
	}
	/**
	 * @return the iMG_ATCH_NO 이미지 파일 번호
	 */
	public String getIMG_ATCH_NO() {
		return IMG_ATCH_NO;
	}
	/**
	 * @param iMG_ATCH_NO the iMG_ATCH_NO to set 이미지 파일 번호
	 */
	public void setIMG_ATCH_NO(String iMG_ATCH_NO) {
		IMG_ATCH_NO = iMG_ATCH_NO;
	}
	/**
	 * @return the vIDEO_ATCH_NO 동영상 파일 번호
	 */
	public String getVIDEO_ATCH_NO() {
		return VIDEO_ATCH_NO;
	}
	/**
	 * @param vIDEO_ATCH_NO the vIDEO_ATCH_NO to set 동영상 파일 번호
	 */ 
	public void setVIDEO_ATCH_NO(String vIDEO_ATCH_NO) {
		VIDEO_ATCH_NO = vIDEO_ATCH_NO;
	}
}
