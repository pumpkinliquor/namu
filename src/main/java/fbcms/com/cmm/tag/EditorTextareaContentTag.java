package fbcms.com.cmm.tag;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang.StringEscapeUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * TagSupport to support to double submit preventer
 */
public class EditorTextareaContentTag extends SimpleTagSupport {
	
	/** LOGGER */
	private static final Logger LOGGER = LoggerFactory.getLogger(EditorTextareaContentTag.class);
	
	/** value */
	protected Object value;
	
	/** xss */
	protected Object xss;
	
	/** tagExclusion */
	protected Object tagExclusion;
	
	/** flag */
	protected Object flag;
	
	
	/**
	 * @return the value
	 */
	public Object getValue() {
		return value;
	}
	
	
	/**
	 * @param value the value to set
	 */
	public void setValue(Object value) {
		this.value = value;
	}
	
	
	/**
	 * @return the xss
	 */
	public Object getXss() {
		return xss;
	}
	
	
	/**
	 * @param xss the xss to set
	 */
	public void setXss(Object xss) {
		this.xss = xss;
	}
	
	
	/**
	 * @return the tagExclusion
	 */
	public Object getTagExclusion() {
		return tagExclusion;
	}
	
	
	/**
	 * @param tagExclusion the tagExclusion to set
	 */
	public void setTagExclusion(Object tagExclusion) {
		this.tagExclusion = tagExclusion;
	}
	
	
	/**
	 * @return the flag
	 */
	public Object getFlag() {
		return flag;
	}
	
	
	/**
	 * @param flag the flag to set
	 */
	public void setFlag(Object flag) {
		this.flag = flag;
	}
	
	/**
	 * doTag
	 */
	public void doTag()	throws JspException, IOException {
		
		if( value != null) {
			String html = (String) value;
			try {
				
				if( flag.equals("1") ) { // editor
					html = StringEscapeUtils.escapeHtml( html );
				} else if( flag.equals("3") ) { // textarea 줄바꿈이 <br>이 아닌 <li>
					html = html.replaceAll("\n", "</li><li>");
				} else { // textarea
					html = html.replaceAll("\n", "<br>");
					html = html.replaceAll(" ", "&nbsp;");
				}
				
				if( xss != null && xss.equals("Y") ) {
					List<String> listRegExp = new ArrayList<String>();
					listRegExp.add("script");
					listRegExp.add("object");
					listRegExp.add("applet");
					listRegExp.add("embed");
					listRegExp.add("form");
					listRegExp.add("iframe");
					listRegExp.add("meta");
					listRegExp.add("textarea");
					
					for(String regExp : listRegExp) {
						html = html.replaceAll("(?i)<(/?" + regExp + "[^>]*)>", "&lt;$1&gt;").replaceAll("alert", "");
					}
				}
				
				if( tagExclusion != null && ((String) tagExclusion).length() > 0 ) {
					String[] arrTagExclusion = ((String) tagExclusion).split(",");
					
					for(String tag : arrTagExclusion) {
						tag = tag.trim();
						html = html.replaceAll( "<" + tag + ".*?</" + tag + ">", "").replaceAll( "<" + tag + ".*?/>",  "");
					}
				}
			} catch ( NullPointerException e) { LOGGER.error(e.getMessage(), e);
			} catch ( Exception e) { LOGGER.error(e.getMessage(), e); }
			
			getJspContext().getOut().write( html );
		}
	}
	
}
