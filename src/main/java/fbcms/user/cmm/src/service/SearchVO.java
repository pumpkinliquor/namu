package fbcms.user.cmm.src.service;

import java.util.List;

import egovframework.com.cmm.ComDefaultVO;

/**
 * 리스트 가져오는 객체
 * 
 * @author 엄국현
 * @since 2020.11.19
 */
public class SearchVO extends ComDefaultVO {

	private static final long serialVersionUID = 1L;

	// 진료과
	private List<?> sbmList;

	// 특화센터
	private List<?> centerList;

	// 의료진
	private List<?> doctorList;

	// 건강정보
	private List<?> boardList;

	// 자주하는 질문
	private List<?> faqList;
	
	// 마지막 선택한 탭 유지 추가
	private String lastTabIndex;

	/**
	 * @return the sbmList
	 */
	public List<?> getSbmList() {
		return sbmList;
	}

	/**
	 * @param sbmList the sbmList to set
	 */
	public void setSbmList(List<?> sbmList) {
		this.sbmList = sbmList;
	}

	/**
	 * @return the centerList
	 */
	public List<?> getCenterList() {
		return centerList;
	}

	/**
	 * @param centerList the centerList to set
	 */
	public void setCenterList(List<?> centerList) {
		this.centerList = centerList;
	}

	/**
	 * @return the doctorList
	 */
	public List<?> getDoctorList() {
		return doctorList;
	}

	/**
	 * @param doctorList the doctorList to set
	 */
	public void setDoctorList(List<?> doctorList) {
		this.doctorList = doctorList;
	}

	/**
	 * @return the boardList
	 */
	public List<?> getBoardList() {
		return boardList;
	}

	/**
	 * @param boardList the boardList to set
	 */
	public void setBoardList(List<?> boardList) {
		this.boardList = boardList;
	}

	/**
	 * @return the faqList
	 */
	public List<?> getFaqList() {
		return faqList;
	}

	/**
	 * @param faqList the faqList to set
	 */
	public void setFaqList(List<?> faqList) {
		this.faqList = faqList;
	}

	/**
	 * @return the lastTabIndex
	 */
	public String getLastTabIndex() {
		return lastTabIndex;
	}

	/**
	 * @param lastTabIndex the lastTabIndex to set
	 */
	public void setLastTabIndex(String lastTabIndex) {
		this.lastTabIndex = lastTabIndex;
	}

}
