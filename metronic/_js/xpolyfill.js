$(function () {

    //
    // ---- init radio,checkbox default state from localStorage -----
    // TODO: Abstract selector
    $("#toggler").each(function(){
        $('body').toggleClass('notransition');
        return false;
    }).prop('checked',localStorage.toggler=='true').change(function () {
       localStorage.toggler = $(this).prop("checked");
    }).each(function(){
    	window.setTimeout(function(){$('body').removeClass('notransition');},100);
    });



    //
    // ---- onEnter make Tab -----
    // 
    /*$(document).on('keydown', function (e) {
        if (e.keyCode == 13) {
            
            Podium.keydown(9); // for arrow-down, arrow-up is 38
            console.log("enetered");
        }
    });

    Podium = {};
    Podium.keydown = function(k) {
        var oEvent = document.createEvent('KeyboardEvent');

        // Chromium Hack
        Object.defineProperty(oEvent, 'keyCode', {get : function() {return this.keyCodeVal; }});     
        Object.defineProperty(oEvent, 'which', {get : function() {return this.keyCodeVal; }});     

        if (oEvent.initKeyboardEvent) {
            oEvent.initKeyboardEvent("keydown", true, true, document.defaultView, k, k, "", "", false, "");
        } else {
            oEvent.initKeyEvent("keydown", true, true, document.defaultView, false, false, false, false, k, 0);
        }

        oEvent.keyCodeVal = k;

        if (oEvent.keyCode !== k) {
            alert("keyCode mismatch " + oEvent.keyCode + "(" + oEvent.which + ")");
        }

        document.body.dispatchEvent(oEvent);
    }
    */
	/*
Podium = {};
Podium.keydown = function(k) {
    var oEvent = document.createEvent('KeyboardEvent');

    // Chromium Hack
    Object.defineProperty(oEvent, 'keyCode', {
                get : function() {
                    return this.keyCodeVal;
                }
    });     
    Object.defineProperty(oEvent, 'which', {
                get : function() {
                    return this.keyCodeVal;
                }
    });     

    if (oEvent.initKeyboardEvent) {
        oEvent.initKeyboardEvent("keydown", true, true, document.defaultView, false, false, false, false, k, k);
    } else {
        oEvent.initKeyEvent("keydown", true, true, document.defaultView, false, false, false, false, k, 0);
    }

    oEvent.keyCodeVal = k;

    if (oEvent.keyCode !== k) {
        alert("keyCode mismatch " + oEvent.keyCode + "(" + oEvent.which + ")");
    }

    document.dispatchEvent(oEvent);
	
	console.log(k);
}*/



    //
    // ---- RADIO BUTTON UNCLICK - METRONIC MENU----- 
    //
    $('input[type="radio"] + label').mousedown(function(e){
        var radio = $(this).prev();
        if(radio.prop('checked'))  { 
            $(radio).prop('alreadyChecked', true); 
        }
    })

    $('input[type="radio"]').click(function(e){
        if($(this).prop('alreadyChecked'))  { 
            $(this).prop('checked', false);
            $(this).prop('alreadyChecked', false); 
        }
    });

	
	//document.addEventListener("keydown", function(e){ console.log(e); });
	
	
	 // ---- FORM MASKER----- 
	 $("input[mask]").each(function(index, element) {
        $(this).mask($(element).attr('mask'));
    });
	
});


function __triggerKeyboardEvent(el, keyCode)
{
    var eventObj = document.createEventObject ?
        document.createEventObject() : document.createEvent("Events");
  
    if(eventObj.initEvent){
      eventObj.initEvent("keydown", true, true);
    }
  
    eventObj.keyCode = keyCode;
    eventObj.which = keyCode;
    
    el.dispatchEvent ? el.dispatchEvent(eventObj) : el.fireEvent("onkeydown", eventObj); 
		console.log('__triggerKeyboardEvent');	
  
} 

