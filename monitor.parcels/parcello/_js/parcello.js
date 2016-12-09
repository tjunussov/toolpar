var x2jsMeta = new X2JS();
var xslAllBranches = new XSLTProcessor();
var xslBranchState = new XSLTProcessor();
var xml,meta,settings, details, stats;
var UPDATE_INTERVAL_STATS = 20*1000;
var UPDATE_INTERVAL_DETAILS = 60*1000;
var _DEBUG = (localStorage.getItem('debug') === 'true')||false;
var _STOP = (localStorage.getItem('stop') === 'true')||false;
var _URLS = new Array();


// Initialize
$(function() {
	
	$('#container_branch').html('<load></load>');
	
	// Load xslAllBranches
	$.get($('link[name="all_tpl"]').attr('href'),function(data){ 
		xslAllBranches.importStylesheet(data); 
		console.log("loadXSL all branches");
		delete data;
	},"xml");
	// Load xslBranchesStates
	$.get($('link[name="branch_tpl"]').attr('href'),function(data){ 
		xslBranchState.importStylesheet(data);
		console.log("loadXSL branch states");

		loadMeta(function(){
			loadBranchDetails(localStorage.getItem('branch')||7,localStorage.getItem('prefix')||'010000');
		});
		
		delete data;
	},"xml");

	

	ion.sound({
	    sounds: [
			{name: "bad_appered"},
			{name: "button_hover",volume: 0.02},
			{name: "button_out",volume: 0.02},
			{name: "button_hover_smooth"},
			{name: "data_appear"},
			{name: "loading_yashur"},
			{name: "data_loading1"},
			{name: "data_typewriter",volume: 0.04},
			{name: "typewriter1",volume: 0.04},
			{name: "typewriter2",volume: 0.04},
			{name: "typewriter3",volume: 0.04},
			{name: "reload1",volume: 0.5}
	    ],
	    volume: 0.1,
	    path: "parcello/_sounds/",
	    preload: true
	});
		
	
	$("#colvir_services").click(function(e){ event.stopPropagation(); });
	$(".oblivion").click(function(e){
		if($("#toolpar_services").hasClass('open')){
			console.log('hide');
			$("#toolpar_services").removeClass("open");	
		} else {
			if($("#container_branch_details").css('display') == 'block'){
				$("#B"+branch).removeClass("selected");
				$("#container_branch_details").hide();
				$('#toolpar_services').removeClass("open");
				play(snds.onBranchClose);
				branch = null;
				
				localStorage.setItem('branch',null);
				event.stopPropagation();
			}
		}
	});	
	
	// $("#container_branch_details").click(function(){event.stopPropagation();});
	$("#container_branch").on("mouseenter",".branch",function(){ play(snds.onBranchOver); });
	$("#container_branch").on("mouseleave",".branch",function(){ play(snds.onBranchOut); });
	// $("#container_branch").on("click",".branch",function(){ play(snds.onBranchOpen); loadBranchDetails(this.getAttribute("branch"),this.getAttribute("prefix"));});	

	
	
});

var max_time = new Array({wait:15,serve:10},{wait:20,serve:15},{wait:25,serve:20});
var max_time_i = Number(localStorage.getItem('max_time'))||0;
setParams();

function toggleMaxtime(){	
	max_time_i = (++max_time_i >= max_time.length ) ? 0 : max_time_i;
	console.log("toggleMaxtime",max_time[max_time_i],max_time_i);
	localStorage.setItem('max_time',max_time_i);
	setParams();
	loadStats(true);
}

function setParams(){
	xslAllBranches.setParameter(null, "S_LIMIT_MAXTIME_WAITING", max_time[max_time_i].wait);
	xslAllBranches.setParameter(null, "S_LIMIT_MAXTIME_SERVING", max_time[max_time_i].serve);
	xslAllBranches.setParameter(null, "S_MAXTIME_TOGGLE", max_time_i);
	xslBranchState.setParameter(null, "S_LIMIT_MAXTIME_WAITING", max_time[max_time_i].wait);
	xslBranchState.setParameter(null, "S_LIMIT_MAXTIME_SERVING", max_time[max_time_i].serve);
	xslBranchState.setParameter(null, "S_MAXTIME_TOGGLE", max_time_i);
	
}

