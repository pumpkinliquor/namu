package fbcms.com.cmm;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;
/**
 * ImagePaginationRenderer.java 클래스
 */
public class ImagePaginationRenderer extends AbstractPaginationRenderer implements ServletContextAware {

	private ServletContext servletContext;

	public ImagePaginationRenderer() {
	}

	public void initVariables() {
		
        firstPageLabel	= "<a href=\"?pageIndex={1}\" class='pa_f' onclick=\"{0}({1});return false; \"></a>";
		previousPageLabel = "<a href=\"?pageIndex={1}\" class='prev' onclick=\"{0}({1});return false; \"></a>";
		currentPageLabel  = "<a href='#' class='on'>{0}</a>";
		otherPageLabel	= "<a href=\"?pageIndex={1}\" onclick=\"{0}({1});return false; \">{2}</a>";
		nextPageLabel	 = "<a href=\"?pageIndex={1}\" class='next' onclick=\"{0}({1});return false; \"></a>";
		lastPageLabel	 = "<a href=\"?pageIndex={1}\" class='pa_e' onclick=\"{0}({1});return false; \"></a>";
	}
	
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
		initVariables();
	}
}
