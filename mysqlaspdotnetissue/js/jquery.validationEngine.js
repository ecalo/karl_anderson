/*
 * Inline Form Validation Engine 1.7, jQuery plugin
 * 
 * Copyright(c) 2010, Cedric Dugas
 * http://www.position-relative.net
 *	
 * Form validation engine allowing custom regex rules to be added.
 * Thanks to Francois Duquette and Teddy Limousin 
 * and everyone helping me find bugs on the forum
 * Licenced under the MIT Licence
 */
 
(function($) {
	
	$.fn.validationEngine = function(settings) {
		
	if($.validationEngineLanguage){				// IS THERE A LANGUAGE LOCALISATION ?
		allRules = $.validationEngineLanguage.allRules;
	}else{
		$.validationEngine.debug("Validation engine rules are not loaded check your external file");
	}
 	settings = jQuery.extend({
		allrules:allRules,
		validationEventTriggers:"blur",					
		inlineValidation: true,	
		returnIsValid:false,
		liveEvent:false,
		openDebug: true,
		unbindEngine:true,
		containerOverflow:false,
		containerOverflowDOM:"",
		ajaxSubmit: false,
		scroll:false,
		promptPosition: "topRight",	// OPENNING BOX POSITION, IMPLEMENTED: topLeft, topRight, bottomLeft, centerRight, bottomRight
		success : false,
		beforeSuccess :  function() {},
		failure : function() {}
	}, settings);	
	$.validationEngine.settings = settings;
	$.validationEngine.ajaxValidArray = new Array();	// ARRAY FOR AJAX: VALIDATION MEMORY 
	
	if(settings.inlineValidation == true){ 		// Validating Inline ?
		if(!settings.returnIsValid){					// NEEDED FOR THE SETTING returnIsValid
			allowReturnIsvalid = false;
			if(settings.liveEvent){						// LIVE event, vast performance improvement over BIND
				$(this).find("[class*=validate]").live(settings.validationEventTriggers, function(caller){ 
					if($(caller).attr("type") != "checkbox") _inlinEvent(this);
				})
				$(this).find("[class*=validate][type=checkbox]").live("click", function(caller){ _inlinEvent(this); })
			}else{
				$(this).find("[class*=validate]").not("[type=checkbox]").bind(settings.validationEventTriggers, function(caller){ _inlinEvent(this); })
				$(this).find("[class*=validate][type=checkbox]").bind("click", function(caller){ _inlinEvent(this); })
			}
			firstvalid = false;
		}
			function _inlinEvent(caller){
				$.validationEngine.settings = settings;
				if($.validationEngine.intercept == false || !$.validationEngine.intercept){		// STOP INLINE VALIDATION THIS TIME ONLY
					$.validationEngine.onSubmitValid=false;
					$.validationEngine.loadValidation(caller); 
				}else{
					$.validationEngine.intercept = false;
				}
			}
	}
	if (settings.returnIsValid){		// Do validation and return true or false, it bypass everything;
		if ($.validationEngine.submitValidation(this,settings)){
			return false;
		}else{
			return true;
		}
	}
	$(this).bind("submit", function(caller){   // ON FORM SUBMIT, CONTROL AJAX FUNCTION IF SPECIFIED ON DOCUMENT READY
		$.validationEngine.onSubmitValid = true;
		$.validationEngine.settings = settings;
		if($.validationEngine.submitValidation(this,settings) == false){
			if($.validationEngine.submitForm(this,settings) == true) return false;
		}else{
			settings.failure && settings.failure(); 
			return false;
		}		
	})
	$(".formError").live("click",function(){	 // REMOVE BOX ON CLICK
		$(this).fadeOut(150,function(){		$(this).remove()	}) 
	})
};	
$.validationEngine = {
	defaultSetting : function(caller) {		// NOT GENERALLY USED, NEEDED FOR THE API, DO NOT TOUCH
		if($.validationEngineLanguage){				
			allRules = $.validationEngineLanguage.allRules;
		}else{
			$.validationEngine.debug("Validation engine rules are not loaded check your external file");
		}	
		settings = {
			allrules:allRules,
			validationEventTriggers:"blur",					
			inlineValidation: true,	
			containerOverflow:false,
			containerOverflowDOM:"",
			returnIsValid:false,
			scroll:true,
			unbindEngine:true,
			ajaxSubmit: false,
			promptPosition: "topRight",	// OPENNING BOX POSITION, IMPLEMENTED: topLeft, topRight, bottomLeft, centerRight, bottomRight
			success : false,
			failure : function() {}
		}	
		$.validationEngine.settings = settings;
	},
	loadValidation : function(caller) {		// GET VALIDATIONS TO BE EXECUTED
		if(!$.validationEngine.settings) $.validationEngine.defaultSetting()
		rulesParsing = $(caller).attr('class');
		rulesRegExp = /\[(.*)\]/;
		getRules = rulesRegExp.exec(rulesParsing);
		if(getRules == null) return false;
		str = getRules[1];
		pattern = /\[|,|\]/;
		result= str.split(pattern);	
		var validateCalll = $.validationEngine.validateCall(caller,result)
		return validateCalll;
	},
	validateCall : function(caller,rules) {	// EXECUTE VALIDATION REQUIRED BY THE USER FOR THIS FIELD
		var promptText =""	
		
		if(!$(caller).attr("id")) $.validationEngine.debug("This field have no ID attribut( name & class displayed): "+$(caller).attr("name")+" "+$(caller).attr("class"))

		caller = caller;
		ajaxValidate = false;
		var callerName = $(caller).attr("name");
		$.validationEngine.isError = false;
		$.validationEngine.showTriangle = true;
		callerType = $(caller).attr("type");

		for (i=0; i<rules.length;i++){
			switch (rules[i]){
			case "optional": 
				if(!$(caller).val()){
					$.validationEngine.closePrompt(caller);
					return $.validationEngine.isError;
				}
			break;
			case "required": 
				_required(caller,rules);
			break;
			case "custom": 
				 _customRegex(caller,rules,i);
			break;
			case "exemptString": 
				 _exemptString(caller,rules,i);
			break;
			case "ajax": 
				if(!$.validationEngine.onSubmitValid) _ajax(caller,rules,i);	
			break;
			case "length": 
				 _length(caller,rules,i);
			break;
            case "range":
            _range(caller, rules, i);
            break;
            case "matchbadword":
            _matchbadword(caller);
            break;
            case "matchexactword":
            _matchexactword(caller);
            break;
            case "matchexactcss":
            _matchexactcss(caller);
            break;
            case "dispnamecheck":
            _dispnamecheck(caller);
            break;
            case "csscheck":
            _csscheck(caller);
            break;
			case "maxCheckbox": 
				_maxCheckbox(caller,rules,i);
			 	groupname = $(caller).attr("name");
			 	caller = $("input[name='"+groupname+"']");
			break;
			case "minCheckbox": 
				_minCheckbox(caller,rules,i);
				groupname = $(caller).attr("name");
			 	caller = $("input[name='"+groupname+"']");
			break;
			case "confirm": 
				 _confirm(caller,rules,i);
			break;
			case "confirmsimple": 
				 _confirmsimple(caller,rules,i);
			break;
			case "confirmsimpleemail": 
				 _confirmsimpleemail(caller,rules,i);
			break;
			case "funcCall": 
		     	_funcCall(caller,rules,i);
			break;
			default :;
			};
		};
		radioHack();
		if ($.validationEngine.isError == true){
			var linkTofieldText = "." +$.validationEngine.linkTofield(caller);
			if(linkTofieldText != "."){
				if(!$(linkTofieldText)[0]){
					$.validationEngine.buildPrompt(caller,promptText,"error")
				}else{	
					$.validationEngine.updatePromptText(caller,promptText);
				}	
			}else{
				$.validationEngine.updatePromptText(caller,promptText);
			}
		}else{
			$.validationEngine.closePrompt(caller);
		}			
		/* UNFORTUNATE RADIO AND CHECKBOX GROUP HACKS */
		/* As my validation is looping input with id's we need a hack for my validation to understand to group these inputs */
		function radioHack(){
	      if($("input[name='"+callerName+"']").size()> 1 && (callerType == "radio" || callerType == "checkbox")) {        // Hack for radio/checkbox group button, the validation go the first radio/checkbox of the group
	          caller = $("input[name='"+callerName+"'][type!=hidden]:first");     
	          $.validationEngine.showTriangle = false;
	      }      
	    }
		/* VALIDATION FUNCTIONS */
		function _required(caller,rules){   // VALIDATE BLANK FIELD
			callerType = $(caller).attr("type");
			if (callerType == "text" || callerType == "password" || callerType == "textarea"){
								
				if(!$(caller).val()){
					$.validationEngine.isError = true;
					promptText += $.validationEngine.settings.allrules[rules[i]].alertText+"<br />";
				}	
			}	
			if (callerType == "radio" || callerType == "checkbox" ){
				callerName = $(caller).attr("name");
		
				if($("input[name='"+callerName+"']:checked").size() == 0) {
					$.validationEngine.isError = true;
					if($("input[name='"+callerName+"']").size() ==1) {
						promptText += $.validationEngine.settings.allrules[rules[i]].alertTextCheckboxe+"<br />"; 
					}else{
						 promptText += $.validationEngine.settings.allrules[rules[i]].alertTextCheckboxMultiple+"<br />";
					}	
				}
			}	
			if (callerType == "select-one") { // added by paul@kinetek.net for select boxes, Thank you		
				if(!$(caller).val()) {
					$.validationEngine.isError = true;
					promptText += $.validationEngine.settings.allrules[rules[i]].alertText+"<br />";
				}
			}
			if (callerType == "select-multiple") { // added by paul@kinetek.net for select boxes, Thank you	
				if(!$(caller).find("option:selected").val()) {
					$.validationEngine.isError = true;
					promptText += $.validationEngine.settings.allrules[rules[i]].alertText+"<br />";
				}
			}
		}
		function _customRegex(caller,rules,position){		 // VALIDATE REGEX RULES
			customRule = rules[position+1];
			pattern = eval($.validationEngine.settings.allrules[customRule].regex);
			
			if(!pattern.test($(caller).attr('value'))){
				$.validationEngine.isError = true;
				promptText += $.validationEngine.settings.allrules[customRule].alertText+"<br />";
			}
		}
		function _exemptString(caller,rules,position){		 // VALIDATE REGEX RULES
			customString = rules[position+1];
			if(customString == $(caller).attr('value')){
				$.validationEngine.isError = true;
				promptText += $.validationEngine.settings.allrules['required'].alertText+"<br />";
			}
		}
		
		function _funcCall(caller,rules,position){  		// VALIDATE CUSTOM FUNCTIONS OUTSIDE OF THE ENGINE SCOPE
			customRule = rules[position+1];
			funce = $.validationEngine.settings.allrules[customRule].nname;
			
			var fn = window[funce];
			if (typeof(fn) === 'function'){
				var fn_result = fn();
				if(!fn_result){
					$.validationEngine.isError = true;
				}
				
				promptText += $.validationEngine.settings.allrules[customRule].alertText+"<br />";
			}
		}
		function _ajax(caller,rules,position){				 // VALIDATE AJAX RULES
			
			customAjaxRule = rules[position+1];
			postfile = $.validationEngine.settings.allrules[customAjaxRule].file;
			fieldValue = $(caller).val();
			ajaxCaller = caller;
			fieldId = $(caller).attr("id");
			ajaxValidate = true;
			ajaxisError = $.validationEngine.isError;
			
			if($.validationEngine.settings.allrules[customAjaxRule].extraData){
				extraData = $.validationEngine.settings.allrules[customAjaxRule].extraData;
			}else{
				extraData = "";
			}
			/* AJAX VALIDATION HAS ITS OWN UPDATE AND BUILD UNLIKE OTHER RULES */	
			if(!ajaxisError){
				$.ajax({
				   	type: "POST",
				   	url: postfile,
				   	async: true,
				   	data: "validateValue="+fieldValue+"&validateId="+fieldId+"&validateError="+customAjaxRule+"&extraData="+extraData,
				   	beforeSend: function(){		// BUILD A LOADING PROMPT IF LOAD TEXT EXIST		   			
				   		if($.validationEngine.settings.allrules[customAjaxRule].alertTextLoad){
				   		
				   			if(!$("div."+fieldId+"formError")[0]){				   				
	 			 				return $.validationEngine.buildPrompt(ajaxCaller,$.validationEngine.settings.allrules[customAjaxRule].alertTextLoad,"load");
	 			 			}else{
	 			 				$.validationEngine.updatePromptText(ajaxCaller,$.validationEngine.settings.allrules[customAjaxRule].alertTextLoad,"load");
	 			 			}
			   			}
			  	 	},
			  	 	error: function(data,transport){ $.validationEngine.debug("error in the ajax: "+data.status+" "+transport) },
					success: function(data){					// GET SUCCESS DATA RETURN JSON
						data = eval( "("+data+")");				// GET JSON DATA FROM PHP AND PARSE IT
						ajaxisError = data.jsonValidateReturn[2];
						customAjaxRule = data.jsonValidateReturn[1];
						ajaxCaller = $("#"+data.jsonValidateReturn[0])[0];
						fieldId = ajaxCaller;
						ajaxErrorLength = $.validationEngine.ajaxValidArray.length;
						existInarray = false;
						
			 			 if(ajaxisError == "false"){			// DATA FALSE UPDATE PROMPT WITH ERROR;
			 			 	
			 			 	_checkInArray(false)				// Check if ajax validation alreay used on this field
			 			 	
			 			 	if(!existInarray){		 			// Add ajax error to stop submit		 		
				 			 	$.validationEngine.ajaxValidArray[ajaxErrorLength] =  new Array(2);
				 			 	$.validationEngine.ajaxValidArray[ajaxErrorLength][0] = fieldId;
				 			 	$.validationEngine.ajaxValidArray[ajaxErrorLength][1] = false;
				 			 	existInarray = false;
			 			 	}
				
			 			 	$.validationEngine.ajaxValid = false;
							promptText += $.validationEngine.settings.allrules[customAjaxRule].alertText+"<br />";
							$.validationEngine.updatePromptText(ajaxCaller,promptText,"",true);				
						 }else{	 
						 	_checkInArray(true);
						 	$.validationEngine.ajaxValid = true; 			
						 	if(!customAjaxRule)	{$.validationEngine.debug("wrong ajax response, are you on a server or in xampp? if not delete de ajax[ajaxUser] validating rule from your form ")}		   
						 	if($.validationEngine.settings.allrules[customAjaxRule].alertTextOk){	// NO OK TEXT MEAN CLOSE PROMPT	 			
	 			 				 				$.validationEngine.updatePromptText(ajaxCaller,$.validationEngine.settings.allrules[customAjaxRule].alertTextOk,"pass",true);
 			 				}else{
				 			 	ajaxValidate = false;		 	
				 			 	$.validationEngine.closePrompt(ajaxCaller);
 			 				}		
			 			 }
			 			function  _checkInArray(validate){
			 				for(x=0;x<ajaxErrorLength;x++){
			 			 		if($.validationEngine.ajaxValidArray[x][0] == fieldId){
			 			 			$.validationEngine.ajaxValidArray[x][1] = validate;
			 			 			existInarray = true;
			 			 		
			 			 		}
			 			 	}
			 			}
			 		}				
				});
			}
		}
		function _confirm(caller,rules,position){		 // VALIDATE FIELD MATCH
			confirmField = rules[position+1];
			if($(caller).attr('value') != $("[id$='_" + confirmField + "']").attr('value')){
				$.validationEngine.isError = true;
				promptText += $.validationEngine.settings.allrules["confirm"].alertText+"<br />";
			}
		}
		function _confirmsimple(caller,rules,position){		 // VALIDATE FIELD MATCH
			confirmField = rules[position+1];
			if($(caller).attr('value').toUpperCase() != $("#" + confirmField).attr('value').toUpperCase())
			{
				$.validationEngine.isError = true;
				promptText += $.validationEngine.settings.allrules["confirmsimple"].alertText+"<br />";
			}
		}		
		function _confirmsimpleemail(caller,rules,position){		 // VALIDATE FIELD MATCH
			confirmField = rules[position+1];
			if($(caller).attr('value') != $("#" + confirmField).attr('value')){
				$.validationEngine.isError = true;
				promptText += $.validationEngine.settings.allrules["confirmsimpleemail"].alertText+"<br />";
			}
		}		
		function _length(caller,rules,position){    	  // VALIDATE LENGTH
		
			startLength = eval(rules[position+1]);
			endLength = eval(rules[position+2]);
			feildLength = $(caller).attr('value').length;

			if(feildLength<startLength || feildLength>endLength){
				$.validationEngine.isError = true;
				promptText += $.validationEngine.settings.allrules["length"].alertText+startLength+$.validationEngine.settings.allrules["length"].alertText2+endLength+$.validationEngine.settings.allrules["length"].alertText3+"<br />"
			}
		}
		function _maxCheckbox(caller,rules,position){  	  // VALIDATE CHECKBOX NUMBER
		
			nbCheck = eval(rules[position+1]);
			groupname = $(caller).attr("name");
			groupSize = $("input[name='"+groupname+"']:checked").size();
			if(groupSize > nbCheck){	
				$.validationEngine.showTriangle = false;
				$.validationEngine.isError = true;
				promptText += $.validationEngine.settings.allrules["maxCheckbox"].alertText+"<br />";
			}
		}
		function _minCheckbox(caller,rules,position){  	  // VALIDATE CHECKBOX NUMBER
		
			nbCheck = eval(rules[position+1]);
			groupname = $(caller).attr("name");
			groupSize = $("input[name='"+groupname+"']:checked").size();
			if(groupSize < nbCheck){	
			
				$.validationEngine.isError = true;
				$.validationEngine.showTriangle = false;
				promptText += $.validationEngine.settings.allrules["minCheckbox"].alertText+" "+nbCheck+" "+$.validationEngine.settings.allrules["minCheckbox"].alertText2+"<br />";
			}
		}
		function _range(caller, rules, position) { // VALIDATE RANGE
            customRule = rules[position];
            startRange = eval(rules[position + 1]);
            endRange = eval(rules[position + 2]);


            pattern = eval("/^[0-9.]+$/");//$.validationEngine.settings.allrules[customRule].regex);

            if (!pattern.test($(caller).attr('value'))) {
            $.validationEngine.isError = true;
            promptText += $.validationEngine.settings.allrules["range"].alertText + startRange + $.validationEngine.settings.allrules["range"].alertText2 + endRange + $.validationEngine.settings.allrules["range"].alertText3 + ""
            }
            else {
                fieldValue = $(caller).attr('value');

                if (fieldValue < startRange) {
                $.validationEngine.isError = true;
                promptText += $.validationEngine.settings.allrules["range"].alertText + startRange + $.validationEngine.settings.allrules["range"].alertText2 + endRange + $.validationEngine.settings.allrules["range"].alertText3 + ""
                }

                if (fieldValue > endRange) {
                $.validationEngine.isError = true;
                promptText += $.validationEngine.settings.allrules["range"].alertText + startRange + $.validationEngine.settings.allrules["range"].alertText2 + endRange + $.validationEngine.settings.allrules["range"].alertText3 + ""
                }
            }
        }
		function _matchbadword(caller) { // VALIDATE bad words - any form!
            //pattern = eval("/^[bad]$/");//$.validationEngine.settings.allrules[customRule].regex);
            patt1 = /admin|death|die|anus|arse|arsehole|cunt|asshat|assjabber|asspirate|assbag|assbandit|assbanger|assbite|assclown|asscock|asscracker|asses|assface|assfuck|assfucker|assgoblin|asshat|asshead|asshole|asshopper|assjacker|asslick|asslicker|assmonkey|assmunch|assmuncher|assnigger|asspirate|assshit|assshole|asssucker|asswad|asswipe|bampot|bastard|beaner|bitch|bitchass|bitches|bitchtits|bitchy|blowjob|blowjob|bollocks|bollox|boner|brotherfucker|bullshit|bumblefuck|buttplug|buttpirate|buttfucka|buttfucker|cameltoe|carpetmuncher|chinc|chink|choad|chode|clitface|clitfuck|clusterfuck|cockass|cockbite|cockburger|cockface|cockfucker|cockhead|cockjockey|cockknoker|cockmaster|cockmongler|cockmongruel|cockmonkey|cockmuncher|cocknugget|cockshit|cocksmith|cocksmoke|cocksmoker|cocksniffer|cocksucker|cockwaffle|coochie|coochy|cooter|cumbubble|cumdumpster|cumguzzler|cumjockey|cumslut|cumtart|cunnie|cunnilingus|cuntass|cuntface|cunthole|cuntlicker|cuntrag|cuntslut|dago|damn|deggo|dickbag|dickbeaters|dickface|dickfuck|dickfucker|dickhead|dickhole|dckjuice|dickmilk|dickmonger|dicks|dickslap|dicksucker|dicksucking|dickwad|dickweasel|dickweed|dickwod|dike|dildo|dipshit|doochbag|dookie|douche|dumass|dumbass|dumbfuck|dumbshit|dumshit|dyke|fagbag|fagfucker|faggit|faggot|fagget|fagtard|fatass|fellatio|feltch|flamer|fuck|FUCK|FFUUCCKK|fudgepacker|gayass|gaybob|gaydo|gayfuck|gayfuckist|gaylord|gaytard|gaywad|goddamn|goddamnit|gooch|gook|gringo|guido|handjob|hate|hardon|heeb|homodumbshit|honkey|humping|jackass|jerkoff|jigaboo|junglebunny|kike|kooch|kootch|kraut|kunt|kyke|kill|lameass|lesbian|lesbo|lezzie|minge|muffdiver|munging|molester|murder|negro|nigaboo|nigga|nigger|niggers|niglet|nutsack|panooch|pecker|penis|pissed|pissflaps|polesmoker|pollock|poon|poonani|poonany|poontang|porch|porchmonkey|prick|punanny|punta|pussies|pussy|puto|queef|queer|renob|rimjob|ruski|rape|schlong|scrote|shit|sheit|shiz|shiznit|skank|skeet|skullfuck|slut|Sucks|smeg|snatch|spic|spick|splooge|spook|suckass|tard|testicle|thundercunt|titfuck|tittyfuck|twat|vajj|vag|vagina|vajayjay|vjayjay|wank|wankjob|wetback|whore|whorebag|whoreface|wop|siteowner|sitemanager|moderator|censor|FDIC|NCUA|JoshKalkbrenner|Jkalkbrenner|JoshuaKalkbrenner|JoshuaBKalkbrenner|SarahKalkbrenner|SKalkbrenner|MandarOak|MOak|ThomasGlah|TGlah|AlinaKanevsky|AKanevsky|InstntIntell|InstantIntel|SpotBank|BofA/gi;
                //if (pattern.test($(caller).attr('value'))) {
                if ($(caller).attr('value').toLowerCase().match(patt1) != null) {
                $.validationEngine.isError = true;
                promptText += $.validationEngine.settings.allrules["matchbadword"].alertText + ""
                }
        }
		function _matchexactword(caller) { // VALIDATE exact bad words - so bad is not allowed but bada is..
                //patt1 = /^bad$/;
                patt1 = "\\bbad\\b|\\bcrap\\b";
                //if (pattern.test($(caller).attr('value'))) {
                if ($(caller).attr('value').toLowerCase().match(patt1) != null) {
                $.validationEngine.isError = true;
                promptText += $.validationEngine.settings.allrules["matchexactword"].alertText + ""
                }
        }
		function _dispnamecheck(caller) { // VALIDATE exact bad words - so bad is not allowed but bada is..
                //patt1 = /^bad$/;
                //patt1 = "\\bbad\\b|\\bcrap\\b|\\badmin\\b|\\bbank\\b|\\bspotbank\\b|\\bspot\\b|\\bad min\\b|\\bspot-bank\\b|\\bspot_bank\\b|\\bspot bank\\b|\\bcrap\\b|\\bspotbanks\\b|\\ba d m i n\\b|\\badministrator\\b";
                patt1 = "\\bcum\\b|\\bass\\b|\\bcracker\\b|\\bcoon\\b|\\bcock\\b|\\bclit\\b|\\bbutt\\b|\\bFU\\b|\\bFAG\\b|\\bdick\\b|\\bgay\\b|\\bHELL\\b|\\bHO\\b|\\bHoe\\b|\\bshit\b|\\bmuff\\b|\\bpiss\\b|\\btit\\b|\\btits\\b|\\bdie\\b|\\bdeath\\b";
                //if (pattern.test($(caller).attr('value'))) {
                if ($(caller).attr('value').toLowerCase().match(patt1) != null) {
                $.validationEngine.isError = true;
                promptText += $.validationEngine.settings.allrules["dispnamecheck"].alertText + ""
                }
        }
		function _csscheck(caller) { // VALIDATE cross site tags etc
                patt1 = "\\<img\\b|\\<script\\b|\\<body\\b|\\<<script\\b|\\<input\\b|\\<link\\b|\\<meta\\b|\\<%\\b";
                //if (pattern.test($(caller).attr('value'))) {
                if ($(caller).attr('value').toLowerCase().match(patt1) != null) {
                $.validationEngine.isError = true;
                promptText += $.validationEngine.settings.allrules["csscheck"].alertText + ""
                }
        }
		function _matchexactcss(caller) { // VALIDATE exact bad words - so bad is not allowed but bada is..
                //patt1 = /^bad$/;
                patt1 = "<%";
                //if (pattern.test($(caller).attr('value'))) {
                if ($(caller).attr('value').toLowerCase().match(patt1) != null) {
                $.validationEngine.isError = true;
                promptText += $.validationEngine.settings.allrules["matchexactcss"].alertText + ""
                }
        }
		return ($.validationEngine.isError) ? $.validationEngine.isError : false;
	},
	submitForm : function(caller){
		if($.validationEngine.settings.ajaxSubmit){		
			if($.validationEngine.settings.ajaxSubmitExtraData){
				extraData = $.validationEngine.settings.ajaxSubmitExtraData;
			}else{
				extraData = "";
			}
			$.ajax({
			   	type: "POST",
			   	url: $.validationEngine.settings.ajaxSubmitFile,
			   	async: true,
			   	data: $(caller).serialize()+"&"+extraData,
			   	error: function(data,transport){ $.validationEngine.debug("error in the ajax: "+data.status+" "+transport) },
			   	success: function(data){
			   		if(data == "true"){			// EVERYTING IS FINE, SHOW SUCCESS MESSAGE
			   			$(caller).css("opacity",1)
			   			$(caller).animate({opacity: 0, height: 0}, function(){
			   				$(caller).css("display","none");
			   				$(caller).before("<div class='ajaxSubmit'>"+$.validationEngine.settings.ajaxSubmitMessage+"</div>");
			   				$.validationEngine.closePrompt(".formError",true); 	
			   				$(".ajaxSubmit").show("slow");
			   				if ($.validationEngine.settings.success){	// AJAX SUCCESS, STOP THE LOCATION UPDATE
								$.validationEngine.settings.success && $.validationEngine.settings.success(); 
								return false;
							}
			   			})
		   			}else{						// HOUSTON WE GOT A PROBLEM (SOMETING IS NOT VALIDATING)
			   			data = eval( "("+data+")");	
			   			if(!data.jsonValidateReturn){
			   				 $.validationEngine.debug("you are not going into the success fonction and jsonValidateReturn return nothing");
			   			}
			   			errorNumber = data.jsonValidateReturn.length	
			   			for(index=0; index<errorNumber; index++){	
			   				fieldId = data.jsonValidateReturn[index][0];
			   				promptError = data.jsonValidateReturn[index][1];
			   				type = data.jsonValidateReturn[index][2];
			   				$.validationEngine.buildPrompt(fieldId,promptError,type);
		   				}
	   				}
   				}
			})	
			return true;
		}
		// LOOK FOR BEFORE SUCCESS METHOD		
			if(!$.validationEngine.settings.beforeSuccess()){
				if ($.validationEngine.settings.success){	// AJAX SUCCESS, STOP THE LOCATION UPDATE
					if($.validationEngine.settings.unbindEngine){ $(caller).unbind("submit") }
					$.validationEngine.settings.success && $.validationEngine.settings.success(); 
					return true;
				}
			}else{
				return true;
			} 
		return false;
	},
	buildPrompt : function(caller,promptText,type,ajaxed) {			// ERROR PROMPT CREATION AND DISPLAY WHEN AN ERROR OCCUR
		if(!$.validationEngine.settings){
			$.validationEngine.defaultSetting()
		}
		deleteItself = "." + $(caller).attr("id") + "formError"
	
		if($(deleteItself)[0]){
			$(deleteItself).stop();
			$(deleteItself).remove();
		}
		var divFormError = document.createElement('div');
		var formErrorContent = document.createElement('div');
		linkTofield = $.validationEngine.linkTofield(caller)
		$(divFormError).addClass("formError")
		
		if(type == "pass") $(divFormError).addClass("greenPopup")
		if(type == "load") $(divFormError).addClass("blackPopup")
		if(ajaxed) $(divFormError).addClass("ajaxed")
		
		$(divFormError).addClass(linkTofield);
		$(formErrorContent).addClass("formErrorContent");
		
		if($.validationEngine.settings.containerOverflow){		// Is the form contained in an overflown container?
			$(caller).before(divFormError);
		}else{
			$("body").append(divFormError);
		}
		
		$(divFormError).append(formErrorContent);
			
		if($.validationEngine.showTriangle != false){		// NO TRIANGLE ON MAX CHECKBOX AND RADIO
			var arrow = document.createElement('div');
			$(arrow).addClass("formErrorArrow");
			$(divFormError).append(arrow);
			if($.validationEngine.settings.promptPosition == "bottomLeft" || $.validationEngine.settings.promptPosition == "bottomRight"){
			$(arrow).addClass("formErrorArrowBottom")
			$(arrow).html('<div class="line1"><!-- --></div><div class="line2"><!-- --></div><div class="line3"><!-- --></div><div class="line4"><!-- --></div><div class="line5"><!-- --></div><div class="line6"><!-- --></div><div class="line7"><!-- --></div><div class="line8"><!-- --></div><div class="line9"><!-- --></div><div class="line10"><!-- --></div>');
		}
			if($.validationEngine.settings.promptPosition == "topLeft" || $.validationEngine.settings.promptPosition == "topRight"){
				$(divFormError).append(arrow);
				$(arrow).html('<div class="line10"><!-- --></div><div class="line9"><!-- --></div><div class="line8"><!-- --></div><div class="line7"><!-- --></div><div class="line6"><!-- --></div><div class="line5"><!-- --></div><div class="line4"><!-- --></div><div class="line3"><!-- --></div><div class="line2"><!-- --></div><div class="line1"><!-- --></div>');
			}
		}
		$(formErrorContent).html(promptText)
		
		var calculatedPosition = $.validationEngine.calculatePosition(caller,promptText,type,ajaxed,divFormError)
		
		calculatedPosition.callerTopPosition +="px";
		calculatedPosition.callerleftPosition +="px";
		calculatedPosition.marginTopSize +="px"
		$(divFormError).css({
			"top":calculatedPosition.callerTopPosition,
			"left":calculatedPosition.callerleftPosition,
			"marginTop":calculatedPosition.marginTopSize,
			"opacity":0
		})
		return $(divFormError).animate({"opacity":0.87},function(){return true;});	
	},
	updatePromptText : function(caller,promptText,type,ajaxed) {	// UPDATE TEXT ERROR IF AN ERROR IS ALREADY DISPLAYED
		
		linkTofield = $.validationEngine.linkTofield(caller);
		var updateThisPrompt =  "."+linkTofield;
		
		if(type == "pass") { $(updateThisPrompt).addClass("greenPopup") }else{ $(updateThisPrompt).removeClass("greenPopup")};
		if(type == "load") { $(updateThisPrompt).addClass("blackPopup") }else{ $(updateThisPrompt).removeClass("blackPopup")};
		if(ajaxed) { $(updateThisPrompt).addClass("ajaxed") }else{ $(updateThisPrompt).removeClass("ajaxed")};
	
		$(updateThisPrompt).find(".formErrorContent").html(promptText);
		
		var calculatedPosition = $.validationEngine.calculatePosition(caller,promptText,type,ajaxed,updateThisPrompt)
		
		calculatedPosition.callerTopPosition +="px";
		calculatedPosition.callerleftPosition +="px";
		calculatedPosition.marginTopSize +="px"
		$(updateThisPrompt).animate({ "top":calculatedPosition.callerTopPosition,"marginTop":calculatedPosition.marginTopSize });
	},
	calculatePosition : function(caller,promptText,type,ajaxed,divFormError){
		
		if($.validationEngine.settings.containerOverflow){		// Is the form contained in an overflown container?
			callerTopPosition = 0;
			callerleftPosition = 0;
			callerWidth =  $(caller).width();
			inputHeight = $(divFormError).height();					// compasation for the triangle
			var marginTopSize = "-"+inputHeight;
		}else{
			callerTopPosition = $(caller).offset().top;
			callerleftPosition = $(caller).offset().left;
			callerWidth =  $(caller).width();
			inputHeight = $(divFormError).height();
			var marginTopSize = 0;
		}
		
		/* POSITIONNING */
		if($.validationEngine.settings.promptPosition == "topRight"){ 
			if($.validationEngine.settings.containerOverflow){		// Is the form contained in an overflown container?
				callerleftPosition += callerWidth -30;
			}else{
				callerleftPosition +=  callerWidth -30; 
				callerTopPosition += -inputHeight; 
			}
		}
		if($.validationEngine.settings.promptPosition == "topLeft"){ callerTopPosition += -inputHeight -10; }
		
		if($.validationEngine.settings.promptPosition == "centerRight"){ callerleftPosition +=  callerWidth +13; }
		
		if($.validationEngine.settings.promptPosition == "bottomLeft"){
			callerHeight =  $(caller).height();
			callerTopPosition = callerTopPosition + callerHeight + 15;
		}
		if($.validationEngine.settings.promptPosition == "bottomRight"){
			callerHeight =  $(caller).height();
			callerleftPosition +=  callerWidth -30;
			callerTopPosition +=  callerHeight +5;
		}
		return {
			"callerTopPosition":callerTopPosition,
			"callerleftPosition":callerleftPosition,
			"marginTopSize":marginTopSize
		}
	},
	linkTofield : function(caller){
		var linkTofield = $(caller).attr("id") + "formError";
		linkTofield = linkTofield.replace(/\[/g,""); 
		linkTofield = linkTofield.replace(/\]/g,"");
		return linkTofield;
	},
	closePrompt : function(caller,outside) {						// CLOSE PROMPT WHEN ERROR CORRECTED
		if(!$.validationEngine.settings){
			$.validationEngine.defaultSetting()
		}
		if(outside){
			$(caller).fadeTo("fast",0,function(){
				$(caller).remove();
			});
			return false;
		}
		if(typeof(ajaxValidate)=='undefined'){ajaxValidate = false}
		if(!ajaxValidate){
			linkTofield = $.validationEngine.linkTofield(caller);
			closingPrompt = "."+linkTofield;
			$(closingPrompt).fadeTo("fast",0,function(){
				$(closingPrompt).remove();
			});
		}
	},
	debug : function(error) {
		if(!$.validationEngine.settings.openDebug) return false;
		if(!$("#debugMode")[0]){
			$("body").append("<div id='debugMode'><div class='debugError'><strong>This is a debug mode, you got a problem with your form, it will try to help you, refresh when you think you nailed down the problem</strong></div></div>");
		}
		$(".debugError").append("<div class='debugerror'>"+error+"</div>");
	},			
	submitValidation : function(caller) {					// FORM SUBMIT VALIDATION LOOPING INLINE VALIDATION
		var stopForm = false;
		$.validationEngine.ajaxValid = true;
		var toValidateSize = $(caller).find("[class*=validate]").size();
		
		$(caller).find("[class*=validate]").each(function(){
			linkTofield = $.validationEngine.linkTofield(this);
			
			if(!$("."+linkTofield).hasClass("ajaxed")){	// DO NOT UPDATE ALREADY AJAXED FIELDS (only happen if no normal errors, don't worry)
				var validationPass = $.validationEngine.loadValidation(this);
				return(validationPass) ? stopForm = true : "";					
			};
		});
		ajaxErrorLength = $.validationEngine.ajaxValidArray.length;		// LOOK IF SOME AJAX IS NOT VALIDATE
		for(x=0;x<ajaxErrorLength;x++){
	 		if($.validationEngine.ajaxValidArray[x][1] == false) $.validationEngine.ajaxValid = false;
 		}
		if(stopForm || !$.validationEngine.ajaxValid){		// GET IF THERE IS AN ERROR OR NOT FROM THIS VALIDATION FUNCTIONS
			if($.validationEngine.settings.scroll){
				if(!$.validationEngine.settings.containerOverflow){
					var destination = $(".formError:not('.greenPopup'):first").offset().top;
					$(".formError:not('.greenPopup')").each(function(){
						testDestination = $(this).offset().top;
						if(destination>testDestination) destination = $(this).offset().top;
					})
					$("html:not(:animated),body:not(:animated)").animate({ scrollTop: destination}, 1100);
				}else{
					var destination = $(".formError:not('.greenPopup'):first").offset().top;
					var scrollContainerScroll = $($.validationEngine.settings.containerOverflowDOM).scrollTop();
					var scrollContainerPos = - parseInt($($.validationEngine.settings.containerOverflowDOM).offset().top);
					var destination = scrollContainerScroll + destination + scrollContainerPos -5
					var scrollContainer = $.validationEngine.settings.containerOverflowDOM+":not(:animated)"
					
					$(scrollContainer).animate({ scrollTop: destination}, 1100);
				}
			}
			return true;
		}else{
			return false;
		}
	}
}
})(jQuery);