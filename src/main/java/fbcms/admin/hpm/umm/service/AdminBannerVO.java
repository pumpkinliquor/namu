/**
 * 배너에 대한 Vo 클래스를 정의한다.
 */
package fbcms.admin.hpm.umm.service;

import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class AdminBannerVO extends AdminBanner {
	
	/** serialVersionUID */
	private static final long serialVersionUID = 1L;
	
	/** 배너 목록  */
	List<AdminBannerVO> bannerList;
	
	/** 삭제대상 목록 */
	String[] delYn;
	
	/** 결과 반영 타입
	 * vertical : 세로
	 * horizontal : 가로
	 */
	String resultType = "horizontal";
	
	
	/**
	 * @return the bannerList
	 */
	public List<AdminBannerVO> getBannerList() {
		return bannerList;
	}


	/**
	 * @param bannerList the bannerList to set
	 */
	public void setBannerList(List<AdminBannerVO> bannerList) {
		this.bannerList = bannerList;
	}


	/**
	 * @return the delYn
	 */
	public String[] getDelYn() {
		return delYn;
	}


	/**
	 * @param delYn the delYn to set
	 */
	public void setDelYn(String[] delYn) {
		this.delYn = delYn;
	}


	/**
	 * @return the resultType
	 */
	public String getResultType() {
		return resultType;
	}


	/**
	 * @param resultType the resultType to set
	 */
	public void setResultType(String resultType) {
		this.resultType = resultType;
	}


	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	/**
	 * toString 메소드를 대치한다.
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}
}
