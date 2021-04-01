package fbcms.user.cts.rsv.service;

import egovframework.com.cmm.ComDefaultVO;

/**
 * MS-SQL TE04 진료예약 TABLE 
 * @author 엄국현
 */
public class ScheduleVO extends ComDefaultVO {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*부서코드*/
	private String DPT_CD;
	/*의사ID*/
	private String DR_ID;
	/*예약일*/
	private String RSV_DT;
	/*예약 시간(Hour)*/
	private String RSV_HR;
	/*예약 분(Min)*/
	private String RSV_MN;
	/* 요일 */
	private String YOIL;
	/*예약자 수*/
	private int RSV_CNT;
	/*예약가능 수*/
	private int RSV_AVL;
	/*오전구분*/
	private String AM_FG;
	/*오후구분*/
	private String PM_FG;
	/*오전예약가능인원*/
	private int R1_AVL;
	/*오후예약가능인원*/
	private int R2_AVL;

	/**
	 * @return dPT_CD 부서코드
	 */
	public String getDPT_CD() {
		return DPT_CD;
	}
	/**
	 * @param dPT_CD 부서코드
	 */
	public void setDPT_CD(String dPT_CD) {
		DPT_CD = dPT_CD;
	}
	/**
	 * @return dR_ID 의사ID
	 */
	public String getDR_ID() {
		return DR_ID;
	}
	/**
	 * @param dR_ID 의사ID
	 */
	public void setDR_ID(String dR_ID) {
		DR_ID = dR_ID;
	}
	/**
	 * @return rSV_DT 예약일
	 */
	public String getRSV_DT() {
		return RSV_DT;
	}
	/**
	 * @param rSV_DT 예약일
	 */
	public void setRSV_DT(String rSV_DT) {
		RSV_DT = rSV_DT;
	}
	/**
	 * @return rSV_HR 예약 시간(Hour)
	 */
	public String getRSV_HR() {
		return RSV_HR;
	}
	/**
	 * @param rSV_HR 예약 시간(Hour)
	 */
	public void setRSV_HR(String rSV_HR) {
		RSV_HR = rSV_HR;
	}
	/**
	 * @return rSV_MN 예약 분(Min)
	 */
	public String getRSV_MN() {
		return RSV_MN;
	}
	/**
	 * @param rSV_MN 예약 분(Min)
	 */
	public void setRSV_MN(String rSV_MN) {
		RSV_MN = rSV_MN;
	}
	/**
	 * @return the yOIL
	 */
	public String getYOIL() {
		return YOIL;
	}
	/**
	 * @param yOIL the yOIL to set
	 */
	public void setYOIL(String yOIL) {
		YOIL = yOIL;
	}
	/**
	 * @return rSV_CNT 예약자 수
	 */
	public int getRSV_CNT() {
		return RSV_CNT;
	}
	/**
	 * @param rSV_CNT 예약자 수
	 */
	public void setRSV_CNT(int rSV_CNT) {
		RSV_CNT = rSV_CNT;
	}
	/**
	 * @return rSV_AVL 예약가능 수
	 */
	public int getRSV_AVL() {
		return RSV_AVL;
	}
	/**
	 * @param rSV_AVL 예약가능 수
	 */
	public void setRSV_AVL(int rSV_AVL) {
		RSV_AVL = rSV_AVL;
	}
	/**
	 * @return aM_FG 오전구분
	 */
	public String getAM_FG() {
		return AM_FG;
	}
	/**
	 * @param aM_FG aM_FG 오전구분
	 */
	public void setAM_FG(String aM_FG) {
		AM_FG = aM_FG;
	}
	/**
	 * @return pM_FG 오후구분
	 */
	public String getPM_FG() {
		return PM_FG;
	}
	/**
	 * @param pM_FG 오후구분
	 */
	public void setPM_FG(String pM_FG) {
		PM_FG = pM_FG;
	}
	/**
	 * @return r1_AVL 오전예약가능인원
	 */
	public int getR1_AVL() {
		return R1_AVL;
	}
	/**
	 * @param r1_AVL 오전예약가능인원
	 */
	public void setR1_AVL(int r1_AVL) {
		R1_AVL = r1_AVL;
	}
	/**
	 * @return r2_AVL 오후예약가능인원
	 */
	public int getR2_AVL() {
		return R2_AVL;
	}
	/**
	 * @param r2_AVL 오후예약가능인원
	 */
	public void setR2_AVL(int r2_AVL) {
		R2_AVL = r2_AVL;
	}
	
}
