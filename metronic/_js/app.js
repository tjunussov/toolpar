$(function () {


    // autocompletion
	// TODO abstract
	$("input.global-search").on('keyup focus',function(){
		console.log($(this).val().length);
		if($(this).val().length > 0) $('#global-search-result').show();
		else $('#global-search-result').hide();
	}).on('blur',function(){
		$('#global-search-result').hide();
	});

});


function themes(){
	var t = $('link[theme]:not([disabled])');
		//t.prop('disabled', function(i, v) { return !v; });
		t.prop('disabled',true).next().prop('disabled',false);
		if(!t.next().attr('theme')) $('link[theme]:first').prop('disabled',false);

}

