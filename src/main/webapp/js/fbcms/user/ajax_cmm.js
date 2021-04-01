function fnAjax(object){
	$.ajax({
		url: object.url,
		data: JSON.stringify(object.data),
		type: object.type || "POST",
		dataType: object.dataType || "json",
		contentType:"application/json",
		success: object.fnSuccess,
		error: object.fnError
	})
}