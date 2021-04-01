package fbcms.user.lgn;

/**
 * @Class Name : idFindVO
 * @Description ID 검색 VO class
 * @author 박원준
 * @since 2020.10.29
 */

public class idFindVO {
	
	/*회원ID*/
	private String MBER_ID;			
	/*회원가입일시*/
	private String FRIST_JOIN_DT;
	
	/**
	 * @return the mBER_ID
	 */
	public String getMBER_ID() {
		return MBER_ID;
	}
	/**
	 * @param mBER_ID the mBER_ID to set
	 */
	public void setMBER_ID(String mBER_ID) {
		MBER_ID = mBER_ID;
	}
	
	/**
	 * @return the fRIST_JOIN_DT
	 */
	public String getFRIST_JOIN_DT() {
		return FRIST_JOIN_DT;
	}
	/**
	 * @param fRIST_JOIN_DT the fRIST_JOIN_DT to set
	 */
	public void setFRIST_JOIN_DT(String fRIST_JOIN_DT) {
		FRIST_JOIN_DT = fRIST_JOIN_DT;
	}
	
	
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "idFindVO [MBER_ID=" + MBER_ID + ", FRIST_JOIN_DT=" + FRIST_JOIN_DT + "]";
	}
	
	

}
