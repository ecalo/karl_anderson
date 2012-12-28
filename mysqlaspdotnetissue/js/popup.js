jQuery(function($){
						   
// Here we will write a function when link click under class popup				   
$('.popup').click(function() {
									
									
// Here we will describe a variable popupid which gets the
// rel attribute from the clicked link							
var popupid = $(this).attr('rel');


// Now we need to popup the marked which belongs to the rel attribute
// Suppose the rel attribute of click link is popuprel then here in below code
// #popuprel will fadein
$('#' + popupid).fadeIn();


// append div with id fade into the bottom of body tag
$('#overlay').css({'filter' : 'alpha(opacity=80)'}).fadeIn();


// Now here we need to have our popup box in center of 
// webpage when its fadein. so we add 10px to height and width 
var popuptopmargin = ($('#' + popupid).height()) / 2;
var popupleftmargin = ($('#' + popupid).width()) / 2;


// Then using .css function style our popup box for center allignment
$('#' + popupid).css({
'margin-top' : -popuptopmargin,
'margin-left' : -popupleftmargin
}).addClass("visible");

});


// Now define one more function which is used to fadeout the 
// fade layer and popup window as soon as we click on fade layer

$("#close_popup1").click(function() {
	
	$("#popup1").fadeOut();
	
	})


$('#overlay, .close, .close_popup').click(function() {


// Add markup ids of all custom popup box here 						  
$('#overlay, .popupbox').fadeOut();
});


});