var _block_sizing = localStorage.getItem('_block_sizing')||"";
xslAllBranches.setParameter(null, "block_sizing", _block_sizing);




/****************************/


var $xslparam = (function () {

	var xsl = new Array();
	var config = new Array();


	// ------------- DATA LOAD -----------
	$(function() {

		

	});
	
    function init(els) {
         console.log('xsl inited');
    }

    function toggleSizing(){
		console.log("toggleSizing",_block_sizing);
		_block_sizing = (_block_sizing == "") ? "small" : "big";
		localStorage.setItem('_block_sizing',_block_sizing);
		xslAllBranches.setParameter(null, "block_sizing", _block_sizing);
		loadStats(true);
	}

    return {
    	config:function(params){
    		config = params;
    	},
    	setup:function(_xsl,type){
    		xsl[type] = _xsl;
    	},
    	get : function(type){
    		$.each(config[type],function(k,v){
    			console.log("keyvalue",k,l);
    			xsl[type].setParameter(null,v,v);
    		})
    		
    	}
    }
 })();


 /*****************************/

$xslparam.config([
	{'total_sizing':'default'},
	{'block_sizing':'small'},
]);

function toggleSizing(){
	console.log("toggleSizing",_block_sizing);
	_block_sizing = (_block_sizing == "") ? "small" : "big";
	localStorage.setItem('_block_sizing',_block_sizing);
	xslAllBranches.setParameter(null, "block_sizing", _block_sizing);
	loadStats(true);
}

// Load stats 10 seconds
// http://test.aspan.io/api/allbranches_data.json?org_id=9
function loadStats(force){
	$.ajax({url:_URLS["Stats"],dataType:"json",isProgressBar:true,timeout:30000,success:function(json){
		play(snds.onStatsLoad);
	
		var x2js2Stats = new X2JS();
		// var xmlStats = x2js2Stats.parseXmlString(x2js2Stats.json2xml_str(json,'stats'));
		var xmlStats = x2js2Stats.json2xml_merge(json,meta_cache);
		if(_DEBUG) console.log("loadStats",xmlStats);
		
		
		$("#container_branch").empty().html(xslAllBranches.transformToFragment(xmlStats,document));
		$("#B"+branch).addClass("selected");
		
		isBranchClicked = false;
		
		xmlStats = null;
	    x2js2Stats = null;
	    json = null;

	    $hero.scan();
		
	    //delete stats;
	    delete xmlStats;
	    delete x2js2Stats;
	    delete json;
	   }
	});
}





//
var branch;
var prefix;

var isBranchClicked = false;
function loadBranchDetails(branch,prefix){
	$("#B"+this.branch).removeClass("selected");
	$("#B"+branch).addClass("selected");
	this.branch = branch;
	this.prefix = prefix;
	isBranchClicked = true;
	localStorage.setItem('branch',branch);
	localStorage.setItem('prefix',prefix);
	$("#container_branch_details").show();
	interval(loadBranchDetailsData,loadStats,UPDATE_INTERVAL_STATS);
	event.stopPropagation();
}

var _layout = localStorage.getItem('_layout')||"separate";
xslBranchState.setParameter(null, "layout", _layout);
xslAllBranches.setParameter(null, "layout", _layout);

function toggleLayout(obj){
	console.log("toggleLayout",_layout);
	$(obj).toggleClass('on');
	_layout = (_layout == "") ? "separate" : "";
	localStorage.setItem('_layout',_layout);
	xslBranchState.setParameter(null, "layout", _layout);
	xslAllBranches.setParameter(null, "layout", _layout);
	loadBranchDetailsData();
	event.stopPropagation();
	return false;
}


var _collapse = localStorage.getItem('_collapse')||"";
xslBranchState.setParameter(null, "collapse", _collapse);
xslAllBranches.setParameter(null, "collapse", _layout);

