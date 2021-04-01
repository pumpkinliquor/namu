<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<script type="text/javascript" src="/js/fbcms/user/jquery.js"></script>
<script type="text/javascript" src="/js/fbcms/user/pdfobject.min.js"></script>
<script>
	$(document).ready(function() {
		PDFObject.embed("${fileNm}", "#pdfPreview");
	});
</script>
<div id="pdfPreview"></div>