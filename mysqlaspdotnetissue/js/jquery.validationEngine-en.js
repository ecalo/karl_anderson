

(function($) {
	$.fn.validationEngineLanguage = function() {};
	$.validationEngineLanguage = {
		newLang: function() {
			$.validationEngineLanguage.allRules = 	{"required":{    			// Add your regex rules here, you can take telephone as an example
						"regex":"none",
						"alertText":"* This field is required",
						"alertTextCheckboxMultiple":"* Please select an option",
						"alertTextCheckboxe":"* This checkbox is required"},
                    "range": {
                        "regex": "none",
                        "alertText": "* Numeric value between ",
                        "alertText2" : " and ",
                        "alertText3" : " allowed"
                        },
                    "dispnamecheck": {
                        "regex": "none",
                        "alertText": "* Invalid."
                        },
                    "csscheck": {
                        "regex": "none",
                        "alertText": "* Invalid."
                        },
                    "zipcode": {
                        "regex": "/^([0-9]{5})$/",
                        "alertText": "* Invalid Zipcode."
                        },
                    "matchexactword": {
                        "regex": "none",
                        "alertText": "* Invalid."
                        },
                    "matchexactcss": {
                        "regex": "none",
                        "alertText": "* Invalid."
                        },
                    "matchbadword": {
                        "regex": "none",
                        "alertText": "* Invalid."
                        },
					"length":{
						"regex":"none",
						"alertText":"*Between ",
						"alertText2":" and ",
						"alertText3": " characters allowed"},
					"maxCheckbox":{
						"regex":"none",
						"alertText":"* Checks allowed Exceeded"},	
					"minCheckbox":{
						"regex":"none",
						"alertText":"* Please select ",
						"alertText2":" options"},	
					"confirm":{
						"regex":"none",
						"alertText":"* Confirm field is not matching"},		
					"confirmsimple":{
						"regex":"none",
						"alertText":"* Value is not matching"},		
					"confirmsimpleemail":{
						"regex":"none",
						"alertText":"* The email entered does not match your current email address."},		
					"telephone":{
						"regex":"/^[0-9\-\(\)\ ]+$/",
						"alertText":"* Invalid phone number"},	
					"badword":{
						"regex":"/\b(?=\w)(fuck|hell)\b(?!\w)/i",
						"alertText":"* Bad word"},	
					"email":{
						"regex":"/^[a-zA-Z0-9_\.\-]+\@[a-zA-Z0-9\-\.]+[\.]{1}[a-zA-Z]{2,4}$/",
						"alertText":"* Invalid email address"},	
					"password":{
					    "regex":"/^.{6,50}$/",
						"alertText":"* Password must be at least 6 characters."},	
					"date":{
                         "regex":"/^[0-9]{4}\-\[0-9]{1,2}\-\[0-9]{1,2}$/",
                         "alertText":"* Invalid date, must be in YYYY-MM-DD format"},
					"onlyNumber":{
						"regex":"/^[0-9\ ]+$/",
						"alertText":"* Numbers only"},	
					"apyrange":{
						"regex":"/^\d+{1}(?:\.\d+)?$/",
						"alertText":"* APY must be between 0.1 and 9.9"},	
					"noSpecialCaracters":{
						"regex":"/^[0-9a-zA-Z]+$/",
						"alertText":"* No special caracters or spaces allowed"},	
					"ajaxUser":{
						"file":"validateUser.php",
						"extraData":"name=eric",
						"alertTextOk":"* This user is available",	
						"alertTextLoad":"* Loading, please wait",
						"alertText":"* This user is already taken"},	
					"ajaxName":{
						"file":"validateUser.php",
						"alertText":"* This name is already taken",
						"alertTextOk":"* This name is available",	
						"alertTextLoad":"* Loading, please wait"},		
					"onlyLetter":{
						"regex":"/^[a-zA-Z\ \']+$/",
						"alertText":"* Letters only"},
					"validate2fields":{
    					"nname":"validate2fields",
    					"alertText":"* You must have a firstname and a lastname"}	
					}	
					
		}
	}
})(jQuery);

$(document).ready(function() {	
	$.validationEngineLanguage.newLang()
});