function toggleCollapse(obj){
	console.log("toggleCollapse",_collapse);
	$(obj).toggleClass('on');
	_collapse = (_collapse == "") ? "expanded" : "";
	localStorage.setItem('_collapse',_layout);
	xslBranchState.setParameter(null, "collapse", _collapse);
	xslAllBranches.setParameter(null, "collapse", _collapse);
	loadBranchDetailsData();
	event.stopPropagation();
	return false;
}
/*
var dif = new diffDOM({
		nodeTextDiff: function (node, currentValue, expectedValue, newValue) { 
    		//console.log('chuk',node.parentNode,currentValue,newValue);
    		if(node.parentNode.className.indexOf("diff") > -1){
	    		$(node.parentNode).addClass("new");
	    		setTimeout(function(pn) {
			        $(pn).removeClass('new');
			    },3000,node.parentNode);
		    }
    		node.data = newValue;
    	}  
    });*/
    
var difBranch = "";

// http://test.aspan.io/api/branch_state.json?org_id=1&branch_id=7
function loadBranchDetailsData(){
	/*if($("#container_branch_details").css('display') == 'block' && branch && branch != 'null'){
		$.getJSON(_URLS["BranchDetails"],function(json){
			//play(snds.onBranchLoad);
			try {
				loadBranchDetailsSettings(function(settings){
					loadBranchDetailsDataHelper(json,settings);
				});
				difBranch = branch;
			} catch(error){
				errorDialog(error);
			}
			
		});
	}*/
}

function loadBranchDetailsDataHelper(json,settings){

	var x2js2Branch = new X2JS();
	details = x2js2Branch.json2xml_merge(json,settings);
	
	if(_DEBUG) console.log("loadBranchDetails",details);
	$("#container_branch_details").empty().html(xslBranchState.transformToFragment(details,document));
	//knober();
	
	json = null;
	details = null;
	settings = null;
	x2js2Branch = null;
	
	delete json;
	delete details;
	delete settings;
	delete x2js2Branch;

};

function knober(){
	// KNOB Randomizer
	$(".knob").each(function(i){
		$(this).data('targetValue',($(this).data('targetvalue'))?$(this).data('targetvalue'):Math.floor(Math.random() * 100))
		.knob({'draw' : function () { $(this.i).val(this.cv + '%')}})
	}).animate({value:100},{
			duration:1000,
			easing:'easeOutQuint', //easeOutElastic
			step:knobcalc
		});
}
function knobcalc(){
	$(this).val(Math.round(this.value/100*$(this).data('targetValue'))).trigger('change');
}




var settings_cache = new Array();

function loadBranchDetailsSettings(callback){

	if(settings_cache[prefix]) {
		if(_DEBUG) console.log("not loadSettings due to cache",prefix);
		callback(settings_cache[prefix]);
		return;
	}
	
	// Load Settings
	$.getJSON(_URLS["BranchDetailsSettings"],function(json){
		try {
			var x2js2Setting = new X2JS();
			settings_cache[prefix] = x2js2Setting.json2xml_str(json,'settings');
			
			x2js2Setting = null;
			json = null;
			
			delete x2js2Setting;
			delete json;
			
		} catch(e){
			settings_cache[prefix] = "<settings/>";
			console.error("Error Parsing XML",e);
		}
		
		console.log("loadSettings",prefix);
		callback(settings_cache[prefix]);
	});

}

var meta_cache = null;
function loadMeta(callback){
	
	// Load Settings
	$.getJSON(_URLS["Meta"],function(json){
		try {
			var x2js2Meta = new X2JS();
			meta_cache = x2js2Meta.json2xml_str(json,'settings');

			x2js2Meta = null;
			json = null;
			
			delete x2js2Meta;
			delete json;

			callback();
			
		} catch(e){
			meta_cache = "<settings/>";
			console.error("Error Parsing XML",e);
		}
		
		console.log("loadMeta");

	});

}

var intervals = new Array();
function interval(func1,func2,time){
	func1();
	func2();
	if(intervals[time]) { 
		window.clearInterval(intervals[time]);
		intervals[time] = null;
	}
	intervals[time] = window.setInterval(function(){if(!_STOP){func1();func2();}},time);
}

