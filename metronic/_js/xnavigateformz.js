$(function () {
	
	
	// ---- autofocus FOCUS----- 
	
	var K_ESC = 27;
	var autofocus = $('*[autofocus]');
	
	$(document).delegate('body','keydown',function(e){
      if(e.keyCode == K_ESC) autofocus.focus();
    });
	
	// ---- FIELDSET FOCUS----- 
    //
    $(document).delegate('fieldset','focusin',function(e){
       $(this).addClass('focus');
    });

    $(document).delegate('fieldset','focusout',function(e){
       $(this).removeClass('focus');
    });
	
	 // ---- FORM ARROW FOCUSER----- 

	$(document).delegate('form :input[maxlength],form :input[size],form :input[mask], form textarea','keydown',function(e){
		
      if (!e) e=window.event;
	  var selectName, that = $(this);
	  
	  switch(e.keyCode)
	  {
	  case 37: // Key left.
		if(that[0].selectionStart > 0 && !e.ctrlKey) return; // isPosition Not onStart
		selectName = that.attr('left');
		if (!selectName) selectName = that.attr('up');
		break;
	  case 38: // Key up.
		selectName = that.attr('up');
		break;
	  case 39: // Key right.
		if(that[0].selectionStart  != that.val().length && !e.ctrlKey) return; // isPosition Not OnEnd
		selectName = that.attr('right');
		if (!selectName) selectName = that.attr('down');
		break;
	  case 40: // Key down.
		selectName = that.attr('down');
		
		break;
	  case 13: // Enter
		selectName = that.attr('right');
		if (!selectName) selectName = that.attr('down');
		//if( !e.ctrlKey ) e.stopPropagation();
		console.log('Enter',selectName, e.ctrlKey );
		if( e.ctrlKey ) { 
			console.log('Return',e.ctrlKey );
			return; 
	    } 
		break;
	  default: 
 	  // autotab feature 
	  	selectName = that.xautotab(e);
		break;
	  }
	  console.log('keydown',selectName);
	  
	  
	  
	  if (!selectName) return;
	  var controls = document.getElementsByName(selectName);
	  if (!controls) return;
	  controls[0].focus();
	  return false; 
	  
    });
	
});


jQuery.fn.xautotab = function xautotab(e){
	if(/[a-zA-Z0-9-_ ]/.test(String.fromCharCode(e.keyCode)))
	var len = this.attr('maxlength')||this.attr('size')||this.attr('mask').length;
	if( len == this.val().length){
		console.debug('Autotab','next',len,this.val().length);
		return this.attr('right');
	}
}


jQuery.fn.getSelectionStart = function(){
	if(this.lengh == 0) return -1;
	input = this[0];

	var pos = input.value.length;

	if (input.createTextRange) {
		var r = document.selection.createRange().duplicate();
		r.moveEnd('character', input.value.length);
		if (r.text == '') 
		pos = input.value.length;
		pos = input.value.lastIndexOf(r.text);
	} else if(typeof(input.selectionStart)!="undefined")
	pos = input.selectionStart;

	return pos;
}
