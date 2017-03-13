function convertStr(str) {
	return str.replace(/[Ａ-Ｚａ-ｚ０-９]/g, function(s) {
		return String.fromCharCode(s.charCodeAt(0)-0xFEE0);
	});
}
$(function() {
	$('.zen').on('blur', function() {
		var str = $(this).val();
		$(this).val(convertStr(str));
	});
});
