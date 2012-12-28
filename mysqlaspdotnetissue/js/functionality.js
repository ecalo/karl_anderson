// general functionality

jQuery(function($) {


    //main navigation


    $("#main_nav").accordion({
        autoHeight: false,
        navigation: true,
        icons: { header: "plus", headerSelected: "minus" },
        header: 'h3'
    });

    $(".pane a").hover(function() {
        $(this).stop().animate({ "text-indent": "38px" }, 200, "swing");
    },
			function() {
			    $(this).stop().animate({ "text-indent": "30px" }, 400, "swing");

			});

    //			$('#main_nav h3').each(function() {
    //			alert(this.tagName);
    //    
    //        //alert(this.find('a'));
    //    });
    // main nav - set active link

    var url = window.location.toString();

    $('#main_nav a').each(function() {
        var myHref = $(this).attr('href');
        if (url.match(myHref)) {
            $(this).addClass('current_page');
            $(this).closest('ul').show();
            //alert(this);
            //            //alert($($($($(this).parent()[0]).parent()[0]).parent()[0]).attr("class"));
            //            //alert(this);
            //            $.ajax({
            //                type: "POST",
            //                url: "default.aspx/setmenu",
            //                //data: '{menuitem: "' + this + '"}',
            //                data: '{menuitem: "' + this + '",menugroup: "' + $($($($(this).parent()[0]).parent()[0]).parent()[0]).attr("class") + '"}',
            //                contentType: "application/json; charset=utf-8",
            //                async: false,
            //                dataType: "json",
            //                success: function(data) { },
            //                failure: function(response) {
            //                    alert(response.d);
            //                }
            //            });
        }
    });



    // form & normal buttons

    $("input:submit").each(function() {

        var val = $(this).attr("value");

        $(this).wrap("<span class='button'></span>").wrap("<span></span>");

        $(this).css("opacity", 0).attr("value", "").parent().append(val);

    });


    // add hover class

    $(".button, .subheader a, .top_icons li").hover(function() {
        $(this).addClass("hover");
    },

			function() {
			    $(this).removeClass("hover");
			});

    //add active class

    $(".button").mousedown(function() {
        $(this).addClass("active");
    });

    $(".button").mouseup(function() {
        $(this).removeClass("active");
    });

    // sort arrow

    //$(".subheader a").append("<span class='sort'></span>");




});                 //end jQuery