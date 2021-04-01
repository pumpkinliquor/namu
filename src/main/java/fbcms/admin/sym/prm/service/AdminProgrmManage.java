package fbcms.admin.sym.prm.service;

/**
 * 프로그램목록 관리 생성을 위한 모델 클래스를 정의한다.
 */

public class AdminProgrmManage {
	
	/**
	 * 프로그램설명
	 */
	private String progrmDc;
	
	/**
	 * 프로그램파일명
	 */
	private String progrmFileNm;
	
	/**
	 * 프로그램한글명
	 */
	private String progrmKoreanNm;
	
	/**
	 * 프로그램저장경로
	 */
	private String progrmStrePath;
	
	/**
	 * URL
	 */
	private String url;

	/**
	 * @return the progrmDc
	 */
	public String getProgrmDc() {
		return progrmDc;
	}

	/**
	 * @param progrmDc the progrmDc to set
	 */
	public void setProgrmDc(String progrmDc) {
		this.progrmDc = progrmDc;
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
	 * @return the progrmKoreanNm
	 */
	public String getProgrmKoreanNm() {
		return progrmKoreanNm;
	}

	/**
	 * @param progrmKoreanNm the progrmKoreanNm to set
	 */
	public void setProgrmKoreanNm(String progrmKoreanNm) {
		this.progrmKoreanNm = progrmKoreanNm;
	}

	/**
	 * @return the progrmStrePath
	 */
	public String getProgrmStrePath() {
		return progrmStrePath;
	}

	/**
	 * @param progrmStrePath the progrmStrePath to set
	 */
	public void setProgrmStrePath(String progrmStrePath) {
		this.progrmStrePath = progrmStrePath;
	}

	/**
	 * @return the url
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * @param url the url to set
	 */
	public void setUrl(String url) {
		this.url = url;
	}
	
	
	
}