package fbcms.admin.hpm.umm.service;

import org.apache.commons.lang3.builder.ToStringBuilder;

/**
 * 팝업창에 대한 Vo 클래스를 정의한다.
 */
public class AdminPopupVO extends AdminPopup {
	
	private static final long serialVersionUID = -4822974866080666897L;
	
	
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