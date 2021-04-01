package fbcms.user.drop;

import java.io.Serializable;

import egovframework.com.cmm.ComDefaultVO;
/**
 * @Class Name : DropMemberVO
 * @Description 탈퇴회원 memberVO class
 * @author 박원준
 * @since 2020.10.26
 */
@SuppressWarnings("serial")
public class DropMemberVO extends ComDefaultVO implements Serializable {
	
	/*회원ID*/
	private String USER_ID;
	/*탈퇴사유*/
	private String DROP_RESN_CD;			
	/*탈퇴일*/
	private String DROP_DT;
	
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
	 * @return the dROP_RESN_CD
	 */
	public String getDROP_RESN_CD() {
		return DROP_RESN_CD;
	}
	/**
	 * @param dROP_RESN_CD the dROP_RESN_CD to set
	 */
	public void setDROP_RESN_CD(String dROP_RESN_CD) {
		DROP_RESN_CD = dROP_RESN_CD;
	}
	/**
	 * @return the dROP_DT
	 */
	public String getDROP_DT() {
		return DROP_DT;
	}
	/**
	 * @param dROP_DT the dROP_DT to set
	 */
	public void setDROP_DT(String dROP_DT) {
		DROP_DT = dROP_DT;
	}
	
	

}
