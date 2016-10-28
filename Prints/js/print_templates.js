var PrintTemplates = {
	isLoaded : false,
	data : null,
	options : { },
	init : function (opt){
		this.options = opt;
		//document.getElementById(opt.container).innerHTML = '<embed allowscriptaccess="always" type="application/x-shockwave-flash" id="Toolpar_Checks" FlashVars="debug='+opt.debug+'" src="'+opt.swf+'"'+(!opt.debug?' width="0" height="0"':' width="538" height="785"')+' style="border:1px solid #ccc; position:fixed; margin:-400px 0 0 -270px; top:50%; left:50%"/>';
	},
	print : function (data){
		if(!this.isLoaded){
			this.data = data;
			return;
		}
		console.log('print',data);
    	//return window["Toolpar_Checks"].printTemplate(data.type,data.data,(data.print?data.print:(this.options.debug?'no':'yes')));
    },		    
    definition : function (a){
    	//return window["Toolpar_Checks"].getDefinition(a);
    },
    onLoad : function (){
    	console.log('loaded');
    	this.isLoaded = true;
    	if(this.data) this.print(this.data);
    	
    }
}