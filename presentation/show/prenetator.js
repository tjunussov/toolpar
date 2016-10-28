

$(function () {
	$("body").append(`
	<style>
		html, body { margin:0; padding:0; height:100%; }
		body { background:#000 no-repeat; background-size: cover; background-attachment: fixed; }
	</style>`);
	
	var images = new Array();
	
	 // Load
	 $.get("../",function(data){
		 var d = $('<div/>').append( data );
		 
		$(d).find('pre a').each(function(index, el) {
			if($(el).text().indexOf('.') > 0)
				images.push($(el).text());
        });
		show(images.next());
	});
	
	// Bind click
    $("body").click(function(){
		console.log('next',show(images.next()));
		
    });
	
	// Bind keys
	$("body").keydown(function(e){
		if(e.keyCode == 37){
			console.log('previous',show(images.prev()));
		} else {
			console.log('next',show(images.next()));
		}
		
    });
	
	function show(i){
		$("body").css('backgroundImage','url("../'+i+'")');
		return i;
	}
	
Array.prototype.next = function() {
	if ( this.current + 1 == this.length ) return this[this.current];
    return this[++this.current];
};
Array.prototype.prev = function() {
	return this[this.current > 0 ? --this.current : this.current];
};
Array.prototype.current = 0;
	
});