var snds = {
	onBranchAppear: ["data_typewriter","typewriter1","typewriter2"],
	onStatsLoad: "data_typewriter",
	onBranchLoad: "data_typewriter",
	onBranchOver: "button_hover",
	onBranchOpen: "reload1",
	onBranchClose: "button_out",
	onBranchOut: "button_out",
	onMax: "button_hover_smooth",
	onDataChange: "bad_appered"
	
};
function play(snd){
	if(snd.constructor === Array) {
		//console.log("array",snd.length);
		ion.sound.play(snd[Math.floor(Math.random() * snd.length)]);
	} else {
		ion.sound.play(snd);
	}
}

/*********************************/

$(document).on('keydown', function(event) {
    $(document).off('keydown');
    $(window).on('resize', function() {
        $('body').toggleClass('fullscreen');
        $(document).on('keydown'); // Turn keydown back on after functions
    });
});

function toggleFullscreen() {
	if(document.webkitIsFullScreen){
    	document.webkitExitFullscreen();
    } else {
    	document.documentElement.webkitRequestFullscreen();
    }
}


function errorDialog(error){
	$("#errormsg").show().html( "<div>" + error + "</div>" ).delay(20000).fadeOut();
}

/***********************************/
var _STATUS = false;
function checkIfModified(){ 
  $.ajax({
    url : "/_touch/touch.html", // URL for touching file
    dataType : "text",
    ifModified : true,
    success : function(data, textStatus) {
      if (textStatus != "notmodified" && _STATUS) {
        console.log("File changed, need to refresh "+textStatus);
        window.setTimeout(function(){location.reload();},1000);
      }
      _STATUS = true;
    }
  });
}
//window.setInterval(checkIfModified, 60000);

/***********************************/

function debug(){
	_DEBUG =!_DEBUG;
	localStorage.setItem('debug',_DEBUG);
	return _DEBUG;
}

function stop(){
	_STOP =!_STOP;
	localStorage.setItem('stop',_STOP);
	return _STOP;
}


function showToolparServices(oper){
	
	var top = Number($(event.target).position().top) - 500;
	
	$('#colvir_services').addClass("open").html('<div class="branch_details"><load></load></div>');

	$.ajax({
		url: _URLS["ColvirServices"],
		type: "GET",
		data: {
			"userid": oper,
		},success : function(data, textStatus) {
			$('#colvir_services .branch_details').empty().html(data);
		},
		timeout: 30000,
		error : function(data, textStatus) {
			$('#colvir_services .branch_details').html('Ошибка загрузки... ' + textStatus + data);	
		}
	});
	
	event.stopPropagation();
	return false;
	
}


/*************************/

/****************************/


var $hero = (function () {

	var values = new Array();
	var changes = new Array();

	function assign(index,newVal,$el){

		var cv = values[index];
		var isChanged = false;
		newVal = newVal.replace(/[^0-9]/g,''); // only numbers

		if(cv != undefined && cv != newVal){

			//console.log("new",newVal,"old",cv,index);

			$el.addClass("change");

			var newValInt = toNumber(newVal);

			if(newValInt == newVal ){ // isInt

				if(newValInt > cv ){
					changes[index] = "up";
				} else if(newValInt < cv) { 
					changes[index] = "down";
				} else {
					changes[index] = "up";
				}

				newVal = newValInt;
			}

			isChanged = true;
		}

		// Arrows
		if(changes[index] == "up"){
			$el.addClass("up").removeClass("down");
		} else if (changes[index] == "down"){
			$el.addClass("down").removeClass("up");
		}

		// $el.prop('number',10).animateNumber({ number: 165 });
/*
		$el.animate({value:100},{
			duration:1000,
			easing:'easeOutQuint', //easeOutElastic
			step:knobcalc
		});
*/




		values[index] = newVal;

		return isChanged;
	}

	function toNumber(val) {
    	return Number(parseFloat(val));
	}
		
    return {
    	scan : function(){
    		var changes = false;
    		$(".hero-stats l + v").each(function(i,el){
         		changes = assign(i,$(el).text(),$(el).removeClass("change"));
         	});
         	if(changes) play(snds.onDataChange);
    	}
    }
 })();